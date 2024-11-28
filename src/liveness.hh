#pragma once

#include <list>
#include <unordered_map>
#include <unordered_set>

#include "graph.hh"
#include "ir_def.hh"

using ir::LocalValSet;
using ir::Operand;
using ir::StmtKind;
using std::list;
using std::unordered_map;
using utils::Graph;
using utils::Node;

namespace liveness {

enum class OpKind { kAll = 1, kDef = 2, kUse = 3 };

struct InOut {
    LocalValSet in;
    LocalValSet out;
};

struct UseDef {
    LocalValSet use;
    LocalValSet def;
};

class LivenessAnalysis {
   public:
    void Launch(Box<Node<Box<ir::Block>>> r, Graph<Box<ir::Block>>& bg,
                std::vector<Box<ir::LocalVal>>& args);
    void DisplayLiveness(FILE* out, Graph<Box<ir::Block>>& bg);
    LocalValSet& GetOutSetOf(Box<Node<Box<ir::Block>>> r);
    LocalValSet& GetInSetOf(Box<Node<Box<ir::Block>>> r);
    LocalValSet& GetDefSetOf(Box<Node<Box<ir::Block>>> r);
    LocalValSet& GetUseSetOf(Box<Node<Box<ir::Block>>> r);
    static list<Box<Operand>> GetOps(Box<ir::Stmt> stm, OpKind type);
    static list<Box<ir::LocalVal>> GetValsOf(Box<ir::Stmt> stm, OpKind type);

    void GetUseDefNext(Box<Node<Box<ir::Block>>> r, Graph<Box<ir::Block>>& bg,
                       std::vector<Box<ir::LocalVal>>& args);
    bool LivenessIterationNext(Box<Node<Box<ir::Block>>> r,
                                                 Graph<Box<ir::Block>>& bg);

   private:
    void Init();
    bool LivenessIteration(Box<Node<Box<ir::Block>>> r,
                           Graph<Box<ir::Block>>& bg);
    void GetUseDef(Box<Node<Box<ir::Block>>> r, Graph<Box<ir::Block>>& bg,
                   std::vector<Box<ir::LocalVal>>& args);
    unordered_map<Box<Node<Box<ir::Block>>>, InOut> in_out_table_;
    unordered_map<Box<Node<Box<ir::Block>>>, UseDef> use_def_table_;
    int iter_num_;
};

}  // namespace liveness