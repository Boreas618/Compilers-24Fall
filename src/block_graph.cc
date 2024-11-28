#include "block_graph.hh"

using utils::NodeColor;

Box<Node<Box<ir::Block>>> BlockGraph::FindOrCreateNode(Box<ir::Block> block) {
    for (auto& node : graph_.nodes()) {
        if (node.second->element() == block) {
            return node.second;
        }
    }
    return graph_.AddNode(block);
}

Box<BlockGraph> BlockGraph::FromBlocks(
    const std::list<Box<ir::Block>>& blocks) {
    auto bg = std::make_shared<BlockGraph>();
    bg->graph_ = Graph<Box<ir::Block>>();
    bg->block_env_.clear();

    for (auto block : blocks) {
        bg->block_env_.insert({block->label(), block});
        bg->graph_.AddNode(block);
    }

    for (auto block : blocks) {
        if (block == nullptr) continue;
        auto succs = block->succs();
        for (const auto& label : block->succs()) {
            bg->AddEdge(block, bg->block_env_[label]);
        }
    }

    return bg;
}

void BlockGraph::ShowGraph(FILE* out) const {
    for (const auto& block_node : graph_.nodes()) {
        auto block = block_node.second->element();
        fprintf(out, "%s \n", block->label()->name().c_str());

        fprintf(out, "pred %zu ", block_node.second->predecessors().size());
        for (const auto& pred : block_node.second->predecessors()) {
            fprintf(
                out, "%s  ",
                graph_.nodes().at(pred)->element()->label()->name().c_str());
        }
        fprintf(out, "\n");

        fprintf(out, "succ %zu ", block_node.second->successors().size());
        for (const auto& succ : block_node.second->successors()) {
            fprintf(
                out, "%s  ",
                graph_.nodes().at(succ)->element()->label()->name().c_str());
        }
        fprintf(out, "\n");
    }
}

void BlockGraph::AddEdge(Box<ir::Block> from, Box<ir::Block> to) {
    auto from_node = FindOrCreateNode(from);
    auto to_node = FindOrCreateNode(to);
    graph_.AddEdge(from_node, to_node);
}

void BlockGraph::GenerateSingleSourceGraph(Box<Node<Box<ir::Block>>> root,
                                           Box<ir::Func> func) {
    auto current_node = root;
    root->color() = NodeColor::kSSGVisted;
    std::list<Box<Node<Box<ir::Block>>>> fringe;

    for (const auto& succ : root->successors()) {
        const auto& node = graph_.nodes().at(succ);
        node->color() = NodeColor::kSSGVisted;
        fringe.push_back(node);
    }

    while (fringe.size()) {
        current_node = fringe.front();
        fringe.pop_front();
        current_node->color() = NodeColor::kSSGVisted;
        for (const auto& succ : current_node->successors()) {
            const auto& node = graph_.nodes().at(succ);
            if (node->color() == NodeColor::kNone) {
                fringe.push_back(node);
            }
        }
    }

    // Remove unapproachable code.
    std::list<Box<utils::Node<Box<ir::Block>>>> to_delete;
    for (auto& [id, node] : graph_.nodes()) {
        if (node->color() == NodeColor::kNone) {
            /**
             * Relax — smart pointers and RAII are here to manage heap cleanup
             * for you.
             */
            func->blocks().remove(node->element());
            to_delete.push_back(node);
        }
    }
    while (to_delete.size()) {
        auto candidate = to_delete.front();
        to_delete.pop_front();
        graph_.RemoveNode(candidate);
    }
}

void BlockGraph::GenerateSingleSourceGraphNext(Box<Node<Box<ir::Block>>> root,
                                               Box<ir::Func> func) {
    std::unordered_set<Box<Node<Box<ir::Block>>>> visited;
    std::list<Box<Node<Box<ir::Block>>>> worklist;
    worklist.push_back(root);
    while (!worklist.empty()) {
        Box<Node<Box<ir::Block>>> n = worklist.front();
        worklist.pop_front();
        if (visited.find(n) != visited.end()) continue;
        visited.insert(n);
        for (auto succ : n->successors()) {
            worklist.push_back(graph_.nodes().at(succ));
        }
    }

    std::unordered_set<Box<Node<Box<ir::Block>>>> deleted_nodes;
    std::unordered_set<Box<ir::Block>> deleted_blocks;

    for (auto it = graph_.nodes().begin(); it != graph_.nodes().end();) {
        if (visited.find(it->second) == visited.end()) {
            deleted_nodes.insert(it->second);
            deleted_blocks.insert(it->second->element());
            // it = it->second->mygraph->mynodes.erase(it);
        }
        // else
        it++;
    }

    if (deleted_nodes.size()) {
        std::list<Box<ir::Block>> new_blocks;
        for (auto block : func->blocks())
            if (deleted_blocks.find(block) == deleted_blocks.end())
                new_blocks.push_back(block);
        func->blocks() = new_blocks;
        // Create_bg(fun->blocks);
        for (auto node : deleted_nodes) {
            node->successors().clear();
            node->predecessors().clear();
            graph_.RemoveNode(node);
        }
        // bg.nodecount = bg.mynodes.size();

        // double free or corruption
        /*
        for (auto node : graph_.nodes()) {
            for (auto it = node.second->predecessors().begin();
                 it != node.second->predecessors().end();) {
                if (deleted_nodes.find(graph_.nodes().at(*it)) !=
                    deleted_nodes.end()) {
                    it =
                        graph_.nodes().at(node.first)->predecessors().erase(it);
                } else
                    it++;
            }
        }*/
    }
}

void BlockGraph::DepthFirstSearch(Box<Node<Box<ir::Block>>> root) {
    throw std::domain_error("Not implemented.");
}
