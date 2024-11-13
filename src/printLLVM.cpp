#include "printLLVM.h"

#include <cassert>
#include <iostream>

#include "llvm_ir.h"

using namespace std;
using namespace ir;

void ir::printL_def(ostream& os, TopLevelDef* def) {
    switch (def->kind) {
        case DefKind::SRT: {
            os << "%" << def->u.SRT->name << " = type {";
            bool first = true;
            for (const auto& m : def->u.SRT->members) {
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
        case DefKind::GLOBAL: {
            os << "@" << def->u.GLOBAL->name << " = global ";
            switch (def->u.GLOBAL->def.kind) {
                case RegType::kInt: {
                    os << "i32 ";
                    if (def->u.GLOBAL->init.size() == 1) {
                        os << def->u.GLOBAL->init[0];
                    } else {
                        os << "0";
                    }
                    break;
                }
                case RegType::kIntPtr: {
                    os << "[ " << def->u.GLOBAL->def.len << " x i32 ]";
                    if (def->u.GLOBAL->init.size() == 0) {
                        os << " zeroinitializer";
                    } else {
                        os << " [";
                        for (int i = 0; i < def->u.GLOBAL->init.size(); ++i) {
                            if (i == 0) {
                                os << " ";
                            } else {
                                os << ", ";
                            }
                            os << "i32 " << def->u.GLOBAL->init[i];
                        }
                        for (int i = 0; i < def->u.GLOBAL->def.len -
                                                def->u.GLOBAL->init.size();
                             ++i) {
                            os << ", i32 0";
                        }
                        os << " ]";
                    }
                    break;
                }
                case RegType::kStruct: {
                    os << "%" << def->u.GLOBAL->def.structname
                       << " zeroinitializer";
                    break;
                }
                case RegType::kStructPtr: {
                    os << "[ " << def->u.GLOBAL->def.len << " x %"
                       << def->u.GLOBAL->def.structname << " ] zeroinitializer";
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case DefKind::kFunc: {
            os << "declare ";
            switch (def->u.FUNC->ret.type) {
                case ReturnType::kVoid: {
                    os << "void ";
                    break;
                }
                case ReturnType::kInt: {
                    os << "i32 ";
                    break;
                }
                case ReturnType::kStruct: {
                    os << "%" << def->u.FUNC->ret.structname << " ";
                    break;
                }
                default:
                    break;
            }
            os << "@" << def->u.FUNC->name << "(";
            bool first = true;
            for (const auto& v : def->u.FUNC->args) {
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

void ir::printL_stm(std::ostream& os, ir::L_stm* stm) {
    switch (stm->type) {
        case StmtKind::kAlloca: {
            if (stm->u.ALLOCA->dst->kind == OperandKind::kLocal) {
                os << "  ";
                printL_oper(os, stm->u.ALLOCA->dst);
                os << " = alloca ";
                switch (stm->u.ALLOCA->dst->u.kLocal->type) {
                    case RegType::kInt: {
                        assert(0);
                        break;
                    }
                    case RegType::kIntPtr: {
                        if (stm->u.ALLOCA->dst->u.kLocal->len == 0)
                            os << "i32";
                        else
                            os << "[ " << stm->u.ALLOCA->dst->u.kLocal->len
                               << " x i32 ]";
                        break;
                    }
                    case RegType::kStruct: {
                        assert(0);
                        break;
                    }
                    case RegType::kStructPtr: {
                        if (stm->u.ALLOCA->dst->u.kLocal->len == 0)
                            os << "%"
                               << stm->u.ALLOCA->dst->u.kLocal->structname;
                        else
                            os << "[ " << stm->u.ALLOCA->dst->u.kLocal->len
                               << " x %"
                               << stm->u.ALLOCA->dst->u.kLocal->structname
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
            if (stm->u.BINOP->dst->kind != OperandKind::kLocal) {
                assert(0);
            }
            os << "  ";
            printL_oper(os, stm->u.BINOP->dst);
            os << " = ";
            switch (stm->u.BINOP->op) {
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
            printL_oper(os, stm->u.BINOP->left);
            os << ", ";
            printL_oper(os, stm->u.BINOP->right);
            break;
        }
        case StmtKind::kCall: {
            os << "  ";
            printL_oper(os, stm->u.CALL->res);
            os << " = call i32 @" << stm->u.CALL->fun << "(";
            bool first = true;
            for (const auto& v : stm->u.CALL->args) {
                if (first) {
                    first = false;
                } else {
                    os << ", ";
                }
                if (v->kind == OperandKind::kLocal) {
                    if (v->u.kLocal->type == RegType::kInt) {
                        os << "i32 ";
                    } else if (v->u.kLocal->type == RegType::kIntPtr) {
                        os << "i32* ";
                    } else if (v->u.kLocal->type == RegType::kStruct) {
                        os << "%" << v->u.kLocal->structname << " ";
                    } else {
                        os << "%" << v->u.kLocal->structname << "* ";
                    }
                } else if (v->kind == OperandKind::kIntConst) {
                    os << "i32 ";
                } else {
                    if (v->u.kGlobal->type == RegType::kIntPtr) {
                        os << "i32* ";
                    } else if (v->u.kGlobal->type == RegType::kStruct) {
                        os << "%" << v->u.kGlobal->structname << "* ";
                    } else if (v->u.kGlobal->type == RegType::kStructPtr) {
                        os << "%" << v->u.kGlobal->structname << "* ";
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
            printL_oper(os, stm->u.CJUMP->dst);
            os << ", label %" << stm->u.CJUMP->true_label->name << ", label %"
               << stm->u.CJUMP->false_label->name << "\n";
            break;
        }
        case StmtKind::kCmp: {
            os << "  ";
            printL_oper(os, stm->u.CMP->dst);
            os << " = icmp ";
            switch (stm->u.CMP->op) {
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
            printL_oper(os, stm->u.CMP->left);
            os << ", ";
            printL_oper(os, stm->u.CMP->right);
            break;
        }
        case StmtKind::kGep: {
            os << "  ";
            printL_oper(os, stm->u.GEP->new_ptr);
            os << " = getelementptr ";
            if (stm->u.GEP->base_ptr->kind == OperandKind::kLocal) {
                switch (stm->u.GEP->base_ptr->u.kLocal->type) {
                    case RegType::kInt: {
                        assert(0);
                        break;
                    }
                    case RegType::kIntPtr: {
                        if (stm->u.GEP->base_ptr->u.kLocal->len == -1 ||
                            stm->u.GEP->base_ptr->u.kLocal->len == 0) {
                            os << "i32, i32* ";
                            printL_oper(os, stm->u.GEP->base_ptr);
                        } else {
                            os << "[" << stm->u.GEP->base_ptr->u.kLocal->len
                               << " x i32 ], ";
                            os << "[" << stm->u.GEP->base_ptr->u.kLocal->len
                               << " x i32 ]* ";
                            printL_oper(os, stm->u.GEP->base_ptr);
                            os << ", i32 0";
                        }
                        break;
                    }
                    case RegType::kStruct: {
                        assert(0);
                        break;
                    }
                    case RegType::kStructPtr: {
                        if (stm->u.GEP->base_ptr->u.kLocal->len == 0) {
                            os << "%"
                               << stm->u.GEP->base_ptr->u.kLocal->structname
                               << ", %"
                               << stm->u.GEP->base_ptr->u.kLocal->structname
                               << "* ";
                            printL_oper(os, stm->u.GEP->base_ptr);
                            os << ", i32 0";
                        } else if (stm->u.GEP->base_ptr->u.kLocal->len ==
                                   -1) {
                            os << "%"
                               << stm->u.GEP->base_ptr->u.kLocal->structname
                               << ", %"
                               << stm->u.GEP->base_ptr->u.kLocal->structname
                               << "* ";
                            printL_oper(os, stm->u.GEP->base_ptr);
                        } else {
                            os << "[" << stm->u.GEP->base_ptr->u.kLocal->len
                               << " x "
                               << "%"
                               << stm->u.GEP->base_ptr->u.kLocal->structname
                               << " ], ";
                            os << "[" << stm->u.GEP->base_ptr->u.kLocal->len
                               << " x "
                               << "%"
                               << stm->u.GEP->base_ptr->u.kLocal->structname
                               << " ]* ";
                            printL_oper(os, stm->u.GEP->base_ptr);
                            os << ", i32 0";
                        }
                        break;
                    }
                    default:
                        break;
                }
                os << ", i32 ";
                printL_oper(os, stm->u.GEP->index);
            } else if (stm->u.GEP->base_ptr->kind == OperandKind::kGlobal) {
                switch (stm->u.GEP->base_ptr->u.kGlobal->type) {
                    case RegType::kInt: {
                        assert(0);
                        break;
                    }
                    case RegType::kIntPtr: {
                        if (stm->u.GEP->base_ptr->u.kGlobal->len == -1 ||
                            stm->u.GEP->base_ptr->u.kGlobal->len == 0) {
                            os << "i32, i32* ";
                            printL_oper(os, stm->u.GEP->base_ptr);
                        } else {
                            os << "[" << stm->u.GEP->base_ptr->u.kGlobal->len
                               << " x i32 ], ";
                            os << "[" << stm->u.GEP->base_ptr->u.kGlobal->len
                               << " x i32 ]* ";
                            printL_oper(os, stm->u.GEP->base_ptr);
                            os << ", i32 0";
                        }
                        break;
                    }
                    case RegType::kStruct: {
                        os << "%" << stm->u.GEP->base_ptr->u.kGlobal->structname
                           << ", %"
                           << stm->u.GEP->base_ptr->u.kGlobal->structname
                           << "* ";
                        printL_oper(os, stm->u.GEP->base_ptr);
                        os << ", i32 0";
                        break;
                    }
                    case RegType::kStructPtr: {
                        if (stm->u.GEP->base_ptr->u.kGlobal->len == -1 ||
                            stm->u.GEP->base_ptr->u.kGlobal->len == 0) {
                            os << "%"
                               << stm->u.GEP->base_ptr->u.kGlobal->structname
                               << ", %"
                               << stm->u.GEP->base_ptr->u.kGlobal->structname
                               << "* ";
                            printL_oper(os, stm->u.GEP->base_ptr);
                            os << ", i32 0";
                        } else {
                            os << "[" << stm->u.GEP->base_ptr->u.kGlobal->len
                               << " x " << "%"
                               << stm->u.GEP->base_ptr->u.kGlobal->structname
                               << " ], ";
                            os << "[" << stm->u.GEP->base_ptr->u.kGlobal->len
                               << " x " << "%"
                               << stm->u.GEP->base_ptr->u.kGlobal->structname
                               << " ]* ";
                            printL_oper(os, stm->u.GEP->base_ptr);
                            os << ", i32 0";
                        }
                        break;
                    }
                    default:
                        break;
                }
                os << ", i32 ";
                printL_oper(os, stm->u.GEP->index);
            } else {
                assert(0);
            }
            break;
        }
        case StmtKind::kJump: {
            os << "  br label %" << stm->u.JUMP->jump->name << "\n";
            break;
        }
        case StmtKind::kLabel: {
            os << stm->u.LABEL->label->name << ":";
            break;
        }
        case StmtKind::kLoad: {
            os << "  ";
            printL_oper(os, stm->u.LOAD->dst);
            os << " = load i32, i32* ";
            printL_oper(os, stm->u.LOAD->ptr);
            break;
        }
        case StmtKind::kMove: {
            os << "  ";
            printL_oper(os, stm->u.MOVE->dst);
            os << " = add i32 ";
            printL_oper(os, stm->u.MOVE->src);
            os << ", 0";
            break;
        }
        case StmtKind::kNull: {
            break;
        }
        case StmtKind::kPhi: {
            os << "  ";
            printL_oper(os, stm->u.PHI->dst);
            os << " = phi i32";
            bool first = true;
            for (const auto& p : stm->u.PHI->phis) {
                if (first) {
                    first = false;
                    os << " [ ";
                } else {
                    os << ", [ ";
                }
                printL_oper(os, p.first);
                os << ", %" << p.second->name << " ]";
            }
            break;
        }
        case StmtKind::kRet: {
            if (stm->u.RET->ret == nullptr) {
                os << "  ret void";
            } else {
                os << "  ret i32 ";
                printL_oper(os, stm->u.RET->ret);
            }
            break;
        }
        case StmtKind::kStore: {
            os << "  store i32 ";
            printL_oper(os, stm->u.STORE->src);
            os << ", i32* ";
            printL_oper(os, stm->u.STORE->ptr);
            break;
        }
        case StmtKind::kVoidCall: {
            os << "  call void @" << stm->u.VOID_CALL->fun << "(";
            bool first = true;
            for (const auto& v : stm->u.VOID_CALL->args) {
                if (first) {
                    first = false;
                } else {
                    os << ", ";
                }
                if (v->kind == OperandKind::kLocal) {
                    if (v->u.kLocal->type == RegType::kInt) {
                        os << "i32 ";
                    } else if (v->u.kLocal->type == RegType::kIntPtr) {
                        os << "i32* ";
                    } else if (v->u.kLocal->type == RegType::kStruct) {
                        os << "%" << v->u.kLocal->structname << " ";
                    } else {
                        os << "%" << v->u.kLocal->structname << "* ";
                    }
                } else if (v->kind == OperandKind::kIntConst) {
                    os << "i32 ";
                } else {
                    if (v->u.kGlobal->type == RegType::kIntPtr) {
                        os << "i32* ";
                    } else if (v->u.kGlobal->type == RegType::kStruct) {
                        os << "%" << v->u.kGlobal->structname << "* ";
                    } else if (v->u.kGlobal->type == RegType::kStructPtr) {
                        os << "%" << v->u.kGlobal->structname << "* ";
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

void ir::printL_oper(std::ostream& os, Operand* oper) {
    switch (oper->kind) {
        case OperandKind::kIntConst: {
            os << oper->u.kIntConst;
            break;
        }
        case OperandKind::kLocal: {
            os << "%r" << oper->u.kLocal->num;
            break;
        }
        case OperandKind::kGlobal: {
            os << "@" << oper->u.kGlobal->name->name;
            break;
        }
        default:
            break;
    }
}

void ir::printL_prog(std::ostream& os, ir::Prog* prog) {
    for (const auto& def : prog->defs) {
        printL_def(os, def);
    }
    for (const auto& func : prog->funcs) {
        printL_func(os, func);
    }
}

void ir::printL_func(std::ostream& os, ir::Func* func) {
    os << "define ";
    switch (func->ret.type) {
        case ReturnType::kVoid: {
            os << "void ";
            break;
        }
        case ReturnType::kInt: {
            os << "i32 ";
            break;
        }
        case ReturnType::kStruct: {
            os << "%" << func->ret.structname << " ";
            break;
        }
        default:
            break;
    }
    os << "@" << func->name << "(";
    bool first = true;
    for (const auto& v : func->args) {
        if (first) {
            first = false;
            os << " ";
        } else {
            os << ", ";
        }
        switch (v->type) {
            case RegType::kInt: {
                os << "i32 %r" << v->num;
                break;
            }
            case RegType::kIntPtr: {
                os << "i32* %r" << v->num;
                break;
            }
            case RegType::kStruct: {
                os << "%" << v->structname << " %r" << v->num;
                break;
            }
            case RegType::kStructPtr: {
                os << "%" << v->structname << "* %r" << v->num;
                break;
            }
            default:
                break;
        }
    }
    os << " ) {\n";
    for (const auto& b : func->blocks) {
        printL_block(os, b);
    }
    os << "}\n\n";
}

void ir::printL_block(std::ostream& os, ir::Block* block) {
    for (const auto& ir : block->instrs) {
        printL_stm(os, ir);
    }
}