#include "IRGenerator.h"

#include <cassert>
#include <list>
#include <string>
#include <unordered_map>
#include <vector>

using namespace std;
using namespace ir;

std::shared_ptr<ir::Prog> IRGenerator::Generate(aA_program p) {
    auto defs = GenerateFirst(p);
    auto funcs = GenerateSecond(p);
    vector<std::shared_ptr<Func>> funcs_block;
    for (const auto& f : funcs) {
        funcs_block.push_back(GenerateFn(f));
    }
    for (auto& f : funcs_block) {
        MoveAlloca(f);
    }
    return std::make_shared<Prog>(defs, funcs_block);
}

int IRGenerator::HandleRightValFirst(aA_rightVal r) {
    if (r == nullptr) {
        return 0;
    }
    switch (r->kind) {
        case A_arithExprValKind: {
            return HandleArithExprFirst(r->u.arithExpr);
            break;
        }
        case A_boolExprValKind: {
            return HandleBoolExpr(r->u.boolExpr);
            break;
        }
        default:
            break;
    }
    return 0;
}

int IRGenerator::HandleBoolExpr(aA_boolExpr b) {
    switch (b->kind) {
        case A_boolBiOpExprKind: {
            return HandleBoolBiOpExpr(b->u.boolBiOpExpr);
            break;
        }
        case A_boolUnitKind: {
            return HandleBoolUnit(b->u.boolUnit);
            break;
        }
        default:
            break;
    }
    return 0;
}

int IRGenerator::HandleBoolBiOpExpr(aA_boolBiOpExpr b) {
    int l = HandleBoolExpr(b->left);
    int r = HandleBoolExpr(b->right);
    if (b->op == A_and) {
        return l && r;
    } else {
        return l || r;
    }
}

int IRGenerator::HandleBoolUOpExpr(aA_boolUOpExpr b) {
    if (b->op == A_not) {
        return !HandleBoolUnit(b->cond);
    }
    return 0;
}

int IRGenerator::HandleBoolUnit(aA_boolUnit b) {
    switch (b->kind) {
        case A_comOpExprKind: {
            return HandleComOpExpr(b->u.comExpr);
            break;
        }
        case A_boolExprKind: {
            return HandleBoolExpr(b->u.boolExpr);
            break;
        }
        case A_boolUOpExprKind: {
            return HandleBoolUOpExpr(b->u.boolUOpExpr);
            break;
        }
        default:
            break;
    }
    return 0;
}

int IRGenerator::HandleComOpExpr(aA_comExpr c) {
    auto l = HandleExprUnit(c->left);
    auto r = HandleExprUnit(c->right);
    switch (c->op) {
        case A_lt: {
            return l < r;
            break;
        }
        case A_le: {
            return l <= r;
            break;
        }
        case A_gt: {
            return l > r;
            break;
        }
        case A_ge: {
            return l >= r;
            break;
        }
        case A_eq: {
            return l == r;
            break;
        }
        case A_ne: {
            return l != r;
            break;
        }
        default:
            break;
    }
    return 0;
}

int IRGenerator::HandleArithBiOpExprFirst(aA_arithBiOpExpr a) {
    auto l = HandleArithExprFirst(a->left);
    auto r = HandleArithExprFirst(a->right);
    switch (a->op) {
        case A_add: {
            return l + r;
            break;
        }
        case A_sub: {
            return l - r;
            break;
        }
        case A_mul: {
            return l * r;
            break;
        }
        case A_div: {
            return l / r;
            break;
        }
        default:
            break;
    }
    return 0;
}

int IRGenerator::HandleArithUExprFirst(aA_arithUExpr a) {
    if (a->op == A_neg) {
        return -HandleExprUnitFirst(a->expr);
    }
    return 0;
}

int IRGenerator::HandleArithExprFirst(aA_arithExpr a) {
    switch (a->kind) {
        case A_arithBiOpExprKind: {
            return HandleArithBiOpExprFirst(a->u.arithBiOpExpr);
            break;
        }
        case A_exprUnitKind: {
            return HandleExprUnitFirst(a->u.exprUnit);
            break;
        }
        default:
            assert(0);
            break;
    }
    return 0;
}

