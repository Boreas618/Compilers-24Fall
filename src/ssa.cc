#include "ssa.h"

#include <bitset>
#include <cassert>
#include <iostream>
#include <list>
#include <stack>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>

#include "block_graph.h"
#include "graph.h"
#include "ir_printer.h"
#include "liveness.h"

using liveness::LivenessAnalysis;

const int bitN = 1000;
std::bitset<bitN> dom[bitN];

void SSAWorker::ResetTables() {
    dominators_.clear();
    tree_dominators_.clear();
    dominance_frontiers_.clear();
    reverse_graph_.clear();
    local_to_op_.clear();
}

Box<ir::Prog> SSAWorker::Launch(Box<ir::Prog> prog) {
    for (auto& fun : prog->funcs()) {
        ResetTables();
        CombineAddr(fun);
        // PointerToRegNext(fun);
        PointerToReg(fun);

        auto block_graph = BlockGraph::FromBlocks(fun->blocks());
        auto graph = block_graph->graph();

        block_graph->GenerateSingleSourceGraph(graph.nodes().at(0), fun);

        liveness_.Launch(graph.nodes().at(0), graph, fun->args());
        // liveness_.DisplayLiveness(stdout, graph);

        for (const auto& [id, node] : block_graph->graph().nodes()) {
            reverse_graph_[node->element()] = node;
        }

        Dominators(graph);
        // PrintDominators();

        DeriveTreeDominators(graph);
        // PrintDominatorTree();

        DeriveDominaceFroniters(graph, graph.nodes().at(0));
        // PrintDominaceFroniters();

        PlacePhiFunctions(graph, fun);
        // printL_prog(std::cout, prog);

        Rename(graph);
        CombineAddr(fun);
    }
    return prog;
}

static bool IsAllocatingStackScalar(Box<ir::Stmt> stm) {
    auto alloca_stmt = stm->inner<ir::Alloca>();
    return stm->type() == ir::StmtKind::kAlloca &&
           alloca_stmt->dst()->kind() == ir::OperandKind::kLocal &&
           alloca_stmt->dst()->inner_generic<ir::LocalVal>()->type() ==
               ir::RegType::kIntPtr &&
           alloca_stmt->dst()->inner_generic<ir::LocalVal>()->len() == 0;
}

void SSAWorker::CombineAddr(Box<ir::Func> fun) {
    unordered_map<Box<ir::LocalVal>, unordered_set<Box<Operand>>> local_set;
    unordered_map<Box<ir::GlobalVal>, unordered_set<Box<Operand>>> global_set;
    for (const auto& block : fun->blocks()) {
        auto instrs = block->instrs();
        for (const auto& stm : *instrs) {
            auto op_list =
                LivenessAnalysis::GetOps(stm, liveness::OpKind::kAll);
            for (auto op : op_list) {
                if (op->kind() == ir::OperandKind::kLocal) {
                    local_set[op->inner_generic<ir::LocalVal>()].insert(op);
                } else if (op->kind() == ir::OperandKind::kGlobal) {
                    global_set[op->inner_generic<ir::GlobalVal>()].insert(op);
                }
            }
        }
    }
    for (auto local : local_set) {
        auto first_op = **(local.second.begin());
        for (auto op : local.second) {
            *op = first_op;
        }
    }

    for (auto global : global_set) {
        auto first_op = **(global.second.begin());
        for (auto op : global.second) {
            *op = first_op;
        }
    }
}

