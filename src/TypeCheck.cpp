#include "TypeCheck.h"

#include <cassert>

void TypeChecker::Reset() {
    level_ = 0;

    /**
     * @todo: A lot of memory leak here!
     */
    global_type_map_.clear();
    func_param_type_map_.clear();
    local_type_map_.clear();
    TypeMap *tm = new TypeMap();
    local_type_map_.push_back(tm);
    func_params_map_.clear();
    struct_members_map_.clear();
}

void TypeChecker::EnterBlock() {
    TypeMap *tm = new TypeMap();
    local_type_map_.push_back(tm);
    level_ += 1;
}

void TypeChecker::LeaveBlock() {
    if (level_ < 1) {
        std::cout << "[Fatal] Invalid level. " << std::endl;
    } else {
        TypeMap *tm = local_type_map_.back();
        local_type_map_.pop_back();
        delete tm;
        level_ -= 1;
    }
}

bool TypeChecker::ExistFuncParamConflicts(string &name) {
    auto map = func_param_type_map_;
    return !(map.find(name) == map.end());
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
                   "Duplicate definition of identifier (local variable and "
                   "function parameter).");
    } else if (ExistLocalVarConflicts(name)) {
        PrintError(*this, pos, "This id is already defined!");
    }
}

void TypeChecker::CheckVarDecl(aA_varDeclStmt vd) {
    if (!vd) return;
    string name;
    IdentifierType *id_type = nullptr;
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

        /* @todo: RAII. */
        id_type = new IdentifierType(vdecl);

    } else if (vd->kind == A_varDeclStmtType::A_varDefKind) {
        aA_varDef vdef = vd->u.varDef;
        if (vdef->kind == A_varDefType::A_varDefScalarKind) {
            name = *vdef->u.defScalar->id;

            /* Fill code here. Type can be omited. */
            CheckSymbolConficts(name, vdef->pos);

            if (vdef->u.defScalar->val->kind == A_boolExprValKind) {
                CheckBoolExpr(vdef->u.defScalar->val->u.boolExpr);

                /* Perform type inference. */
                if (vdef->u.defScalar->type == nullptr) {
                    id_type = new IdentifierType(
                        new aA_type_{vdef->pos, A_dataType::A_nativeTypeKind,
                                     A_nativeType::A_intTypeKind},
                        0);
                } else {
                    id_type = new IdentifierType(vdef);
                }

            } else {
                id_type = CheckArithExpr(vdef->u.defScalar->val->u.arithExpr);
                if (vdef->u.defScalar->type == nullptr) {
                    // Do nothing.
                } else {
                    if (id_type->construct_type == ConstructType::ARRAY)
                        PrintError(*this, vdef->pos,
                                   "Cannot assign array to scalar.");
                    else if (id_type->construct_type ==
                             ConstructType::FUNCTION) {
                        if (id_type->type != vdef->u.defScalar->type) {
                            PrintError(*this, vdef->pos,
                                       "The return type doesn't match the "
                                       "given left type.");
                        }
                    } else {
                        if (id_type->type->type !=
                            vdef->u.defScalar->type->type) {
                            PrintError(
                                *this, vdef->pos,
                                "Cannot assign between struct and primitive.");
                        }
                    }
                }
            }
        } else if (vdef->kind == A_varDefType::A_varDefArrayKind) {
            name = *vdef->u.defArray->id;

            /* Fill code here. Type can be omited. */
            CheckSymbolConficts(name, vdef->pos);

            if (vdef->u.defArray->type == nullptr) {
                /**
                 * Perform type inference. However, only int[] is allowed.
                 */
                id_type = new IdentifierType(
                    new aA_type_{vdef->pos, A_dataType::A_nativeTypeKind,
                                 A_nativeType::A_intTypeKind},
                    1);
            } else {
                id_type = new IdentifierType(vdef->u.defArray->type, 1);
            }

            /**
             * Ensure the lengths of `leftval` and `rightval` match when
             * initializing an array. If the element count differs, print an
             * error message.
             */
            if (vdef->u.defArray->len != vdef->u.defArray->vals.size()) {
                PrintError(
                    *this, vdef->pos,
                    "Array element count does not match the specified length.");
            }
        }
    }

    assert(id_type != nullptr);

    local_type_map_[level_]->insert(std::make_pair(name, id_type));
    return;
}

void TypeChecker::CheckStructDef(aA_structDef sd) {
    EnterBlock();

    if (!sd) return;
    string name = *sd->id;
    if (struct_members_map_.find(name) != struct_members_map_.end())
        PrintError(*this, sd->pos, "This id is already defined!");
    struct_members_map_[name] = &(sd->varDecls);

    LeaveBlock();

    return;
}