int IRGenerator::HandleExprUnitFirst(aA_exprUnit e) {
    if (e->kind == A_numExprKind) {
        return e->u.num;
    } else if (e->kind == A_arithExprKind) {
        return HandleArithExprFirst(e->u.arithExpr);
    } else if (e->kind == A_arithUExprKind) {
        return HandleArithUExprFirst(e->u.arithUExpr);
    } else {
        assert(0);
    }
    return 0;
}

void IRGenerator::HandleGlobalVarDeclScalar(
    vector<std::shared_ptr<TopLevelDef>>& defs, aA_programElement v) {
    bool is_struct = (v->u.varDeclStmt->u.varDecl->u.declScalar->type->type ==
                      A_structTypeKind);
    auto id = *v->u.varDeclStmt->u.varDecl->u.declScalar->id;
    if (is_struct) {
        auto name =
            *v->u.varDeclStmt->u.varDecl->u.declScalar->type->u.structType;
        global_vars_.emplace(
            id, GlobalVal::CreateStruct(BlockLabel::CreateFrom(id), name));

        ValDef def(RegType::kStruct, 0, name);
        defs.push_back(TopLevelDef::CreateGlobalDef(id, def, vector<int>()));
    } else {
        global_vars_.emplace(id,
                             GlobalVal::CreateInt(BlockLabel::CreateFrom(id)));
        ValDef def(RegType::kInt, 0);
        defs.push_back(TopLevelDef::CreateGlobalDef(id, def, vector<int>()));
    }
}

void IRGenerator::HandleGlobalVarDeclArray(
    vector<std::shared_ptr<TopLevelDef>>& defs, aA_programElement v) {
    auto id = *v->u.varDeclStmt->u.varDecl->u.declArray->id;
    bool is_struct = v->u.varDeclStmt->u.varDecl->u.declArray->type->type ==
                     A_structTypeKind;
    auto len = v->u.varDeclStmt->u.varDecl->u.declArray->len;
    if (is_struct) {
        auto name =
            *v->u.varDeclStmt->u.varDecl->u.declArray->type->u.structType;
        auto struct_ptr =
            GlobalVal::CreateStructPtr(BlockLabel::CreateFrom(id), len, name);
        global_vars_.emplace(id, struct_ptr);

        ValDef def(RegType::kStructPtr, len, name);
        defs.push_back(TopLevelDef::CreateGlobalDef(id, def, vector<int>()));
    } else {
        global_vars_.emplace(
            id, GlobalVal::CreateIntPtr(BlockLabel::CreateFrom(id), len));
        ValDef def(RegType::kIntPtr, len);
        defs.push_back(TopLevelDef::CreateGlobalDef(id, def, vector<int>()));
    }
}

void IRGenerator::HandleGlobalVarDefScalar(
    vector<std::shared_ptr<TopLevelDef>>& defs, aA_programElement v) {
    auto is_struct = (v->u.varDeclStmt->u.varDef->u.defScalar->type->type ==
                      A_structTypeKind);
    auto id = *v->u.varDeclStmt->u.varDef->u.defScalar->id;
    if (is_struct) {
        auto name =
            *v->u.varDeclStmt->u.varDef->u.defScalar->type->u.structType;
        global_vars_.emplace(
            id, GlobalVal::CreateStruct(BlockLabel::CreateFrom(id), name));
        ValDef def(RegType::kStruct, 0, name);
        defs.push_back(TopLevelDef::CreateGlobalDef(id, def, vector<int>()));
    } else {
        auto val = v->u.varDeclStmt->u.varDef->u.defScalar->val;
        global_vars_.emplace(id,
                             GlobalVal::CreateInt(BlockLabel::CreateFrom(id)));
        ValDef def(RegType::kInt, 0);
        vector<int> init;
        init.push_back(HandleRightValFirst(val));
        defs.push_back(TopLevelDef::CreateGlobalDef(id, def, init));
    }
}