void SSAWorker::PointerToReg(Box<ir::Func> fun) {
    /**
     * The `alias_map` helps transform scalars on the stack into scalars using
     * registers.
     *
     * Scalar on stack is determined by `i32 *` && (len == 0).
     *
     * - For an `alloca` instruction (scalar), the pointer allocated will be
     * mapped to a new local variable in the map.
     *
     * - For a `load` instruction from `ptr` to `dst`, we only care about `ptr`s
     * that were generated by `alloca` and are scalars. These `ptr`s are already
     * mapped to local variables in the map, and we can map `dst` to the same
     * local variable.
     *
     * - For a `store` instruction from `src` to `ptr`, the relevant `ptr`s have
     * already been mapped in the map. We can directly move `src` to the
     * underlying local variable of `ptr`.
     */
    std::unordered_map<Box<ir::LocalVal>, Box<ir::LocalVal>> alias_map;

    /**
     * First derive the `alias_map` by scanning the blocks.
     */
    for (auto& block : fun->blocks()) {
        for (const auto& inst : *block->instrs()) {
            switch (inst->type()) {
                case ir::StmtKind::kAlloca: {
                    /**
                     * We would only tackle scalar on stack.
                     */
                    if (inst->inner<ir::Alloca>()
                            ->dst()
                            ->inner_generic<ir::LocalVal>() == nullptr) {
                        throw std::runtime_error(
                            "Attempting to alloca to an illegal operand.");
                    }
                    if (inst->inner<ir::Alloca>()
                            ->dst()
                            ->inner_generic<ir::LocalVal>()
                            ->type() != ir::RegType::kIntPtr) {
                        break;
                    }
                    if (inst->inner<ir::Alloca>()
                            ->dst()
                            ->inner_generic<ir::LocalVal>()
                            ->len() != 0) {
                        break;
                    }

                    auto dst_prev = inst->inner<ir::Alloca>()->dst();
                    auto dst_next =
                        Operand::FromLocal(ir::LocalVal::CreateInt());
                    alias_map[dst_prev->inner_generic<ir::LocalVal>()] =
                        dst_next->inner_generic<ir::LocalVal>();
                } break;
                case ir::StmtKind::kLoad: {
                    /**
                     * We will use `load` to access global variables, the `ptr`s
                     * of which should be replaced.
                     */
                    if (inst->inner<ir::Load>()->ptr()->kind() !=
                        ir::OperandKind::kLocal) {
                        break;
                    }

                    auto ptr_next =
                        alias_map[inst->inner<ir::Load>()
                                      ->ptr()
                                      ->inner_generic<ir::LocalVal>()];

                    /**
                     * The pointer `ptr` may be generated using `getelementptr`,
                     * which is outside the intended scope of this function's
                     * behavior.
                     */
                    if (ptr_next != nullptr) {
                        alias_map[inst->inner<ir::Load>()
                                      ->dst()
                                      ->inner_generic<ir::LocalVal>()] =
                            ptr_next;
                    }
                } break;
                default:
                    break;
            }
        }
    }

    auto fix_operands = [&alias_map](std::list<Box<ir::Operand>>& ops) {
        for (Box<ir::Operand>& op : ops) {
            if (op->kind() == ir::OperandKind::kLocal &&
                op->inner_generic<ir::LocalVal>()->type() ==
                    ir::RegType::kInt &&
                (alias_map.find(op->inner_generic<ir::LocalVal>()) !=
                 alias_map.end())) {
                assert(alias_map[op->inner_generic<ir::LocalVal>()]);
                *op = *Operand::FromLocal(
                    alias_map[op->inner_generic<ir::LocalVal>()]);
            }
        }
    };

    /**
     * The alias map is now derived, allowing us to start refactoring the
     * instructions. We handle different kinds of instructions as follows:
     *
     * - For `alloca`: Replace it with a move operation `0 -> val`.
     * - For `load`: Discard it since the alias relationships are recorded.
     * - For `store`: Replace it with a move operation `local_val -> target`.
     *
     * Note: We must address all local values, as they may have been generated
     * by a `load`. Since all `load` instructions have been removed, we resolve
     * these values using the alias map. Otherwise, unresolved local values
     * originating from `load` cannot be processed correctly.
     */
    for (auto& block : fun->blocks()) {
        auto instrs = std::make_shared<std::list<std::shared_ptr<ir::Stmt>>>();
        for (auto& inst : *block->instrs()) {
            auto ops = LivenessAnalysis::GetOps(inst, liveness::OpKind::kAll);
            std::shared_ptr<ir::Stmt> new_inst = nullptr;
            switch (inst->type()) {
                case ir::StmtKind::kAlloca: {
                    if (IsAllocatingStackScalar(inst)) {
                        auto dst_next =
                            alias_map[inst->inner<ir::Alloca>()
                                          ->dst()
                                          ->inner_generic<ir::LocalVal>()];
                        auto src = Operand::FromIConst(0);
                        new_inst = ir::Stmt::CreateMove(
                            std::move(src), Operand::FromLocal(dst_next));
                    } else {
                        new_inst = inst;
                        assert(new_inst->inner<ir::Alloca>()
                                   ->dst()
                                   ->inner_generic<ir::LocalVal>()
                                   ->type() != ir::RegType::kInt);
                        // fix_operands(ops);
                    }
                } break;
                case ir::StmtKind::kLoad: {
                    if (inst->inner<ir::Load>()->ptr()->kind() !=
                            ir::OperandKind::kLocal ||
                        alias_map[inst->inner<ir::Load>()
                                      ->ptr()
                                      ->inner_generic<ir::LocalVal>()] ==
                            nullptr) {
                        new_inst = inst;
                    }
                } break;
                case ir::StmtKind::kStore: {
                    if (inst->inner<ir::Store>()->ptr()->kind() !=
                        ir::OperandKind::kLocal) {
                        fix_operands(ops);
                        new_inst = inst;
                        break;
                    }
                    auto ptr_next =
                        alias_map[inst->inner<ir::Store>()
                                      ->ptr()
                                      ->inner_generic<ir::LocalVal>()];
                    if (ptr_next == nullptr) {
                        fix_operands(ops);
                        new_inst = inst;
                        break;
                    }
                    auto src_real =
                        alias_map[inst->inner<ir::Store>()
                                      ->src()
                                      ->inner_generic<ir::LocalVal>()];
                    auto src = src_real ? src_real
                                        : inst->inner<ir::Store>()
                                              ->src()
                                              ->inner_generic<ir::LocalVal>();

                    /**
                     * A quite ugly patch here.
                     */
                    auto src_fix = inst->inner<ir::Store>()
                                       ->src()
                                       ->inner_generic<ir::Integer>();

                    if (src) {
                        new_inst =
                            ir::Stmt::CreateMove(Operand::FromLocal(src),
                                                 Operand::FromLocal(ptr_next));
                    } else {
                        new_inst = ir::Stmt::CreateMove(
                            Operand::FromIConst(src_fix->inner()),
                            Operand::FromLocal(ptr_next));
                    }
                } break;
                default: {
                    fix_operands(ops);
                    new_inst = inst;
                } break;
            }
            if (new_inst != nullptr) {
                instrs->push_back(new_inst);
            }
        }
        block->instrs() = instrs;
    }
}