void TypeChecker::CheckFnDecl(aA_fnDecl fd) {
    if (!fd) return;
    string name = *fd->id;
    auto &map = func_params_map_;

    if (map.find(name) != map.end()) {
        auto ret_type = global_type_map_[name];

        /**
         * Check if the function name conflicts with a previously defined
         * identifier.
         */
        if (ret_type->construct_type != ConstructType::FUNCTION) {
            PrintError(*this, fd->pos,
                       "Function name conflicts with a previously defined "
                       "identifier.");
        }

        /**
         * Check if the return type of the function matches the previous
         * declaration.
         */
        if (!comp_aA_type(ret_type->type, fd->type)) {
            PrintError(*this, fd->pos, "Mismatched function return type.");
        }

        /**
         * Check if the parameters in the function signature match the previous
         * declaration.
         */
        auto prev_params = map[name];
        for (size_t i = 0; i < fd->paramDecl->varDecls.size(); i++) {
            auto id_type_1 = IdentifierType(fd->paramDecl->varDecls[i]);
            auto id_type_2 = IdentifierType((*prev_params)[i]);
            if (!(id_type_1 == id_type_2)) {
                PrintError(*this, fd->paramDecl->varDecls[i]->pos,
                           "Mismatched function parameters.");
            }
        }

    } else {
        auto ret_type = new IdentifierType(fd->type, 2);
        auto val_decls = new vector<aA_varDecl>();

        /**
         * Check for conflicts between function parameters and global variables.
         */
        for (size_t i = 0; i < fd->paramDecl->varDecls.size(); i++) {
            val_decls->push_back(fd->paramDecl->varDecls[i]);
        }

        global_type_map_[name] = ret_type;
        map[name] = val_decls;
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
    string func_name = *fc->fn;
    auto &map = func_params_map_;

    /**
     * Check if the function is defined.
     */
    if (map.find(func_name) == map.end()) {
        PrintError(*this, fc->pos, "The function is not defined.");
    }

    auto param_list = *map[func_name];
    for (size_t i = 0; i < fc->vals.size(); i++) {
        auto param_feed = fc->vals[i];
        IdentifierType *param_feed_type = nullptr;
        if (param_feed->kind == A_boolExprValKind) {
            CheckBoolExpr(param_feed->u.boolExpr);
            param_feed_type = new IdentifierType(
                new aA_type_{param_feed->pos, A_dataType::A_nativeTypeKind,
                             A_nativeType::A_intTypeKind},
                0);
        } else {
            param_feed_type = CheckArithExpr(param_feed->u.arithExpr);
        }
        if (!comp_aA_type(param_feed_type->type,
                          param_list[i]->u.declScalar->type)) {
            PrintError(*this, param_feed->pos, "Mismatched parameter type.");
        }
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

    EnterBlock();

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

    LeaveBlock();

    return;
}

void TypeChecker::CheckFnDef(aA_fnDef fd) {
    if (!fd) return;
    /**
     * If the function was declared, the signature should be matched.
     */
    CheckFnDecl(fd->fnDecl);

    func_param_type_map_.clear();
    for (auto vd : fd->fnDecl->paramDecl->varDecls) {
        if (ExistLocalVarConflicts(*vd->u.declScalar->id)) {
            PrintError(*this, vd->pos,
                       "Duplicate definition of identifier (local and global "
                       "variable).");
        } else {
            func_param_type_map_.insert(std::make_pair(*(vd->u.declScalar->id),
                                                       new IdentifierType(vd)));
        }
    }

    EnterBlock();
    for (aA_codeBlockStmt stmt : fd->stmts) {
        CheckCodeblockStmt(stmt);

        /**
         * Check return type.
         */
    }
    LeaveBlock();

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
            IdentifierType *rightType =
                CheckArithExpr(ae->u.arithBiOpExpr->right);
            if (ret->type->type > 0 ||
                ret->type->type != A_dataType::A_nativeTypeKind ||
                ret->type->u.nativeType != A_nativeType::A_intTypeKind ||
                rightType->type->type > 0 ||
                rightType->type->type != A_dataType::A_nativeTypeKind ||
                rightType->type->u.nativeType != A_nativeType::A_intTypeKind)
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
            aA_type t = new aA_type_;
            t->pos = eu->pos;
            auto func_name = eu->u.callExpr->fn;
            auto ret_type = global_type_map_[*func_name]->type;
            t->type = ret_type->type;
            if (t->type == A_nativeTypeKind) {
                t->u.nativeType = A_nativeType::A_intTypeKind;
            } else {
                t->u.structType = ret_type->u.structType;
            }
            ret = new IdentifierType(t, 0);
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
            // Do nothing.
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
        switch (it->second->construct_type) {
            case ConstructType::SCALAR:
                std::cout << " scalar";
                break;
            case ConstructType::ARRAY:
                std::cout << " array";
                break;
            case ConstructType::FUNCTION:
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
    for (const auto &i : checker.local_type_map_) {
        PrintTypeMap(i);
    }
}

void PrintError(TypeChecker &checker, A_pos p, string info) {
    checker.out_ << "Typecheck error in line " << p->line << ", col " << p->col
                 << ": " << info << std::endl;
    exit(0);
}