void IRGenerator::HandleGlobalVarDefArray(
    vector<std::shared_ptr<TopLevelDef>>& defs, aA_programElement v) {
    auto id = *v->u.varDeclStmt->u.varDef->u.defArray->id;
    bool is_struct = (v->u.varDeclStmt->u.varDef->u.defArray->type->type ==
                      A_structTypeKind);
    auto len = v->u.varDeclStmt->u.varDef->u.defArray->len;
    if (is_struct) {
        auto name = *v->u.varDeclStmt->u.varDef->u.defArray->type->u.structType;
        global_vars_.emplace(id, GlobalVal::CreateStructPtr(
                                     BlockLabel::CreateFrom(id), len, name));
        ValDef def(RegType::kStructPtr, len, name);
        defs.push_back(TopLevelDef::CreateGlobalDef(id, def, vector<int>()));
    } else {
        auto vals = v->u.varDeclStmt->u.varDef->u.defArray->vals;
        global_vars_.emplace(
            id, GlobalVal::CreateIntPtr(BlockLabel::CreateFrom(id), len));
        ValDef def(RegType::kIntPtr, len);
        vector<int> init;
        for (auto& el : vals) {
            init.push_back(HandleRightValFirst(el));
        }
        defs.push_back(TopLevelDef::CreateGlobalDef(id, def, init));
    }
}

void IRGenerator::HandleGlobalVarDecl(
    vector<std::shared_ptr<TopLevelDef>>& defs, aA_programElement v) {
    if (v->u.varDeclStmt->kind == A_varDeclKind) {
        if (v->u.varDeclStmt->u.varDecl->kind == A_varDeclScalarKind) {
            HandleGlobalVarDeclScalar(defs, v);
        } else if (v->u.varDeclStmt->u.varDecl->kind == A_varDeclArrayKind) {
            HandleGlobalVarDeclArray(defs, v);
        } else {
            assert(0);
        }
    } else if (v->u.varDeclStmt->kind == A_varDefKind) {
        if (v->u.varDeclStmt->u.varDef->kind == A_varDefScalarKind) {
            HandleGlobalVarDefScalar(defs, v);
        } else if (v->u.varDeclStmt->u.varDef->kind == A_varDefArrayKind) {
            HandleGlobalVarDefArray(defs, v);
        } else {
            assert(0);
        }
    } else {
        assert(0);
    }
}

void IRGenerator::HandleStructDef(vector<std::shared_ptr<TopLevelDef>>& defs,
                                  aA_programElement v) {
    StructProp sp;
    int off = 0;
    vector<ValDef> members;
    for (const auto& decl : v->u.structDef->varDecls) {
        if (decl->kind == A_varDeclScalarKind) {
            auto id = *decl->u.declScalar->id;
            auto is_struct =
                (decl->u.declScalar->type->type == A_structTypeKind);
            if (is_struct) {
                ValDef def(RegType::kStruct, 0,
                           *decl->u.declScalar->type->u.structType);
                MemberProp prop(off++, def);
                sp.mem_props.emplace(id, prop);
                members.push_back(def);
            } else {
                ValDef def(RegType::kInt, 0);
                MemberProp prop(off++, def);
                sp.mem_props.emplace(id, prop);
                members.push_back(def);
            }
        } else if (decl->kind == A_varDeclArrayKind) {
            if (decl->u.declArray->type->type == A_structTypeKind) {
                ValDef def(RegType::kStructPtr, decl->u.declArray->len,
                           *decl->u.declArray->type->u.structType);
                MemberProp prop(off++, def);
                sp.mem_props.emplace(*decl->u.declArray->id, prop);
                members.push_back(def);
            } else {
                ValDef def(RegType::kIntPtr, decl->u.declArray->len);
                MemberProp prop(off++, def);
                sp.mem_props.emplace(*decl->u.declArray->id, prop);
                members.push_back(def);
            }
        } else {
            assert(0);
        }
    }
    struct_props_.emplace(*v->u.structDef->id, std::move(sp));
    defs.push_back(TopLevelDef::CreateStructDef(*v->u.structDef->id, members));
}