void SSAWorker::Dominators(utils::Graph<Box<ir::Block>>& bg) {
    assert(dominators_.size() == 0);
    auto sorted_nodes = bg.TopologicalSort();

    std::unordered_set<Box<ir::Block>> all_nodes;
    for (const auto& node : sorted_nodes) {
        all_nodes.insert(node->element());
    }

    for (const auto& node : sorted_nodes) {
        std::unordered_set<Box<ir::Block>> dom;
        if (node->in_degree() != 0) {
            dom = common::set_union(dom, all_nodes);
        } else {
            dom.insert(node->element());
        }
        dominators_[node->element()] = dom;
    }

    /**
     * Note that the graph can be cyclic.
     */
    bool changed = true;
    while (changed) {
        changed = false;
        for (const auto& node : sorted_nodes) {
            auto dom = dominators_[node->element()];
            for (const auto& id : node->predecessors()) {
                auto pre_node = bg.nodes().at(id);
                dom = common::set_intersection(dominators_[pre_node->element()],
                                               dom);
            }
            dom.insert(node->element());
            if (!common::set_equal(dominators_[node->element()], dom)) {
                changed = true;
            }
            dominators_[node->element()] = dom;
        }
    }
}

void SSAWorker::PrintDominators() {
    printf("Dominators:\n");
    for (auto x : dominators_) {
        printf("Dom(%s)={", x.first->label()->name().c_str());
        for (auto t : x.second) {
            printf("%s , ", t->label()->name().c_str());
        }
        if (x.second.size() >= 1) {
            printf("\b\b");
        }
        printf("}\n");
    }
}

