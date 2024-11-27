#pragma once

#include <unordered_map>

#include "common.hh"
#include "graph.hh"
#include "ir_def.hh"

using utils::Graph;
using utils::Node;

class BlockGraph {
   public:
    Graph<Box<ir::Block>>& graph() { return graph_; }
    std::unordered_map<Box<ir::BlockLabel>, Box<ir::Block>>& block_env() {
        return block_env_;
    }

    Box<Node<Box<ir::Block>>> FindOrCreateNode(Box<ir::Block> block);
    static Box<BlockGraph> FromBlocks(const std::list<Box<ir::Block>>& blocks);
    void ShowGraph(FILE* out) const;
    void DepthFirstSearch(Box<Node<Box<ir::Block>>> root);
    void GenerateSingleSourceGraph(Box<Node<Box<ir::Block>>> root,
                                   Box<ir::Func> func);

   private:
    void AddEdge(Box<ir::Block> from, Box<ir::Block> to);
    Graph<Box<ir::Block>> graph_;
    std::unordered_map<Box<ir::BlockLabel>, Box<ir::Block>> block_env_;
};