void IRGenerator::HandleFnDecl(vector<std::shared_ptr<TopLevelDef>>& defs,
                               aA_programElement v) {
    FuncType ft;
    if (v->u.fnDeclStmt->fnDecl->type == nullptr) {
        ft.type = ReturnType::kVoid;
    } else if (v->u.fnDeclStmt->fnDecl->type->type == A_nativeTypeKind) {
        ft.type = ReturnType::kInt;
    } else if (v->u.fnDeclStmt->fnDecl->type->type == A_structTypeKind) {
        ft.type = ReturnType::kStruct;
        ft.structname = *v->u.fnDeclStmt->fnDecl->type->u.structType;
    } else {
        assert(0);
    }

    auto id = *v->u.fnDeclStmt->fnDecl->id;
    if (func_ret_.find(id) == func_ret_.end())
        func_ret_.emplace(id, std::move(ft));
    vector<ValDef> args;
    for (const auto& decl : v->u.fnDeclStmt->fnDecl->paramDecl->varDecls) {
        if (decl->kind == A_varDeclScalarKind) {
            if (decl->u.declScalar->type->type == A_structTypeKind) {
                ValDef def(RegType::kStructPtr, 0,
                           *decl->u.declScalar->type->u.structType);
                args.push_back(def);
            } else {
                ValDef def(RegType::kInt, 0);
                args.push_back(def);
            }
        } else if (decl->kind == A_varDeclArrayKind) {
            if (decl->u.declArray->type->type == A_structTypeKind) {
                ValDef def(RegType::kStructPtr, -1,
                           *decl->u.declArray->type->u.structType);
                args.push_back(def);
            } else {
                ValDef def(RegType::kIntPtr, -1);
                args.push_back(def);
            }
        } else {
            assert(0);
        }
    }
    defs.push_back(
        TopLevelDef::CreateFuncDecl(*v->u.fnDeclStmt->fnDecl->id, args, ft));
}

void IRGenerator::HandleFnDef(vector<std::shared_ptr<TopLevelDef>>& defs,
                              aA_programElement v) {
    if (func_ret_.find(*v->u.fnDef->fnDecl->id) == func_ret_.end()) {
        FuncType type;
        if (v->u.fnDef->fnDecl->type == nullptr) {
            type.type = ReturnType::kVoid;
        } else if (v->u.fnDef->fnDecl->type->type == A_nativeTypeKind) {
            type.type = ReturnType::kInt;
        } else if (v->u.fnDef->fnDecl->type->type == A_structTypeKind) {
            type.type = ReturnType::kStruct;
            type.structname = *v->u.fnDef->fnDecl->type->u.structType;
        } else {
            assert(0);
        }
        func_ret_.emplace(*v->u.fnDef->fnDecl->id, std::move(type));
    }
}

std::vector<std::shared_ptr<ir::TopLevelDef>> IRGenerator::GenerateFirst(
    aA_program p) {
    vector<std::shared_ptr<TopLevelDef>> defs;
    for (const auto& v : p->programElements) {
        switch (v->kind) {
            case A_programNullStmtKind: {
                break;
            }
            case A_programVarDeclStmtKind: {
                HandleGlobalVarDecl(defs, v);
                break;
            }
            case A_programStructDefKind: {
                HandleStructDef(defs, v);
                break;
            }
            case A_programFnDeclStmtKind: {
                HandleFnDecl(defs, v);
                break;
            }
            case A_programFnDefKind: {
                HandleFnDef(defs, v);
                break;
            }
            default:
                assert(0);
                break;
        }
    }
    return defs;
}

std::vector<std::shared_ptr<FuncProp>> IRGenerator::GenerateSecond(
    aA_program p) {
    vector<std::shared_ptr<FuncProp>> funcs;
    for (const auto& v : p->programElements) {
        switch (v->kind) {
            case A_programNullStmtKind: {
                break;
            }
            case A_programVarDeclStmtKind: {
                break;
            }
            case A_programStructDefKind: {
                break;
            }
            case A_programFnDeclStmtKind: {
                break;
            }
            case A_programFnDefKind: {
                funcs.push_back(HandleFunc(v->u.fnDef));
                break;
            }
            default:
                assert(0);
                break;
        }
    }
    return funcs;
}