void SSAWorker::PrintDominatorTree() {
    printf("Dominator tree:\n");
    for (auto x : tree_dominators_) {
        printf("%s : ", x.first->label()->name().c_str());
        for (auto t : x.second->succs) {
            printf("%s ", t->label()->name().c_str());
        }
        printf("\n\n");
    }
}
void SSAWorker::PrintDominaceFroniters() {
    printf("DF:\n");
    for (auto x : dominance_frontiers_) {
        printf("DF(%s)={", x.first->label()->name().c_str());
        for (auto t : x.second) {
            printf("%s , ", t->label()->name().c_str());
        }
        if (x.second.size() >= 1) {
            printf("\b\b");
        }
        printf("}\n");
    }
}

void SSAWorker::DeriveTreeDominators(Graph<Box<ir::Block>>& bg) {
    for (const auto& [id, node] : bg.nodes()) {
        tree_dominators_[node->element()] =
            std::make_shared<ImmediateDominator>();
        tree_dominators_[node->element()]->succs =
            unordered_set<Box<ir::Block>>();
    }

    std::unordered_map<Box<ir::Block>, Box<ir::Block>> idom_map;
    for (const auto& [node, dominators] : dominators_) {
        std::unordered_set<Box<ir::Block>> rule_out;
        for (const auto& dominator : dominators) {
            if (dominator == node) continue;
            auto strict_dominate_set = dominators_[dominator];
            strict_dominate_set.erase(dominator);
            rule_out = common::set_union(rule_out, strict_dominate_set);
        }
        for (const auto& dominator : dominators) {
            if (dominator == node) continue;
            if (rule_out.find(dominator) != rule_out.end()) continue;
            idom_map[node] = dominator;
        }
    }

    for (const auto& [key, value] : idom_map) {
        if (tree_dominators_.find(key) == tree_dominators_.end()) {
            tree_dominators_[key] =
                std::move(std::make_shared<ImmediateDominator>());
        }
        if (tree_dominators_.find(value) == tree_dominators_.end()) {
            tree_dominators_[value] =
                std::move(std::make_shared<ImmediateDominator>());
        }
        assert(tree_dominators_[key]->pred == nullptr);
        tree_dominators_[key]->pred = value;
        tree_dominators_[value]->succs.insert(key);
    }
}

void SSAWorker::DeriveDominaceFroniters(Graph<Box<ir::Block>>& bg,
                                        Box<Node<Box<ir::Block>>> r) {
    std::unordered_set<Box<ir::Block>> df;
    for (const auto& id : r->successors()) {
        auto node = bg.nodes().at(id);
        if (dominators_[node->element()].find(r->element()) ==
            dominators_[node->element()].end()) {
            df.insert(node->element());
        }
    }

    if (tree_dominators_[r->element()]->succs.size()) {
        for (const auto& child : tree_dominators_[r->element()]->succs) {
            if (dominance_frontiers_.find(child) ==
                dominance_frontiers_.end()) {
                DeriveDominaceFroniters(bg, reverse_graph_[child]);
            }
            for (const auto& up : dominance_frontiers_[child]) {
                auto strict_dominators = dominators_[up];
                strict_dominators.erase(up);
                auto dnn = tree_dominators_[child]->pred;
                if (strict_dominators.find(dnn) == strict_dominators.end()) {
                    df.insert(up);
                }
            }
        }
    }

    dominance_frontiers_[r->element()] = df;
}

