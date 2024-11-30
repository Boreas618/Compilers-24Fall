#pragma once

#include <iostream>

#include "ir_def.h"

void printL_def(std::ostream& os, std::shared_ptr<ir::TopLevelDef> def);
void printL_stm(std::ostream& os, std::shared_ptr<ir::Stmt> stm);
void printL_oper(std::ostream& os, std::shared_ptr<ir::Operand> oper);
void printL_prog(std::ostream& os, std::shared_ptr<ir::Prog> prog);
void printL_func(std::ostream& os, std::shared_ptr<ir::Func> func);
void printL_block(std::ostream& os, std::shared_ptr<ir::Block> block);
