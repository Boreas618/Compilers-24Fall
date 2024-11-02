#include "TypeCheck.h"

bool TypeChecker::ExistFuncParamConflicts(string &name) {
    auto map = func_param_type_map_;
    return (map.find(name) == map.end());
}

bool TypeChecker::ExistLocalVarConflicts(string &name) {
    auto map = local_type_map_;
    for (auto level : map) {
        if (level->find(name) != level->end()) return true;
    }
    return false;
}

void TypeChecker::CheckSymbolConficts(string &name, A_pos pos) {
    if (ExistFuncParamConflicts(name)) {
        PrintError(*this, pos,
                   "Local variables dplicates with function params.");
    } else if (ExistLocalVarConflicts(name)) {
        PrintError(*this, pos, "This id is already defined!");
    }
}

void TypeChecker::CheckVarDecl(aA_varDeclStmt vd) {
    if (!vd) return;
    string name;
    if (vd->kind == A_varDeclStmtType::A_varDeclKind) {
        aA_varDecl vdecl = vd->u.varDecl;
        if (vdecl->kind == A_varDeclType::A_varDeclScalarKind) {
            name = *vdecl->u.declScalar->id;

            /* Fill code here. */
            CheckSymbolConficts(name, vdecl->pos);

        } else if (vdecl->kind == A_varDeclType::A_varDeclArrayKind) {
            name = *vdecl->u.declArray->id;

            /* Fill code here. */
            CheckSymbolConficts(name, vdecl->pos);
        }
    } else if (vd->kind == A_varDeclStmtType::A_varDefKind) {
        aA_varDef vdef = vd->u.varDef;
        if (vdef->kind == A_varDefType::A_varDefScalarKind) {
            name = *vdef->u.defScalar->id;

            /* fill code here, allow omited type */
            CheckSymbolConficts(name, vdef->pos);

        } else if (vdef->kind == A_varDefType::A_varDefArrayKind) {
            name = *vdef->u.defArray->id;
            /* fill code here, allow omited type */
        }
    }
    return;
}

void TypeChecker::CheckStructDef(aA_structDef sd) {
    if (!sd) return;
    string name = *sd->id;
    if (struct_members_map_.find(name) != struct_members_map_.end())
        PrintError(*this, sd->pos, "This id is already defined!");
    struct_members_map_[name] = &(sd->varDecls);
    return;
}

void TypeChecker::CheckFnDecl(aA_fnDecl fd) {
    if (!fd) return;
    string name = *fd->id;
    auto map = func_params_map_;

    // If already declared, should match.
    if (map.find(name) != map.end()) {
        // is function ret val matches
        /* fill code here */
        // is function params matches decl
        /* fill code here */
    } else {
        // if not defined
        /* fill code here */
    }
    return;
}

void TypeChecker::CheckFnDeclStmt(aA_fnDeclStmt fd) {
    if (!fd) return;
    CheckFnDecl(fd->fnDecl);
    return;
}

void TypeChecker::CheckAssignStmt(aA_assignStmt as) {
    if (!as) return;
    string name;
    IdentifierType *deduced_type;  // deduced type if type is omitted at decl
    switch (as->leftVal->kind) {
        case A_leftValType::A_varValKind: {
            name = *as->leftVal->u.id;
            /* fill code here */
        } break;
        case A_leftValType::A_arrValKind: {
            /* fill code here */
        } break;
        case A_leftValType::A_memberValKind: {
            /* fill code here */
        } break;
    }
    return;
}

void TypeChecker::CheckBoolExpr(aA_boolExpr be) {
    if (!be) return;
    switch (be->kind) {
        case A_boolExprType::A_boolBiOpExprKind:
            CheckBoolExpr(be->u.boolBiOpExpr->left);
            CheckBoolExpr(be->u.boolBiOpExpr->right);
            break;
        case A_boolExprType::A_boolUnitKind:
            CheckBoolUnit(be->u.boolUnit);
            break;
        default:
            break;
    }
    return;
}

void TypeChecker::CheckBoolUnit(aA_boolUnit bu) {
    if (!bu) return;
    switch (bu->kind) {
        case A_boolUnitType::A_comOpExprKind: {
            /* fill code here */
        } break;
        case A_boolUnitType::A_boolExprKind:
            CheckBoolExpr(bu->u.boolExpr);
            break;
        case A_boolUnitType::A_boolUOpExprKind:
            CheckBoolUnit(bu->u.boolUOpExpr->cond);
            break;
        default:
            break;
    }
    return;
}

