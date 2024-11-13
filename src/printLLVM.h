#ifndef __PRINTLLVM
#define __PRINTLLVM

#include <iostream>

#include "llvm_ir.h"

namespace ir {
void printL_def(std::ostream& os, ir::TopLevelDef* def);
void printL_stm(std::ostream& os, ir::L_stm* stm);
void printL_oper(std::ostream& os, Operand* oper);
void printL_prog(std::ostream& os, ir::Prog* prog);
void printL_func(std::ostream& os, ir::Func* func);
void printL_block(std::ostream& os, ir::Block* block);
}  // namespace ir

#endif