std::shared_ptr<FuncProp> IRGenerator::HandleFunc(aA_fnDef f) {
    auto id = *f->fnDecl->id;
    auto ret_type = func_ret_[id];
    auto arg_decls = f->fnDecl->paramDecl->varDecls;

    local_vars_.clear();
    emit_irs_.clear();
    emit_irs_.push_back(ir::Stmt::CreateLabel(BlockLabel::CreateFrom(id)));

    vector<std::shared_ptr<ir::LocalVal>> args;
    for (const auto& decl : arg_decls) {
        if (decl->kind == A_varDeclScalarKind) {
            auto is_struct =
                (decl->u.declScalar->type->type == A_structTypeKind);
            auto is_primitive =
                (decl->u.declScalar->type->type == A_nativeTypeKind);
            if (is_struct) {
                auto type_name = *decl->u.declScalar->type->u.structType;
                auto local_val = LocalVal::CreateStructPtr(0, type_name);
                args.push_back(local_val);
                local_vars_[id] = local_val;
            } else if (is_primitive) {
                auto val = LocalVal::CreateInt();
                auto val_ptr = LocalVal::CreateIntPtr(0);
                args.push_back(val);
                emit_irs_.push_back(
                    Stmt::CreateAlloca(Operand::FromLocal(val_ptr)));
                emit_irs_.push_back(Stmt::CreateStore(
                    Operand::FromLocal(val), Operand::FromLocal(val_ptr)));
                local_vars_[id] = val_ptr;
            } else {
                assert(0);
            }
        } else if (decl->kind == A_varDeclArrayKind) {
            auto is_struct =
                (decl->u.declArray->type->type == A_structTypeKind);
            auto is_primitive =
                (decl->u.declArray->type->type == A_nativeTypeKind);
            std::shared_ptr<ir::LocalVal> local_val = nullptr;

            if (is_struct) {
                auto type_name = *decl->u.declArray->type->u.structType;
                local_val = LocalVal::CreateStructPtr(-1, type_name);
            } else if (is_primitive) {
                local_val = LocalVal::CreateIntPtr(-1);
            } else {
                assert(0);
            }

            args.push_back(local_val);
            local_vars_[id] = local_val;
        } else {
            assert(0);
        }
    }

    for (auto blk : f->stmts) {
        HandleBlock(blk, nullptr, nullptr);
    }

    if (ret_type.type == ReturnType::kInt) {
        emit_irs_.push_back(ir::Stmt::CreateRet(Operand::FromIConst(0)));
    } else if (ret_type.type == ReturnType::kStruct) {
        throw runtime_error("Returning struct is not supported.");
    } else if (ret_type.type == ReturnType::kVoid) {
        emit_irs_.push_back(ir::Stmt::CreateRet(nullptr));
    } else {
        assert(0);
    }

    return std::make_shared<FuncProp>(id, ret_type, args, std::move(emit_irs_));
}

void IRGenerator::HandleLocalVarDeclScalar(aA_varDecl d) {
    auto id = *d->u.declScalar->id;
    auto type = d->u.declScalar->type->type;
    auto type_name = *d->u.declScalar->type->u.structType;

    std::shared_ptr<LocalVal> v = nullptr;

    if (type == A_nativeTypeKind)
        v = LocalVal::CreateIntPtr(0);
    else if (type == A_structTypeKind)
        v = LocalVal::CreateStructPtr(0, type_name);

    assert(v != nullptr);
    emit_irs_.push_back(ir::Stmt::CreateAlloca(Operand::FromLocal(v)));
    local_vars_[id] = v;
}

void IRGenerator::HandleLocalVarDeclArray(aA_varDecl d) {
    auto id = *d->u.declArray->id;
    auto type_kind = d->u.declArray->type->type;
    auto type_name = *d->u.declArray->type->u.structType;
    auto len = d->u.declArray->len;

    std::shared_ptr<LocalVal> v = nullptr;

    if (type_kind == A_nativeTypeKind)
        v = LocalVal::CreateIntPtr(len);
    else if (type_kind == A_structTypeKind)
        v = LocalVal::CreateStructPtr(len, type_name);

    assert(v != nullptr);
    emit_irs_.push_back(ir::Stmt::CreateAlloca(Operand::FromLocal(v)));
    local_vars_[id] = v;
}

void IRGenerator::HandleLocalVarDefScalar(aA_varDef d) {
    auto id = *d->u.defScalar->id;
    auto right_val = HandleRightVal(d->u.defScalar->val);
    if (d->u.defScalar->type->type == A_nativeTypeKind) {
        auto local_val = LocalVal::CreateIntPtr(0);
        local_vars_[id] = local_val;
        emit_irs_.push_back(
            ir::Stmt::CreateAlloca(Operand::FromLocal(local_val)));
        emit_irs_.push_back(
            ir::Stmt::CreateStore(right_val, Operand::FromLocal(local_val)));
    } else if (d->u.defScalar->type->type == A_structTypeKind) {
        /**
         * Regard this case as array.
         */
    } else {
        assert(0);
    }
}

