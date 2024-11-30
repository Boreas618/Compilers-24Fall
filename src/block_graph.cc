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

void BlockGraph::DepthFirstSearch(Box<Node<Box<ir::Block>>> root) {
    throw std::domain_error("Not implemented.");
}