void TypeChecker::CheckIfStmt(aA_ifStmt is) {
    if (!is) return;
    CheckBoolUnit(is->boolUnit);
    /* fill code here, take care of variable scope */

    for (aA_codeBlockStmt s : is->ifStmts) {
        CheckCodeblockStmt(s);
    }

    /* fill code here */
    for (aA_codeBlockStmt s : is->elseStmts) {
        CheckCodeblockStmt(s);
    }
    /* fill code here */
    return;
}

void TypeChecker::CheckWhileStmt(aA_whileStmt ws) {
    if (!ws) return;
    CheckBoolUnit(ws->boolUnit);
    /* fill code here, take care of variable scope */

    for (aA_codeBlockStmt s : ws->whileStmts) {
        CheckCodeblockStmt(s);
    }
    /* fill code here */

    return;
}

void TypeChecker::CheckFuncCall(aA_fnCall fc) {
    if (!fc) return;
    // check if function defined
    string func_name = *fc->fn;
    /* fill code here */

    // check if parameter list matches
    for (int i = 0; i < fc->vals.size(); i++) {
        /* fill code here */
    }
    return;
}

void TypeChecker::CheckCallStmt(aA_callStmt cs) {
    if (!cs) return;
    CheckFuncCall(cs->fnCall);
    return;
}

void TypeChecker::CheckReturnStmt(aA_returnStmt rs) {
    if (!rs) return;
    return;
}

void TypeChecker::CheckCodeblockStmt(aA_codeBlockStmt cs) {
    if (!cs) return;
    // variables declared in a code block should not duplicate with outer ones.
    switch (cs->kind) {
        case A_codeBlockStmtType::A_varDeclStmtKind:
            CheckVarDecl(cs->u.varDeclStmt);
            break;
        case A_codeBlockStmtType::A_assignStmtKind:
            CheckAssignStmt(cs->u.assignStmt);
            break;
        case A_codeBlockStmtType::A_ifStmtKind:
            CheckIfStmt(cs->u.ifStmt);
            break;
        case A_codeBlockStmtType::A_whileStmtKind:
            CheckWhileStmt(cs->u.whileStmt);
            break;
        case A_codeBlockStmtType::A_callStmtKind:
            CheckCallStmt(cs->u.callStmt);
            break;
        case A_codeBlockStmtType::A_returnStmtKind:
            CheckReturnStmt(cs->u.returnStmt);
            break;
        default:
            break;
    }
    return;
}

void TypeChecker::CheckFnDef(aA_fnDef fd) {
    if (!fd) return;
    // should match if declared
    CheckFnDecl(fd->fnDecl);
    // add params to local tokenmap, func params override global ones
    for (aA_varDecl vd : fd->fnDecl->paramDecl->varDecls) {
        /* fill code here */
    }

    /* fill code here */
    for (aA_codeBlockStmt stmt : fd->stmts) {
        CheckCodeblockStmt(stmt);
        // return value type should match
        /* fill code here */
    }

    return;
}

void TypeChecker::CheckArrayExpr(aA_arrayExpr ae) {
    if (!ae) return;
    string name = *ae->arr->u.id;
    // check array name
    /* fill code here */

    // check index
    /* fill code here */
    return;
}

IdentifierType *TypeChecker::CheckMemberExpr(aA_memberExpr me) {
    // check if the member exists and return the tyep of the member
    if (!me) return nullptr;
    string name = *me->structId->u.id;
    // check struct name
    /* fill code here */

    // check member name
    /* fill code here */

    return nullptr;
}