void IRGenerator::InitArray(std::shared_ptr<LocalVal> base_ptr, int len,
                            vector<aA_rightVal> vals) {
    assert(len == vals.size());
    auto element_ptr = LocalVal::CreateIntPtr(0);
    for (int i = 0; i < vals.size(); i++) {
        emit_irs_.push_back(ir::Stmt::CreateGep(Operand::FromLocal(element_ptr),
                                                Operand::FromLocal(base_ptr),
                                                Operand::FromIConst(i)));
        auto right_ele = HandleRightVal(vals[i]);
        assert(right_ele->kind() == OperandKind::kIntConst);
        emit_irs_.push_back(
            ir::Stmt::CreateStore(right_ele, Operand::FromLocal(element_ptr)));
    }
}

void IRGenerator::InitStruct(std::shared_ptr<LocalVal> base_ptr, int len,
                             vector<aA_rightVal> vals, string& type_name) {
    assert(len == vals.size());
    auto element_ptr = LocalVal::CreateStructPtr(0, type_name);
    for (int i = 0; i < vals.size(); i++) {
        emit_irs_.push_back(ir::Stmt::CreateGep(Operand::FromLocal(element_ptr),
                                                Operand::FromLocal(base_ptr),
                                                Operand::FromIConst(i)));
        auto right_ele = HandleRightVal(vals[i]);
        assert(right_ele->kind() == OperandKind::kLocal);
        emit_irs_.push_back(
            ir::Stmt::CreateStore(right_ele, Operand::FromLocal(element_ptr)));
    }
}

void IRGenerator::HandleLocalVarDefArray(aA_varDef d) {
    auto id = *d->u.defArray->id;
    auto len = d->u.defArray->len;
    auto vals = d->u.defArray->vals;
    auto right_val = HandleRightVal(d->u.defScalar->val);

    std::shared_ptr<ir::LocalVal> local_val = nullptr;
    if (d->u.defScalar->type->type == A_nativeTypeKind) {
        local_val = LocalVal::CreateIntPtr(len);
        InitArray(local_val, len, vals);
    } else if (d->u.defArray->type->type == A_structTypeKind) {
        auto type_name = *d->u.defArray->type->u.structType;
        local_val = LocalVal::CreateStructPtr(len, type_name);
        InitStruct(local_val, len, vals, type_name);
    } else {
        assert(0);
    }

    assert(local_val != nullptr);
    local_vars_[id] = local_val;
    emit_irs_.push_back(ir::Stmt::CreateAlloca(Operand::FromLocal(local_val)));
}

void IRGenerator::HandleLocalVarDecl(aA_varDeclStmt v) {
    if (v->kind == A_varDeclKind) {
        if (v->u.varDecl->kind == A_varDeclScalarKind) {
            HandleLocalVarDeclScalar(v->u.varDecl);
        } else if (v->u.varDecl->kind == A_varDeclArrayKind) {
            HandleLocalVarDeclArray(v->u.varDecl);
        } else {
            assert(0);
        }
    } else if (v->kind == A_varDefKind) {
        if (v->u.varDef->kind == A_varDefScalarKind) {
            HandleLocalVarDefScalar(v->u.varDef);
        } else if (v->u.varDef->kind == A_varDefArrayKind) {
            HandleLocalVarDefArray(v->u.varDef);
        } else {
            assert(0);
        }
    } else {
        assert(0);
    }
}

void IRGenerator::HandleAssignmentStmt(aA_assignStmt as) {
    auto left = HandleLeftVal(as->leftVal);
    emit_irs_.push_back(
        ir::Stmt::CreateStore(HandleRightVal(as->rightVal), left));
}

