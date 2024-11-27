#include "liveness.hh"

#include <unordered_map>
#include <unordered_set>

#include "graph.hh"
#include "ir_def.hh"
#include "liveness.hh"

using namespace liveness;

list<Box<Operand>> LivenessAnalysis::GetOps(Box<ir::Stmt> stm, OpKind type) {
    list<Box<Operand>> op_list;
    switch (stm->type()) {
        case StmtKind::kBiOP: {
            if (type == OpKind::kUse || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::BiOp>()->left());
                op_list.push_back(stm->inner<ir::BiOp>()->right());
            }
            if (type == OpKind::kDef || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::BiOp>()->dst());
            }
        } break;
        case StmtKind::kLoad: {
            if (type == OpKind::kUse || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::Load>()->ptr());
            }
            if (type == OpKind::kDef || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::Load>()->dst());
            }
        } break;
        case StmtKind::kStore: {
            if (type == OpKind::kUse || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::Store>()->src());
                op_list.push_back(stm->inner<ir::Store>()->ptr());
            }
            if (type == OpKind::kDef || type == OpKind::kAll) {
                // Do nothing.
            }
        } break;
        case StmtKind::kLabel: {
        } break;
        case StmtKind::kJump: {
        } break;
        case StmtKind::kCmp: {
            if (type == OpKind::kUse || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::Cmp>()->left());
                op_list.push_back(stm->inner<ir::Cmp>()->right());
            }
            if (type == OpKind::kDef || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::Cmp>()->dst());
            }
        } break;
        case StmtKind::kCjump: {
            if (type == OpKind::kUse || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::CJump>()->dst());
            }
            if (type == OpKind::kDef || type == OpKind::kAll) {
                // Do nothing.
            }
        } break;
        case StmtKind::kMove: {
            if (type == OpKind::kUse || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::Move>()->src());
            }
            if (type == OpKind::kDef || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::Move>()->dst());
            }
        } break;
        case StmtKind::kCall: {
            if (type == OpKind::kUse || type == OpKind::kAll) {
                for (auto& arg : stm->inner<ir::Call>()->args()) {
                    op_list.push_back(arg);
                }
            }
            if (type == OpKind::kDef || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::Call>()->res());
            }
        } break;
        case StmtKind::kVoidCall: {
            if (type == OpKind::kUse || type == OpKind::kAll) {
                for (auto& arg : stm->inner<ir::VoidCall>()->args()) {
                    op_list.push_back(arg);
                }
            }
            if (type == OpKind::kDef || type == OpKind::kAll) {
                // Do nothing.
            }
        } break;
        case StmtKind::kRet: {
            if (type == OpKind::kUse || type == OpKind::kAll) {
                if (stm->inner<ir::Ret>()->ret() != nullptr)
                    op_list.push_back(stm->inner<ir::Ret>()->ret());
            }
            if (type == OpKind::kDef || type == OpKind::kAll) {
                // Do nothing.
            }
        } break;
        case StmtKind::kPhi: {
            if (type == OpKind::kUse || type == OpKind::kAll) {
                for (auto& phi : stm->inner<ir::Phi>()->phis()) {
                    op_list.push_back(phi.first);
                }
            }
            if (type == OpKind::kDef || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::Phi>()->dst());
            }
        } break;
        case StmtKind::kAlloca: {
            if (type == OpKind::kUse || type == OpKind::kAll) {
                // Do nothing.
            }
            if (type == OpKind::kDef || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::Alloca>()->dst());
            }
        } break;
        case StmtKind::kGep: {
            if (type == OpKind::kUse || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::Gep>()->base_ptr());
                op_list.push_back(stm->inner<ir::Gep>()->index());
            }
            if (type == OpKind::kDef || type == OpKind::kAll) {
                op_list.push_back(stm->inner<ir::Gep>()->new_ptr());
            }
        } break;
        default: {
            printf("%d\n", (int)stm->type());
            assert(0);
        }
    }
    return op_list;
}

list<Box<ir::LocalVal>> LivenessAnalysis::GetValsOf(Box<ir::Stmt> stm,
                                                    OpKind type) {
    auto ops = GetOps(stm, type);
    list<Box<ir::LocalVal>> local_vals;
    for (auto op : ops) {
        if (op->kind() == ir::OperandKind::kLocal) {
            local_vals.push_back(op->inner<ir::LocalVal>());
        } else {
            // For now we simply discard the global values.
        }
    }
    return local_vals;
}

void LivenessAnalysis::Init() {
    in_out_table_.clear();
    use_def_table_.clear();
}

