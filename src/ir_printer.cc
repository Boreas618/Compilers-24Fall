#include "ir_printer.hh"

#include <cassert>
#include <iostream>
#include <memory>

using namespace std;
using namespace ir;

void printL_def(ostream& os, std::shared_ptr<TopLevelDef> def) {
    switch (def->kind()) {
        case DefKind::kStruct: {
            os << "%" << def->inner<StructDef>()->name << " = type {";
            bool first = true;
            for (const auto& m : def->inner<StructDef>()->members) {
                if (first) {
                    os << " ";
                    first = false;
                } else {
                    os << ", ";
                }
                switch (m.kind) {
                    case RegType::kInt: {
                        os << "i32";
                        break;
                    }
                    case RegType::kIntPtr: {
                        if (m.len <= 0) {
                            assert(0);
                        }
                        os << "[" << m.len << " x " << "i32 ]";
                        break;
                    }
                    case RegType::kStruct: {
                        os << "%" << m.structname;
                        break;
                    }
                    case RegType::kStructPtr: {
                        if (m.len <= 0) {
                            assert(0);
                        }
                        os << "[" << m.len << " x " << "%" << m.structname
                           << " ]";
                        break;
                    }
                    default:
                        assert(0);
                        break;
                }
            }
            os << " }";
            break;
        }
        case DefKind::kGlobal: {
            os << "@" << def->inner<GlobalDef>()->name << " = global ";
            switch (def->inner<GlobalDef>()->def.kind) {
                case RegType::kInt: {
                    os << "i32 ";
                    if (def->inner<GlobalDef>()->init.size() == 1) {
                        os << def->inner<GlobalDef>()->init[0];
                    } else {
                        os << "0";
                    }
                    break;
                }
                case RegType::kIntPtr: {
                    os << "[ " << def->inner<GlobalDef>()->def.len
                       << " x i32 ]";
                    if (def->inner<GlobalDef>()->init.size() == 0) {
                        os << " zeroinitializer";
                    } else {
                        os << " [";
                        for (int i = 0;
                             i < def->inner<GlobalDef>()->init.size(); ++i) {
                            if (i == 0) {
                                os << " ";
                            } else {
                                os << ", ";
                            }
                            os << "i32 " << def->inner<GlobalDef>()->init[i];
                        }
                        for (int i = 0;
                             i < def->inner<GlobalDef>()->def.len -
                                     def->inner<GlobalDef>()->init.size();
                             ++i) {
                            os << ", i32 0";
                        }
                        os << " ]";
                    }
                    break;
                }
                case RegType::kStruct: {
                    os << "%" << def->inner<GlobalDef>()->def.structname
                       << " zeroinitializer";
                    break;
                }
                case RegType::kStructPtr: {
                    os << "[ " << def->inner<GlobalDef>()->def.len << " x %"
                       << def->inner<GlobalDef>()->def.structname
                       << " ] zeroinitializer";
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case DefKind::kFunc: {
            os << "declare ";
            switch (def->inner<FuncDecl>()->ret.type) {
                case ReturnType::kVoid: {
                    os << "void ";
                    break;
                }
                case ReturnType::kInt: {
                    os << "i32 ";
                    break;
                }
                case ReturnType::kStruct: {
                    os << "%" << def->inner<FuncDecl>()->ret.structname << " ";
                    break;
                }
                default:
                    break;
            }
            os << "@" << def->inner<FuncDecl>()->name << "(";
            bool first = true;
            for (const auto& v : def->inner<FuncDecl>()->args) {
                if (first) {
                    first = false;
                    os << " ";
                } else {
                    os << ", ";
                }
                switch (v.kind) {
                    case RegType::kInt: {
                        os << "i32";
                        break;
                    }
                    case RegType::kIntPtr: {
                        os << "i32*";
                        break;
                    }
                    case RegType::kStruct: {
                        os << "%" << v.structname;
                        break;
                    }
                    case RegType::kStructPtr: {
                        os << "%" << v.structname << "*";
                        break;
                    }
                    default:
                        break;
                }
            }
            os << " )";
            break;
        }
        default:
            break;
    }
    os << "\n";
}

void printL_stm(std::ostream& os, std::shared_ptr<ir::Stmt> stm) {
    switch (stm->type()) {
        case StmtKind::kAlloca: {
            if (stm->inner<Alloca>()->dst()->kind() == OperandKind::kLocal) {
                os << "  ";
                printL_oper(os, stm->inner<Alloca>()->dst());
                os << " = alloca ";
                switch (stm->inner<Alloca>()->dst()->inner()->type()) {
                    case RegType::kInt: {
                        // assert(0);
                        break;
                    }
                    case RegType::kIntPtr: {
                        if (stm->inner<Alloca>()->dst()->inner()->len() == 0)
                            os << "i32";
                        else
                            os << "[ "
                               << stm->inner<Alloca>()->dst()->inner()->len()
                               << " x i32 ]";
                        break;
                    }
                    case RegType::kStruct: {
                        assert(0);
                        break;
                    }
                    case RegType::kStructPtr: {
                        if (stm->inner<Alloca>()->dst()->inner()->len() == 0)
                            os << "%"
                               << stm->inner<Alloca>()
                                      ->dst()
                                      ->inner()
                                      ->struct_name();
                        else
                            os << "[ "
                               << stm->inner<Alloca>()->dst()->inner()->len()
                               << " x %"
                               << stm->inner<Alloca>()
                                      ->dst()
                                      ->inner()
                                      ->struct_name()
                               << " ]";
                        break;
                    }
                    default:
                        break;
                }
            } else {
                assert(0);
            }
            break;
        }
        case StmtKind::kBiOP: {
            if (stm->inner<BiOp>()->dst()->kind() != OperandKind::kLocal) {
                assert(0);
            }
            os << "  ";
            printL_oper(os, stm->inner<BiOp>()->dst());
            os << " = ";
            switch (stm->inner<BiOp>()->kind()) {
                case BiOpKind::kPlus: {
                    os << "add";
                    break;
                }
                case BiOpKind::KMinus: {
                    os << "sub";
                    break;
                }
                case BiOpKind::kMul: {
                    os << "mul";
                    break;
                }
                case BiOpKind::kDiv: {
                    os << "sdiv";
                    break;
                }
                default:
                    break;
            }
            os << " i32 ";
            printL_oper(os, stm->inner<BiOp>()->left());
            os << ", ";
            printL_oper(os, stm->inner<BiOp>()->right());
            break;
        }
        case StmtKind::kCall: {
            os << "  ";
            printL_oper(os, stm->inner<Call>()->res());
            os << " = call i32 @" << stm->inner<Call>()->fun() << "(";
            bool first = true;
            for (const auto& v : stm->inner<Call>()->args()) {
                if (first) {
                    first = false;
                } else {
                    os << ", ";
                }
                if (v->kind() == OperandKind::kLocal) {
                    if (v->inner()->type() == RegType::kInt) {
                        os << "i32 ";
                    } else if (v->inner()->type() == RegType::kIntPtr) {
                        os << "i32* ";
                    } else if (v->inner()->type() == RegType::kStruct) {
                        os << "%" << v->inner()->struct_name() << " ";
                    } else {
                        os << "%" << v->inner()->struct_name() << "* ";
                    }
                } else if (v->kind() == OperandKind::kIntConst) {
                    os << "i32 ";
                } else {
                    if (v->inner()->type() == RegType::kIntPtr) {
                        os << "i32* ";
                    } else if (v->inner()->type() == RegType::kStruct) {
                        os << "%" << v->inner()->struct_name() << "* ";
                    } else if (v->inner()->type() == RegType::kStructPtr) {
                        os << "%" << v->inner()->struct_name() << "* ";
                    } else {
                        assert(0);
                    }
                }
                printL_oper(os, v);
            }
            os << ")";
            break;
        }
        case StmtKind::kCjump: {
            os << "  br i1 ";
            printL_oper(os, stm->inner<CJump>()->dst());
            os << ", label %" << stm->inner<CJump>()->true_label()->name()
               << ", label %" << stm->inner<CJump>()->false_label()->name()
               << "\n";
            break;
        }
        case StmtKind::kCmp: {
            os << "  ";
            printL_oper(os, stm->inner<Cmp>()->dst());
            os << " = icmp ";
            switch (stm->inner<Cmp>()->kind()) {
                case RelOpKind::kLt: {
                    os << "slt ";
                    break;
                }
                case RelOpKind::kLe: {
                    os << "sle ";
                    break;
                }
                case RelOpKind::kGt: {
                    os << "sgt ";
                    break;
                }
                case RelOpKind::kGe: {
                    os << "sge ";
                    break;
                }
                case RelOpKind::kEq: {
                    os << "eq ";
                    break;
                }
                case RelOpKind::kNe: {
                    os << "ne ";
                    break;
                }
                default:
                    break;
            }
            os << "i32 ";
            printL_oper(os, stm->inner<Cmp>()->left());
            os << ", ";
            printL_oper(os, stm->inner<Cmp>()->right());
            break;
        }
        case StmtKind::kGep: {
            os << "  ";
            printL_oper(os, stm->inner<Gep>()->new_ptr());
            os << " = getelementptr ";
            if (stm->inner<Gep>()->base_ptr()->kind() == OperandKind::kLocal) {
                switch (stm->inner<Gep>()->base_ptr()->inner()->type()) {
                    case RegType::kInt: {
                        // assert(0);
                        break;
                    }
                    case RegType::kIntPtr: {
                        if (stm->inner<Gep>()->base_ptr()->inner()->len() ==
                                -1 ||
                            stm->inner<Gep>()->base_ptr()->inner()->len() ==
                                0) {
                            os << "i32, i32* ";
                            printL_oper(os, stm->inner<Gep>()->base_ptr());
                        } else {
                            os << "["
                               << stm->inner<Gep>()->base_ptr()->inner()->len()
                               << " x i32 ], ";
                            os << "["
                               << stm->inner<Gep>()->base_ptr()->inner()->len()
                               << " x i32 ]* ";
                            printL_oper(os, stm->inner<Gep>()->base_ptr());
                            os << ", i32 0";
                        }
                        break;
                    }
                    case RegType::kStruct: {
                        assert(0);
                        break;
                    }
                    case RegType::kStructPtr: {
                        if (stm->inner<Gep>()->base_ptr()->inner()->len() ==
                            0) {
                            os << "%"
                               << stm->inner<Gep>()
                                      ->base_ptr()
                                      ->inner()
                                      ->struct_name()
                               << ", %"
                               << stm->inner<Gep>()
                                      ->base_ptr()
                                      ->inner()
                                      ->struct_name()
                               << "* ";
                            printL_oper(os, stm->inner<Gep>()->base_ptr());
                            os << ", i32 0";
                        } else if (stm->inner<Gep>()
                                       ->base_ptr()
                                       ->inner()
                                       ->len() == -1) {
                            os << "%"
                               << stm->inner<Gep>()
                                      ->base_ptr()
                                      ->inner()
                                      ->struct_name()
                               << ", %"
                               << stm->inner<Gep>()
                                      ->base_ptr()
                                      ->inner()
                                      ->struct_name()
                               << "* ";
                            printL_oper(os, stm->inner<Gep>()->base_ptr());
                        } else {
                            os << "["
                               << stm->inner<Gep>()->base_ptr()->inner()->len()
                               << " x "
                               << "%"
                               << stm->inner<Gep>()
                                      ->base_ptr()
                                      ->inner()
                                      ->struct_name()
                               << " ], ";
                            os << "["
                               << stm->inner<Gep>()->base_ptr()->inner()->len()
                               << " x "
                               << "%"
                               << stm->inner<Gep>()
                                      ->base_ptr()
                                      ->inner()
                                      ->struct_name()
                               << " ]* ";
                            printL_oper(os, stm->inner<Gep>()->base_ptr());
                            os << ", i32 0";
                        }
                        break;
                    }
                    default:
                        break;
                }
                os << ", i32 ";
                printL_oper(os, stm->inner<Gep>()->index());
            } else if (stm->inner<Gep>()->base_ptr()->kind() ==
                       OperandKind::kGlobal) {
                switch (stm->inner<Gep>()->base_ptr()->inner()->type()) {
                    case RegType::kInt: {
                        assert(0);
                        break;
                    }
                    case RegType::kIntPtr: {
                        if (stm->inner<Gep>()->base_ptr()->inner()->len() ==
                                -1 ||
                            stm->inner<Gep>()->base_ptr()->inner()->len() ==
                                0) {
                            os << "i32, i32* ";
                            printL_oper(os, stm->inner<Gep>()->base_ptr());
                        } else {
                            os << "["
                               << stm->inner<Gep>()->base_ptr()->inner()->len()
                               << " x i32 ], ";
                            os << "["
                               << stm->inner<Gep>()->base_ptr()->inner()->len()
                               << " x i32 ]* ";
                            printL_oper(os, stm->inner<Gep>()->base_ptr());
                            os << ", i32 0";
                        }
                        break;
                    }
                    case RegType::kStruct: {
                        os << "%"
                           << stm->inner<Gep>()
                                  ->base_ptr()
                                  ->inner()
                                  ->struct_name()
                           << ", %"
                           << stm->inner<Gep>()
                                  ->base_ptr()
                                  ->inner()
                                  ->struct_name()
                           << "* ";
                        printL_oper(os, stm->inner<Gep>()->base_ptr());
                        os << ", i32 0";
                        break;
                    }
                    case RegType::kStructPtr: {
                        if (stm->inner<Gep>()->base_ptr()->inner()->len() ==
                                -1 ||
                            stm->inner<Gep>()->base_ptr()->inner()->len() ==
                                0) {
                            os << "%"
                               << stm->inner<Gep>()
                                      ->base_ptr()
                                      ->inner()
                                      ->struct_name()
                               << ", %"
                               << stm->inner<Gep>()
                                      ->base_ptr()
                                      ->inner()
                                      ->struct_name()
                               << "* ";
                            printL_oper(os, stm->inner<Gep>()->base_ptr());
                            os << ", i32 0";
                        } else {
                            os << "["
                               << stm->inner<Gep>()->base_ptr()->inner()->len()
                               << " x " << "%"
                               << stm->inner<Gep>()
                                      ->base_ptr()
                                      ->inner()
                                      ->struct_name()
                               << " ], ";
                            os << "["
                               << stm->inner<Gep>()->base_ptr()->inner()->len()
                               << " x " << "%"
                               << stm->inner<Gep>()
                                      ->base_ptr()
                                      ->inner()
                                      ->struct_name()
                               << " ]* ";
                            printL_oper(os, stm->inner<Gep>()->base_ptr());
                            os << ", i32 0";
                        }
                        break;
                    }
                    default:
                        break;
                }
                os << ", i32 ";
                printL_oper(os, stm->inner<Gep>()->index());
            } else {
                assert(0);
            }
            break;
        }
        case StmtKind::kJump: {
            os << "  br label %" << stm->inner<Jump>()->jump()->name() << "\n";
            break;
        }
        case StmtKind::kLabel: {
            os << stm->inner<Label>()->label()->name() << ":";
            break;
        }
        case StmtKind::kLoad: {
            os << "  ";
            printL_oper(os, stm->inner<Load>()->dst());
            os << " = load i32, i32* ";
            printL_oper(os, stm->inner<Load>()->ptr());
            break;
        }
        case StmtKind::kMove: {
            os << "  ";
            printL_oper(os, stm->inner<Move>()->dst());
            os << " = add i32 ";
            printL_oper(os, stm->inner<Move>()->src());
            os << ", 0";
            break;
        }
        case StmtKind::kNull: {
            break;
        }
        case StmtKind::kPhi: {
            os << "  ";
            printL_oper(os, stm->inner<Phi>()->dst());
            os << " = phi i32";
            bool first = true;
            for (const auto& p : stm->inner<Phi>()->phis()) {
                if (first) {
                    first = false;
                    os << " [ ";
                } else {
                    os << ", [ ";
                }
                printL_oper(os, p.first);
                os << ", %" << p.second->name() << " ]";
            }
            break;
        }
        case StmtKind::kRet: {
            if (stm->inner<Ret>()->ret() == nullptr) {
                os << "  ret void";
            } else {
                os << "  ret i32 ";
                printL_oper(os, stm->inner<Ret>()->ret());
            }
            break;
        }
        case StmtKind::kStore: {
            os << "  store i32 ";
            printL_oper(os, stm->inner<Store>()->src());
            os << ", i32* ";
            printL_oper(os, stm->inner<Store>()->ptr());
            break;
        }
        case StmtKind::kVoidCall: {
            os << "  call void @" << stm->inner<VoidCall>()->fun() << "(";
            bool first = true;
            for (const auto& v : stm->inner<VoidCall>()->args()) {
                if (first) {
                    first = false;
                } else {
                    os << ", ";
                }
                if (v->kind() == OperandKind::kLocal) {
                    if (v->inner()->type() == RegType::kInt) {
                        os << "i32 ";
                    } else if (v->inner()->type() == RegType::kIntPtr) {
                        os << "i32* ";
                    } else if (v->inner()->type() == RegType::kStruct) {
                        os << "%" << v->inner()->struct_name() << " ";
                    } else {
                        os << "%" << v->inner()->struct_name() << "* ";
                    }
                } else if (v->kind() == OperandKind::kIntConst) {
                    os << "i32 ";
                } else {
                    if (v->inner()->type() == RegType::kIntPtr) {
                        os << "i32* ";
                    } else if (v->inner()->type() == RegType::kStruct) {
                        os << "%" << v->inner()->struct_name() << "* ";
                    } else if (v->inner()->type() == RegType::kStructPtr) {
                        os << "%" << v->inner()->struct_name() << "* ";
                    } else {
                        assert(0);
                    }
                }
                printL_oper(os, v);
            }
            os << ")";
            break;
            break;
        }
        default:
            break;
    }
    os << "\n";
}

void printL_oper(std::ostream& os, std::shared_ptr<Operand> oper) {
    switch (oper->kind()) {
        case OperandKind::kIntConst: {
            os << dynamic_cast<Integer*>(oper->inner().get())->inner();
            break;
        }
        case OperandKind::kLocal: {
            os << "%r" << dynamic_cast<LocalVal*>(oper->inner().get())->num();
            break;
        }
        case OperandKind::kGlobal: {
            os << "@" << dynamic_cast<GlobalVal*>(oper->inner().get())->name()->name();
            break;
        }
        default:
            break;
    }
}

void printL_prog(std::ostream& os, std::shared_ptr<ir::Prog> prog) {
    for (const auto& def : prog->defs()) {
        printL_def(os, def);
    }
    for (const auto& func : prog->funcs()) {
        printL_func(os, func);
    }
}

void printL_func(std::ostream& os, std::shared_ptr<ir::Func> func) {
    os << "define ";
    switch (func->ret().type) {
        case ReturnType::kVoid: {
            os << "void ";
            break;
        }
        case ReturnType::kInt: {
            os << "i32 ";
            break;
        }
        case ReturnType::kStruct: {
            os << "%" << func->ret().structname << " ";
            break;
        }
        default:
            break;
    }
    os << "@" << func->name() << "(";
    bool first = true;
    for (const auto& v : func->args()) {
        if (first) {
            first = false;
            os << " ";
        } else {
            os << ", ";
        }
        switch (v->type()) {
            case RegType::kInt: {
                os << "i32 %r" << v->num();
                break;
            }
            case RegType::kIntPtr: {
                os << "i32* %r" << v->num();
                break;
            }
            case RegType::kStruct: {
                os << "%" << v->struct_name() << " %r" << v->num();
                break;
            }
            case RegType::kStructPtr: {
                os << "%" << v->struct_name() << "* %r" << v->num();
                break;
            }
            default:
                break;
        }
    }
    os << " ) {\n";
    for (const auto& b : func->blocks()) {
        printL_block(os, b);
    }
    os << "}\n\n";
}

void printL_block(std::ostream& os, std::shared_ptr<ir::Block> block) {
    for (const auto& ir : *block->instrs()) {
        printL_stm(os, ir);
    }
}