void IRGenerator::HandleCallStmt(aA_callStmt call) {
    auto func_name = *call->fnCall->fn;
    vector<std::shared_ptr<Operand>> args;
    for (const auto& arg : call->fnCall->vals) {
        args.push_back(HandleRightVal(arg));
    }
    if (func_name == "putint" || func_name == "putch" ||
        func_name == "_sysy_starttime" || func_name == "_sysy_stoptime" ||
        func_name == "putarray") {
        emit_irs_.push_back(ir::Stmt::CreateVoidCall(func_name, args));
    } else {
        assert(func_ret_.find(func_name) != func_ret_.end());
        auto ret_type = func_ret_[func_name].type;
        if (ret_type == ReturnType::kVoid) {
            emit_irs_.push_back(ir::Stmt::CreateVoidCall(func_name, args));
        } else if (ret_type == ReturnType::kInt) {
            auto ret = LocalVal::CreateInt();
            emit_irs_.push_back(
                ir::Stmt::CreateCall(func_name, Operand::FromLocal(ret), args));
        } else if (ret_type == ReturnType::kStruct) {
            auto ret =
                LocalVal::CreateStructPtr(0, func_ret_[func_name].structname);
            emit_irs_.push_back(
                ir::Stmt::CreateCall(func_name, Operand::FromLocal(ret), args));
        } else {
            assert(0);
        }
    }
}

void IRGenerator::HandleIfStmt(aA_ifStmt ifs,
                               std::shared_ptr<BlockLabel> con_label,
                               std::shared_ptr<BlockLabel> bre_label) {
    auto true_label = BlockLabel::CreateEmpty();
    auto false_label = BlockLabel::CreateEmpty();
    auto after_label = BlockLabel::CreateEmpty();

    auto bool_evaluated = LocalVal::CreateIntPtr(0);

    HandleBoolUnit(ifs->boolUnit, true_label, false_label);

    emit_irs_.push_back(
        ir::Stmt::CreateAlloca(Operand::FromLocal(bool_evaluated)));

    emit_irs_.push_back(ir::Stmt::CreateLabel(true_label));
    for (auto b : ifs->ifStmts) HandleBlock(b, con_label, bre_label);
    emit_irs_.push_back(ir::Stmt::CreateJump(after_label));

    emit_irs_.push_back(ir::Stmt::CreateLabel(false_label));
    for (auto b : ifs->elseStmts) HandleBlock(b, con_label, bre_label);
    emit_irs_.push_back(ir::Stmt::CreateJump(false_label));

    emit_irs_.push_back(ir::Stmt::CreateLabel(after_label));
}

void IRGenerator::HandleWhileStmt(aA_whileStmt ws) {
    auto test_label = BlockLabel::CreateEmpty();
    auto true_label = BlockLabel::CreateEmpty();
    auto false_label = BlockLabel::CreateEmpty();

    emit_irs_.push_back(ir::Stmt::CreateLabel(test_label));
    HandleBoolUnit(ws->boolUnit, true_label, false_label);

    emit_irs_.push_back(ir::Stmt::CreateLabel(true_label));
    for (const auto& b : ws->whileStmts)
        HandleBlock(b, test_label, false_label);
    emit_irs_.push_back(ir::Stmt::CreateJump(test_label));

    emit_irs_.push_back(ir::Stmt::CreateLabel(false_label));
}

void IRGenerator::HandleReturnStmt(aA_returnStmt r) {
    if (r->retVal == nullptr) {
        emit_irs_.push_back(ir::Stmt::CreateRet(nullptr));
    } else {
        emit_irs_.push_back(ir::Stmt::CreateRet(HandleRightVal(r->retVal)));
    }
}

void IRGenerator::HandleBlock(aA_codeBlockStmt b,
                              std::shared_ptr<BlockLabel> con_label,
                              std::shared_ptr<BlockLabel> bre_label) {
    switch (b->kind) {
        case A_nullStmtKind: {
            break;
        }
        case A_varDeclStmtKind: {
            HandleLocalVarDecl(b->u.varDeclStmt);
            break;
        }
        case A_assignStmtKind: {
            HandleAssignmentStmt(b->u.assignStmt);
            break;
        }
        case A_callStmtKind: {
            HandleCallStmt(b->u.callStmt);
            break;
        }
        case A_ifStmtKind: {
            HandleIfStmt(b->u.ifStmt, con_label, bre_label);
            break;
        }
        case A_whileStmtKind: {
            HandleWhileStmt(b->u.whileStmt);
            break;
        }
        case A_returnStmtKind: {
            HandleReturnStmt(b->u.returnStmt);
            break;
        }
        case A_continueStmtKind: {
            emit_irs_.push_back(ir::Stmt::CreateJump(con_label));
            break;
        }
        case A_breakStmtKind: {
            emit_irs_.push_back(ir::Stmt::CreateJump(bre_label));
            break;
        }
        default: {
            assert(0);
            break;
        }
    }
}