void LivenessAnalysis::GetUseDef(Box<Node<Box<ir::Block>>> r,
                                 Graph<Box<ir::Block>>& bg,
                                 std::vector<Box<ir::LocalVal>>& args) {
    auto use_set = GetUseSetOf(r);
    for (auto arg : args) {
        use_set.insert(arg);
    }

    /**
     * For now, we focus on block level liveness analysis.
     */
    for (const auto [key, node] : bg.nodes()) {
        auto& def_set = GetDefSetOf(node);
        auto& use_set = GetUseSetOf(node);
        const auto& boxed_instrs = node->element()->instrs();
        const auto& raw_instrs = *boxed_instrs;
        for (const auto stmt : raw_instrs) {
            const auto& use_vals = GetValsOf(stmt, OpKind::kUse);
            const auto& def_vals = GetValsOf(stmt, OpKind::kDef);
            for (const auto& val : use_vals) {
                if (def_set.find(val) == def_set.end()) {
                    use_set.insert(val);
                }
            }
            for (const auto& val : def_vals) {
                def_set.insert(val);
            }
        }
    }
}

bool LivenessAnalysis::LivenessIteration(Box<Node<Box<ir::Block>>> r,
                                         Graph<Box<ir::Block>>& bg) {
    bool ret = false;
    for (auto [key, node] : bg.nodes()) {
        auto& def_set = GetDefSetOf(node);
        auto& use_set = GetUseSetOf(node);
        auto& in_set = GetInSetOf(node);
        auto& out_set = GetOutSetOf(node);

        auto origin_in = in_set;
        auto origin_out = out_set;

        /**
         * Calculation of Liveness:
         *
         * - If a variable is in use[n], then it is live-in at node n. That is,
         * if a statement uses a variable, the variable is live on entry to that
         * statement.
         *
         * - If a variable is live-in at a node n, then it is live-out at all
         * nodes m in pred[n].
         *
         * - If a variable is live-out at node n, and not in def[n], then the
         * variable is also live-in at n. That is, if someone needs the value of
         * a at the end of statement n, and n does not provide that value, then
         * a’s value is needed even on entry to n.
         */

        in_set = *ir::LocalValSetUnion(
            in_set, *std::move(LocalValSetDiff(out_set, def_set)));

        auto bg_nodes = bg.nodes();
        for (auto s : node->successors()) {
            auto successor = bg_nodes[s];
            out_set = *ir::LocalValSetUnion(out_set, GetInSetOf(successor));
        }

        if (!LocalValSetEq(in_set, origin_in) ||
            !LocalValSetEq(out_set, origin_out)) {
            ret = true;
        }
    }
    return ret;
}

void PrintLocalVals(FILE* out, LocalValSet set) {
    for (auto x : set) {
        printf("%d  ", x->num());
    }
}

void LivenessAnalysis::DisplayLiveness(FILE* out, Graph<Box<ir::Block>>& bg) {
    fprintf(out, "\n\nNumber of iterations=%d\n\n", iter_num_);
    for (auto block_node : bg.nodes()) {
        fprintf(out, "----------------------\n");
        printf("block %s \n",
               block_node.second->element()->label()->name().c_str());
        fprintf(out, "def=\n");
        PrintLocalVals(out, GetDefSetOf(block_node.second));
        fprintf(out, "\n");
        fprintf(out, "use=\n");
        PrintLocalVals(out, GetUseSetOf(block_node.second));
        fprintf(out, "\n");
        fprintf(out, "In=\n");
        PrintLocalVals(out, GetInSetOf(block_node.second));
        fprintf(out, "\n");
        fprintf(out, "Out=\n");
        PrintLocalVals(out, GetOutSetOf(block_node.second));
        fprintf(out, "\n");
    }
}

LocalValSet& LivenessAnalysis::GetOutSetOf(Box<Node<Box<ir::Block>>> r) {
    return in_out_table_[r].out;
}
LocalValSet& LivenessAnalysis::GetInSetOf(Box<Node<Box<ir::Block>>> r) {
    return in_out_table_[r].in;
}
LocalValSet& LivenessAnalysis::GetDefSetOf(Box<Node<Box<ir::Block>>> r) {
    return use_def_table_[r].def;
}
LocalValSet& LivenessAnalysis::GetUseSetOf(Box<Node<Box<ir::Block>>> r) {
    return use_def_table_[r].use;
}

void LivenessAnalysis::Launch(Box<Node<Box<ir::Block>>> r,
                              Graph<Box<ir::Block>>& bg,
                              std::vector<Box<ir::LocalVal>>& args) {
    Init();
    GetUseDef(r, bg, args);
    iter_num_ = 0;
    bool changed = true;
    while (changed) changed = LivenessIteration(r, bg);
}