#pragma once

#include <list>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>

#include "common.hh"
#include "graph.hh"
#include "ir_def.hh"
#include "liveness.hh"

using std::unordered_map;
using std::unordered_set;
using utils::Graph;
using utils::Node;

struct ImmediateDominator {
    ImmediateDominator() {}
    ImmediateDominator(Box<ir::Block> pred, unordered_set<Box<ir::Block>> succs)
        : pred(pred), succs(succs) {}
    Box<ir::Block> pred;
    unordered_set<Box<ir::Block>> succs;
};

class SSAWorker {
   public:
    SSAWorker() = default;
    Box<ir::Prog> Launch(Box<ir::Prog> prog);

   private:
    void ResetTables();
    void CombineAddr(Box<ir::Func> fun);
    void PointerToReg(Box<ir::Func> fun);
    void Dominators(utils::Graph<Box<ir::Block>>& bg);
    void DeriveTreeDominators(Graph<Box<ir::Block>>& bg);
    void DeriveDominaceFroniters(Graph<Box<ir::Block>>& bg,
                                 Box<Node<Box<ir::Block>>> r);

    void PrintDominators();
    void PrintDominatorTree();
    void PrintDominaceFroniters();

    liveness::LivenessAnalysis liveness_;

    unordered_map<Box<ir::Block>, unordered_set<Box<ir::Block>>> dominators_;
    unordered_map<Box<ir::Block>, Box<ImmediateDominator>> tree_dominators_;
    unordered_map<Box<ir::Block>, unordered_set<Box<ir::Block>>>
        dominance_frontiers_;
    unordered_map<Box<ir::Block>, Box<Node<Box<ir::Block>>>> reverse_graph_;
    unordered_map<Box<ir::LocalVal>, Box<ir::Operand>> local_to_op_;
};