std::shared_ptr<ir::Operand> IRGenerator::HandleRightVal(aA_rightVal r) {
    switch (r->kind) {
        case A_arithExprValKind: {
            return HandleArithExpr(r->u.arithExpr);
        } break;
        case A_boolExprValKind: {
            auto true_label = BlockLabel::CreateEmpty();
            auto false_label = BlockLabel::CreateEmpty();
            auto after_label = BlockLabel::CreateEmpty();

            auto bool_evaluated = LocalVal::CreateIntPtr(0);

            HandleBoolExpr(r->u.boolExpr, true_label, false_label);

            /**
             * %bool_evaluated = alloca i32
             * true:
             *   store i32 1, i32* %bool_evaluted
             *   br %after
             * false:
             *   store i32 0, i32* %bool_evaluted
             *   br %after
             * after:
             *   ...
             */
            emit_irs_.push_back(
                ir::Stmt::CreateAlloca(Operand::FromLocal(bool_evaluated)));
            emit_irs_.push_back(ir::Stmt::CreateLabel(true_label));
            emit_irs_.push_back(ir::Stmt::CreateStore(
                Operand::FromIConst(1), Operand::FromLocal(bool_evaluated)));
            emit_irs_.push_back(ir::Stmt::CreateJump(after_label));

            emit_irs_.push_back(ir::Stmt::CreateLabel(false_label));
            emit_irs_.push_back(ir::Stmt::CreateStore(
                Operand::FromIConst(0), Operand::FromLocal(bool_evaluated)));
            emit_irs_.push_back(ir::Stmt::CreateJump(false_label));

            emit_irs_.push_back(ir::Stmt::CreateLabel(after_label));

            return Operand::FromLocal(bool_evaluated);
        } break;
        default:
            assert(0);
            break;
    }
}

std::shared_ptr<ir::Operand> IRGenerator::HandleLeftVal(aA_leftVal l) {
    
}

std::shared_ptr<ir::Operand> IRGenerator::HandleIndexExpr(aA_indexExpr index) {}

std::shared_ptr<ir::Operand> IRGenerator::HandleBoolExpr(
    aA_boolExpr b, std::shared_ptr<BlockLabel> true_label,
    std::shared_ptr<BlockLabel> false_label) {}

void IRGenerator::HandleBoolBiOpExpr(aA_boolBiOpExpr b,
                                     std::shared_ptr<BlockLabel> true_label,
                                     std::shared_ptr<BlockLabel> false_label) {}

void IRGenerator::HandleBoolUnit(aA_boolUnit b,
                                 std::shared_ptr<BlockLabel> true_label,
                                 std::shared_ptr<BlockLabel> false_label) {}

void IRGenerator::HandleComOpExpr(aA_comExpr c,
                                  std::shared_ptr<BlockLabel> true_label,
                                  std::shared_ptr<BlockLabel> false_label) {}

std::shared_ptr<ir::Operand> IRGenerator::HandleArithBiOpExpr(
    aA_arithBiOpExpr a) {}

std::shared_ptr<ir::Operand> IRGenerator::HandleArithUExpr(aA_arithUExpr a) {}

std::shared_ptr<ir::Operand> IRGenerator::HandleArithExpr(aA_arithExpr a) {}

std::shared_ptr<ir::Operand> IRGenerator::HandleExprUnit(aA_exprUnit e) {}

std::shared_ptr<ir::Func> IRGenerator::GenerateFn(std::shared_ptr<FuncProp> f) {
}

void IRGenerator::MoveAlloca(std::shared_ptr<ir::Func> f) {
    auto first_block = f->blocks().front();
    for (auto i = ++f->blocks().begin(); i != f->blocks().end(); ++i) {
        for (auto it = (*i)->instrs().begin(); it != (*i)->instrs().end();) {
            if ((*it)->type() == StmtKind::kAlloca) {
                first_block->instrs().insert(++first_block->instrs().begin(),
                                             *it);
                it = (*i)->instrs().erase(it);
            } else {
                ++it;
            }
        }
    }
}