IdentifierType *TypeChecker::CheckArithExpr(aA_arithExpr ae) {
    if (!ae) return nullptr;
    IdentifierType *ret;
    switch (ae->kind) {
        case A_arithExprType::A_arithBiOpExprKind: {
            ret = CheckArithExpr(ae->u.arithBiOpExpr->left);
            IdentifierType *rightTyep =
                CheckArithExpr(ae->u.arithBiOpExpr->right);
            if (ret->type->type > 0 ||
                ret->type->type != A_dataType::A_nativeTypeKind ||
                ret->type->u.nativeType != A_nativeType::A_intTypeKind ||
                rightTyep->type->type > 0 ||
                rightTyep->type->type != A_dataType::A_nativeTypeKind ||
                rightTyep->type->u.nativeType != A_nativeType::A_intTypeKind)
                PrintError(
                    *this, ae->pos,
                    "Only int can be arithmetic expression operation values!");
        } break;
        case A_arithExprType::A_exprUnitKind:
            ret = CheckExprUnit(ae->u.exprUnit);
            break;
    }
    return ret;
}

IdentifierType *TypeChecker::CheckExprUnit(aA_exprUnit eu) {
    // return the aA_type of expr eu
    if (!eu) return nullptr;
    IdentifierType *ret;
    switch (eu->kind) {
        case A_exprUnitType::A_idExprKind: {
            /* fill code here */
        } break;
        case A_exprUnitType::A_numExprKind: {
            aA_type numt = new aA_type_;
            numt->pos = eu->pos;
            numt->type = A_dataType::A_nativeTypeKind;
            numt->u.nativeType = A_nativeType::A_intTypeKind;
            ret = new IdentifierType(numt, 0);
        } break;
        case A_exprUnitType::A_fnCallKind: {
            CheckFuncCall(eu->u.callExpr);
            // check_FuncCall will check if the function is defined
            /* fill code here */
        } break;
        case A_exprUnitType::A_arrayExprKind: {
            CheckArrayExpr(eu->u.arrayExpr);
            /* fill code here */
        } break;
        case A_exprUnitType::A_memberExprKind: {
            ret = CheckMemberExpr(eu->u.memberExpr);
        } break;
        case A_exprUnitType::A_arithExprKind: {
            ret = CheckArithExpr(eu->u.arithExpr);
        } break;
        case A_exprUnitType::A_arithUExprKind: {
            ret = CheckExprUnit(eu->u.arithUExpr->expr);
        } break;
    }
    return ret;
}

void TypeChecker::CheckProgram(aA_program p) {
    for (auto ele : p->programElements) {
        if (ele->kind == A_programVarDeclStmtKind) {
            CheckVarDecl(ele->u.varDeclStmt);
        } else if (ele->kind == A_programStructDefKind) {
            CheckStructDef(ele->u.structDef);
        }
    }

    for (auto ele : p->programElements) {
        if (ele->kind == A_programFnDeclStmtKind) {
            CheckFnDeclStmt(ele->u.fnDeclStmt);
        } else if (ele->kind == A_programFnDefKind) {
            CheckFnDecl(ele->u.fnDef->fnDecl);
        }
    }

    for (auto ele : p->programElements) {
        if (ele->kind == A_programFnDefKind) {
            CheckFnDef(ele->u.fnDef);
        } else if (ele->kind == A_programNullStmtKind) {
            // do nothing
        }
    }

    out_ << "Typecheck passed!" << std::endl;
    return;
}

void PrintTypeMap(TypeMap *map) {
    for (auto it = map->begin(); it != map->end(); it++) {
        std::cout << it->first << " : ";
        switch (it->second->type->type) {
            case A_dataType::A_nativeTypeKind:
                switch (it->second->type->u.nativeType) {
                    case A_nativeType::A_intTypeKind:
                        std::cout << "int";
                        break;
                    default:
                        break;
                }
                break;
            case A_dataType::A_structTypeKind:
                std::cout << *(it->second->type->u.structType);
                break;
            default:
                break;
        }
        switch (it->second->isVarArrFunc) {
            case 0:
                std::cout << " scalar";
                break;
            case 1:
                std::cout << " array";
                break;
            case 2:
                std::cout << " function";
                break;
        }
        std::cout << std::endl;
    }
}

void PrintTypeMaps(TypeChecker &checker) {
    std::cout << "======== Type Maps ========" << std::endl;
    std::cout << "[Global]" << std::endl;
    PrintTypeMap(&checker.global_type_map_);
    std::cout << "[Local]" << std::endl;
    PrintTypeMap(&checker.local_type_map_);
}

void PrintError(TypeChecker &checker, A_pos p, string info) {
    checker.out_ << "Typecheck error in line " << p->line << ", col " << p->col
                 << ": " << info << std::endl;
    exit(0);
}