void SSAWorker::PlacePhiFunctions(Graph<Box<ir::Block>>& bg,
                                  Box<ir::Func> fun) {
    std::unordered_map<Box<Node<Box<ir::Block>>>,
                       std::unordered_set<Box<ir::LocalVal>>>
        node_defs;
    std::unordered_map<Box<Node<Box<ir::Block>>>,
                       std::unordered_set<Box<ir::LocalVal>>>
        node_phis;
    for (const auto& block : fun->blocks()) {
        auto node = reverse_graph_[block];
        node_defs[node].clear();
        for (const auto& inst : *block->instrs()) {
            auto def_ops =
                LivenessAnalysis::GetOps(inst, liveness::OpKind::kDef);
            for (auto def : def_ops) {
                if (def->kind() == ir::OperandKind::kLocal) {
                    def_sites_[def->inner_generic<ir::LocalVal>()].insert(node);
                    node_defs[node].insert(def->inner_generic<ir::LocalVal>());
                }
            }
        }
    }

    for (auto& [val, sites] : def_sites_) {
        while (sites.size()) {
            auto site = *sites.begin();
            sites.erase(site);

            for (auto y : dominance_frontiers_[site->element()]) {
                auto node = reverse_graph_[y];
                if (liveness_.GetInSetOf(node).find(val) ==
                    liveness_.GetInSetOf(node).end()) {
                    continue;
                }
                if (node_phis[node].find(val) == node_phis[node].end()) {
                    std::vector<std::pair<Box<Operand>, Box<ir::BlockLabel>>>
                        phis;
                    for (const auto& pred : node->predecessors()) {
                        if (bg.nodes().at(pred) == nullptr) continue;
                        if (bg.nodes().at(pred)->element() == nullptr) continue;
                        auto label = bg.nodes().at(pred)->element()->label();
                        phis.push_back(
                            std::make_pair(Operand::FromLocal(val), label));
                    }
                    auto it_insert = ++y->instrs()->begin();
                    y->instrs()->insert(
                        it_insert,
                        ir::Stmt::CreatePhi(Operand::FromLocal(val), phis));
                    node_phis[node].insert(val);
                    if (node_defs[node].find(val) == node_defs[node].end()) {
                        sites.insert(reverse_graph_[y]);
                    }
                }
            }
        }
    }
}

void SSAWorker::RenameLocal(
    Graph<Box<ir::Block>>& bg, Box<Node<Box<ir::Block>>> n,
    unordered_map<Box<ir::LocalVal>, std::stack<Box<ir::LocalVal>>>& stack) {
    unordered_map<Box<ir::Stmt>, list<Box<ir::Operand>>> def_operand_map;
    unordered_map<Box<ir::LocalVal>, int> push_times;

    for (const auto& inst : *n->element()->instrs()) {
        if (inst->type() != ir::StmtKind::kPhi) {
            auto use_ops = liveness_.GetOps(inst, liveness::OpKind::kUse);
            for (auto& op : use_ops) {
                if (op->inner_generic<ir::LocalVal>() &&
                    op->inner_generic<ir::LocalVal>()->type() !=
                        ir::RegType::kInt) {
                    continue;
                }
                if (stack[op->inner_generic<ir::LocalVal>()].size()) {
                    auto top = stack[op->inner_generic<ir::LocalVal>()].top();
                    *op = *Operand::FromLocal(top);
                }
            }
        }
        auto def_ops = liveness_.GetOps(inst, liveness::OpKind::kDef);
        for (auto& op : def_ops) {
            if (op->inner_generic<ir::LocalVal>() &&
                op->inner_generic<ir::LocalVal>()->type() !=
                    ir::RegType::kInt) {
                continue;
            }
            push_times[op->inner_generic<ir::LocalVal>()]++;
            auto i = ir::LocalVal::CreateInt();
            stack[op->inner_generic<ir::LocalVal>()].push(i);
            *op = *Operand::FromLocal(i);
        }
    }

    for (const auto& id : n->successors()) {
        int order = 0;
        for (auto pred : bg.nodes().at(id)->predecessors()) {
            if (pred == n->id()) break;
            order++;
        }
        for (auto& inst : *bg.nodes().at(id)->element()->instrs()) {
            if (inst->type() == ir::StmtKind::kPhi) {
                auto phi = inst->inner<ir::Phi>()->phis().at(order);
                inst->inner<ir::Phi>()->phis()[order] = std::make_pair(
                    ir::Operand::FromLocal(
                        stack[phi.first->inner_generic<ir::LocalVal>()].top()),
                    phi.second);
            } else if (inst->type() == ir::StmtKind::kLabel) {
                continue;
            } else {
                break;
            }
        }
    }

    for (auto son : tree_dominators_[n->element()]->succs) {
        RenameLocal(bg, reverse_graph_[son], stack);
    }

    for (auto m : push_times) {
        for (int i = 0; i < m.second; i++) {
            stack[m.first].pop();
        }
    }
}

void SSAWorker::Rename(Graph<Box<ir::Block>>& bg) {
    unordered_map<Box<ir::LocalVal>, std::stack<Box<ir::LocalVal>>> stack;
    for (auto& [val, sites] : def_sites_) stack[val].push(val);
    RenameLocal(bg, bg.nodes().at(0), stack);
}
