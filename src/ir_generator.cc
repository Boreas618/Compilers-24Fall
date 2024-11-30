#include "ir_generator.h"

#include <cassert>
#include <list>
#include <string>
#include <unordered_map>
#include <vector>

namespace ir {
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
            return HandleBoolExprFirst(r->u.boolExpr);
            break;
        }
        default:
            break;
    }
    return 0;
}

int IRGenerator::HandleBoolExprFirst(aA_boolExpr b) {
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
    int l = HandleBoolExprFirst(b->left);
    int r = HandleBoolExprFirst(b->right);
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
            return HandleBoolExprFirst(b->u.boolExpr);
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
    auto l = PtrDeref(HandleExprUnit(c->left));
    auto r = PtrDeref(HandleExprUnit(c->right));
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

    auto Handle = [&](auto& decl) {
        bool is_array = (decl->kind == A_varDeclArrayKind);
        bool is_struct =
            (is_array ? decl->u.declArray->type->type
                      : decl->u.declScalar->type->type) == A_structTypeKind;

        RegType kind =
            is_array ? (is_struct ? RegType::kStructPtr : RegType::kIntPtr)
                     : (is_struct ? RegType::kStruct : RegType::kInt);

        std::string struct_name =
            is_struct ? (is_array ? *decl->u.declArray->type->u.structType
                                  : *decl->u.declScalar->type->u.structType)
                      : "";

        int len = is_array ? decl->u.declArray->len : 0;
        auto id = is_array ? *decl->u.declArray->id : *decl->u.declScalar->id;

        ValDef def(kind, len, struct_name);
        MemberProp prop(off++, def);
        sp.mem_props.emplace(id, prop);
        members.push_back(def);
    };

    for (const auto& decl : v->u.structDef->varDecls) {
        Handle(decl);
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

    local_vars_.clear();
    emit_irs_.clear();
    emit_irs_.push_back(ir::Stmt::CreateLabel(BlockLabel::CreateFrom(id)));

    auto args = HandleFunctionArguments(f->fnDecl->paramDecl->varDecls);

    for (auto blk : f->stmts) {
        HandleBlock(blk, nullptr, nullptr);
    }

    HandleFunctionReturn(ret_type);

    return std::make_shared<FuncProp>(id, ret_type, args, std::move(emit_irs_));
}

std::vector<std::shared_ptr<ir::LocalVal>> IRGenerator::HandleFunctionArguments(
    const std::vector<aA_varDecl>& arg_decls) {
    std::vector<std::shared_ptr<ir::LocalVal>> args;

    for (const auto& decl : arg_decls) {
        std::shared_ptr<ir::LocalVal> local_val = nullptr;

        if (decl->kind == A_varDeclScalarKind)
            local_val = HandleScalarArgument(decl);
        else if (decl->kind == A_varDeclArrayKind)
            local_val = HandleArrayArgument(decl);
        else
            assert(0);

        if (local_val) args.push_back(local_val);
    }

    return args;
}

std::shared_ptr<ir::LocalVal> IRGenerator::HandleScalarArgument(
    const aA_varDecl& decl) {
    auto arg_id = *decl->u.declScalar->id;
    auto is_struct = (decl->u.declScalar->type->type == A_structTypeKind);
    auto is_primitive = (decl->u.declScalar->type->type == A_nativeTypeKind);

    if (is_struct) {
        auto type_name = *decl->u.declScalar->type->u.structType;
        auto local_val = LocalVal::CreateStructPtr(0, type_name);
        local_vars_[arg_id] = local_val;
        return local_val;
    } else if (is_primitive) {
        auto val = LocalVal::CreateInt();
        auto val_ptr = LocalVal::CreateIntPtr(0);
        emit_irs_.push_back(Stmt::CreateAlloca(Operand::FromLocal(val_ptr)));
        emit_irs_.push_back(Stmt::CreateStore(Operand::FromLocal(val),
                                              Operand::FromLocal(val_ptr)));
        local_vars_[arg_id] = val_ptr;
        return val;
    } else {
        assert(0);
        return nullptr;
    }
}

std::shared_ptr<ir::LocalVal> IRGenerator::HandleArrayArgument(
    const aA_varDecl& decl) {
    auto arg_id = *decl->u.declArray->id;
    auto is_struct = (decl->u.declArray->type->type == A_structTypeKind);
    auto is_primitive = (decl->u.declArray->type->type == A_nativeTypeKind);
    std::shared_ptr<ir::LocalVal> local_val = nullptr;

    if (is_struct) {
        auto type_name = *decl->u.declArray->type->u.structType;
        local_val = LocalVal::CreateStructPtr(-1, type_name);
    } else if (is_primitive) {
        local_val = LocalVal::CreateIntPtr(-1);
    } else {
        assert(0);
    }

    local_vars_[arg_id] = local_val;
    return local_val;
}

void IRGenerator::HandleFunctionReturn(const FuncType& ret_type) {
    if (ret_type.type == ReturnType::kInt)
        emit_irs_.push_back(ir::Stmt::CreateRet(Operand::FromIConst(0)));
    else if (ret_type.type == ReturnType::kStruct)
        throw std::runtime_error("Returning struct is not supported.");
    else if (ret_type.type == ReturnType::kVoid)
        emit_irs_.push_back(ir::Stmt::CreateRet(nullptr));
    else
        assert(0);
}

void IRGenerator::HandleLocalVarDeclScalar(aA_varDecl d) {
    auto id = *d->u.declScalar->id;
    auto type_nullable = d->u.declScalar->type;
    A_dataType type;

    if (type_nullable == nullptr)
        type = kUndecided;
    else
        type = type_nullable->type;

    std::shared_ptr<LocalVal> v = nullptr;

    if (type == A_nativeTypeKind) {
        v = LocalVal::CreateIntPtr(0);
        emit_irs_.push_back(ir::Stmt::CreateAlloca(Operand::FromLocal(v)));
    } else if (type == A_structTypeKind) {
        auto type_name = *d->u.declScalar->type->u.structType;
        v = LocalVal::CreateStructPtr(0, type_name);
        emit_irs_.push_back(ir::Stmt::CreateAlloca(Operand::FromLocal(v)));
    } else if (type == kUndecided) {
        v = LocalVal::CreateIntPtr(-2);
    }

    assert(v != nullptr);
    local_vars_[id] = v;
}

void IRGenerator::HandleLocalVarDeclArray(aA_varDecl d) {
    auto id = *d->u.declArray->id;
    auto type_kind = d->u.declArray->type->type;
    auto len = d->u.declArray->len;

    std::shared_ptr<LocalVal> v = nullptr;

    if (type_kind == A_nativeTypeKind)
        v = LocalVal::CreateIntPtr(len);
    else if (type_kind == A_structTypeKind) {
        auto type_name = *d->u.declArray->type->u.structType;
        v = LocalVal::CreateStructPtr(len, type_name);
    }

    assert(v != nullptr);
    emit_irs_.push_back(ir::Stmt::CreateAlloca(Operand::FromLocal(v)));
    local_vars_[id] = v;
}

void IRGenerator::HandleLocalVarDefScalar(aA_varDef d) {
    auto id = *d->u.defScalar->id;
    auto right_val = PtrDeref(HandleRightVal(d->u.defScalar->val));
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
    // assert(len == vals.size());
    for (int i = 0; i < len; i++) {
        auto element_ptr = LocalVal::CreateIntPtr(0);
        Box<ir::Operand> right_ele = nullptr;
        if (i < vals.size()) {
            right_ele = PtrDeref(HandleRightVal(vals[i]));
        } else {
            right_ele = ir::Operand::FromIConst(0);
        }
        assert(right_ele->kind() == OperandKind::kIntConst);

        emit_irs_.push_back(ir::Stmt::CreateGep(Operand::FromLocal(element_ptr),
                                                Operand::FromLocal(base_ptr),
                                                Operand::FromIConst(i)));
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
        auto right_ele = PtrDeref(HandleRightVal(vals[i]));
        assert(right_ele->kind() == OperandKind::kLocal);
        emit_irs_.push_back(
            ir::Stmt::CreateStore(right_ele, Operand::FromLocal(element_ptr)));
    }
}

void IRGenerator::HandleLocalVarDefArray(aA_varDef d) {
    auto id = *d->u.defArray->id;
    auto len = d->u.defArray->len;
    auto vals = d->u.defArray->vals;

    std::shared_ptr<ir::LocalVal> local_val = nullptr;
    std::string type_name;

    if (d->u.defArray->type->type == A_nativeTypeKind) {
        local_val = LocalVal::CreateIntPtr(len);
    } else if (d->u.defArray->type->type == A_structTypeKind) {
        type_name = *d->u.defArray->type->u.structType;
        local_val = LocalVal::CreateStructPtr(len, type_name);
    } else {
        assert(0);
    }

    assert(local_val != nullptr);
    local_vars_[id] = local_val;
    emit_irs_.push_back(ir::Stmt::CreateAlloca(Operand::FromLocal(local_val)));

    if (d->u.defArray->type->type == A_nativeTypeKind) {
        InitArray(local_val, len, vals);
    } else if (d->u.defArray->type->type == A_structTypeKind) {
        InitStruct(local_val, len, vals, type_name);
    } else {
        assert(0);
    }
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
    auto right = PtrDeref(HandleRightVal(as->rightVal));

    /**
     * Deduce the type. For now we suppose that global variables are all
     * initialized.
     */
    auto inner = left->inner();
    if (inner && inner->len() == -2) {
        RegType rt = right->inner()->type();
        int len = right->inner()->len();
        string name = right->inner()->struct_name();
        std::shared_ptr<LocalVal> deduced = nullptr;

        if (rt == RegType::kInt)
            deduced = LocalVal::CreateIntPtr(0);
        else if (rt == RegType::kIntPtr)
            deduced = LocalVal::CreateIntPtr(len);
        else if (rt == RegType::kStruct)
            deduced = LocalVal::CreateStructPtr(0, name);
        else if (rt == RegType::kStructPtr)
            deduced = LocalVal::CreateStructPtr(len, name);
        else
            assert(0);

        emit_irs_.push_back(
            ir::Stmt::CreateAlloca(Operand::FromLocal(deduced)));
        local_vars_[*as->leftVal->u.id] = deduced;
        left = Operand::FromLocal(deduced);
    }

    emit_irs_.push_back(ir::Stmt::CreateStore(right, left));
}

void IRGenerator::HandleCallStmt(aA_callStmt call) {
    auto func_name = *call->fnCall->fn;
    vector<std::shared_ptr<Operand>> args;
    for (const auto& arg : call->fnCall->vals) {
        args.push_back(PtrDeref(HandleRightVal(arg)));
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

    // True block.
    emit_irs_.push_back(ir::Stmt::CreateLabel(true_label));
    for (auto b : ifs->ifStmts) HandleBlock(b, con_label, bre_label);
    emit_irs_.push_back(ir::Stmt::CreateJump(after_label));

    // False block.
    emit_irs_.push_back(ir::Stmt::CreateLabel(false_label));
    for (auto b : ifs->elseStmts) HandleBlock(b, con_label, bre_label);
    emit_irs_.push_back(ir::Stmt::CreateJump(after_label));

    // After block.
    emit_irs_.push_back(ir::Stmt::CreateLabel(after_label));
}

void IRGenerator::HandleWhileStmt(aA_whileStmt ws) {
    auto test_label = BlockLabel::CreateEmpty();
    auto true_label = BlockLabel::CreateEmpty();
    auto false_label = BlockLabel::CreateEmpty();

    /**
     * Every block should end with a `br` instruction. Therefore, we manually
     * terminate the last block here.
     *
     * Note the subtle difference between the `if` and `while` statements. In
     * the case of an `if`, the boolean condition is evaluated only once, so
     * `HandleBoolUnit` can be included in the previous block. However, in a
     * `while`, the condition is checked multiple times, which introduces a
     * `test_label` right before `HandleBoolUnit`. Although `HandleBoolUnit`
     * emits a `br` to terminate the block, the presence of the `test_label`
     * before it causes the last block to end without `br`, which violates the
     * rule of terminating a block with a `br`. To address this, we manually
     * insert a jump here to ensure proper block termination.
     */
    emit_irs_.push_back(ir::Stmt::CreateJump(test_label));

    // Test block.
    emit_irs_.push_back(ir::Stmt::CreateLabel(test_label));
    HandleBoolUnit(ws->boolUnit, true_label, false_label);

    // While body.
    emit_irs_.push_back(ir::Stmt::CreateLabel(true_label));
    for (const auto& b : ws->whileStmts)
        HandleBlock(b, test_label, false_label);
    emit_irs_.push_back(ir::Stmt::CreateJump(test_label));

    // After while.
    emit_irs_.push_back(ir::Stmt::CreateLabel(false_label));
}

void IRGenerator::HandleReturnStmt(aA_returnStmt r) {
    if (r->retVal == nullptr)
        emit_irs_.push_back(ir::Stmt::CreateRet(nullptr));
    else
        emit_irs_.push_back(
            ir::Stmt::CreateRet(PtrDeref(HandleRightVal(r->retVal))));
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

void IRGenerator::ProduceBoolVal(std::shared_ptr<ir::BlockLabel> true_label,
                                 std::shared_ptr<ir::BlockLabel> false_label,
                                 std::shared_ptr<ir::BlockLabel> after_label,
                                 std::shared_ptr<ir::LocalVal> bool_evaluated) {
    /**
     * %bool_evaluated = alloca i32
     *
     * true:
     *   store i32 1, i32* %bool_evaluted
     *   br %after
     * false:
     *   store i32 0, i32* %bool_evaluted
     *   br %after
     * after:
     *   ...
     */
    emit_irs_.push_back(ir::Stmt::CreateLabel(true_label));
    emit_irs_.push_back(ir::Stmt::CreateStore(
        Operand::FromIConst(1), Operand::FromLocal(bool_evaluated)));
    emit_irs_.push_back(ir::Stmt::CreateJump(after_label));

    emit_irs_.push_back(ir::Stmt::CreateLabel(false_label));
    emit_irs_.push_back(ir::Stmt::CreateStore(
        Operand::FromIConst(0), Operand::FromLocal(bool_evaluated)));
    emit_irs_.push_back(ir::Stmt::CreateJump(after_label));

    emit_irs_.push_back(ir::Stmt::CreateLabel(after_label));
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
            emit_irs_.push_back(
                ir::Stmt::CreateAlloca(Operand::FromLocal(bool_evaluated)));
            HandleBoolExpr(r->u.boolExpr, true_label, false_label);

            ProduceBoolVal(true_label, false_label, after_label,
                           bool_evaluated);

            auto bool_val = LocalVal::CreateInt();
            emit_irs_.push_back(
                ir::Stmt::CreateLoad(Operand::FromLocal(bool_val),
                                     Operand::FromLocal(bool_evaluated)));
            return Operand::FromLocal(bool_val);
        } break;
        default:
            assert(0);
            break;
    }
}

std::shared_ptr<ir::Operand> IRGenerator::HandleArrayExpr(aA_arrayExpr ae) {
    auto arr = HandleLeftVal(ae->arr);
    std::shared_ptr<Operand> target = nullptr;
    if (arr->inner()->type() == RegType::kIntPtr) {
        target = Operand::FromLocal(LocalVal::CreateIntPtr(0));
    } else {
        auto id = arr->inner()->struct_name();
        target = Operand::FromLocal(LocalVal::CreateStructPtr(0, id));
    }

    emit_irs_.push_back(
        ir::Stmt::CreateGep(target, arr, HandleIndexExpr(ae->idx)));
    return target;
}

std::shared_ptr<ir::Operand> IRGenerator::HandleMemberExpr(aA_memberExpr ae) {
    auto s = HandleLeftVal(ae->structId);
    string type_name = s->inner()->struct_name();

    auto member = struct_props_[type_name].mem_props[*ae->memberId];
    std::shared_ptr<Operand> target = nullptr;
    switch (member.def.kind) {
        case RegType::kInt:
            target = Operand::FromLocal(LocalVal::CreateIntPtr(0));
            break;
        case RegType::kIntPtr:
            target = Operand::FromLocal(LocalVal::CreateIntPtr(member.def.len));
            break;
        case RegType::kStruct:
            target = Operand::FromLocal(
                LocalVal::CreateStructPtr(0, member.def.structname));
            break;
        case RegType::kStructPtr:
            target = Operand::FromLocal(LocalVal::CreateStructPtr(
                member.def.len, member.def.structname));
            break;
        default:
            assert(0);
            break;
    }

    emit_irs_.push_back(
        ir::Stmt::CreateGep(target, s, Operand::FromIConst(member.offset)));
    return target;
}

std::shared_ptr<ir::Operand> IRGenerator::HandleLeftVal(aA_leftVal l) {
    auto id = *l->u.id;
    if (l->kind == A_varValKind) {
        std::shared_ptr<Operand> lval = nullptr;
        if (local_vars_.find(id) != local_vars_.end())
            lval = Operand::FromLocal(local_vars_[id]);
        else if (global_vars_.find(id) != global_vars_.end())
            lval = Operand::FromGlobal(global_vars_[id]);
        else
            assert(0);
        return lval;
    } else if (l->kind == A_arrValKind) {
        return HandleArrayExpr(l->u.arrExpr);
    } else if (l->kind == A_memberValKind) {
        return HandleMemberExpr(l->u.memberExpr);
    } else {
        assert(0);
    }
}

std::shared_ptr<ir::Operand> IRGenerator::HandleIndexExpr(aA_indexExpr index) {
    if (index->kind == A_idIndexKind) {
        auto idx = LocalVal::CreateInt();
        if (local_vars_.find(*index->u.id) != local_vars_.end()) {
            auto src = local_vars_[*index->u.id];
            emit_irs_.push_back(ir::Stmt::CreateLoad(Operand::FromLocal(idx),
                                                     Operand::FromLocal(src)));
        } else if (global_vars_.find(*index->u.id) != global_vars_.end()) {
            auto src = global_vars_[*index->u.id];
            emit_irs_.push_back(ir::Stmt::CreateLoad(Operand::FromLocal(idx),
                                                     Operand::FromGlobal(src)));
        } else {
            assert(0);
        }
        return Operand::FromLocal(idx);
    } else {
        return Operand::FromIConst(index->u.num);
    }
}

std::shared_ptr<ir::Operand> IRGenerator::HandleBoolExpr(
    aA_boolExpr b, std::shared_ptr<BlockLabel> true_label,
    std::shared_ptr<BlockLabel> false_label) {
    if ((true_label == nullptr) && (false_label == nullptr)) {
        auto true_label = BlockLabel::CreateEmpty();
        auto false_label = BlockLabel::CreateEmpty();
        auto after_label = BlockLabel::CreateEmpty();

        auto bool_evaluated = LocalVal::CreateIntPtr(0);
        emit_irs_.push_back(
            ir::Stmt::CreateAlloca(Operand::FromLocal(bool_evaluated)));

        if (b->kind == A_boolExprType::A_boolBiOpExprKind) {
            HandleBoolBiOpExpr(b->u.boolBiOpExpr, true_label, false_label);
        } else if (b->kind == A_boolExprType::A_boolUnitKind) {
            HandleBoolUnit(b->u.boolUnit, true_label, false_label);
        } else {
            assert(0);
        }

        ProduceBoolVal(true_label, false_label, after_label, bool_evaluated);

        /**
         * Truncate i32 bool_evaluated into i1
         */
        auto truncated = LocalVal::CreateInt();
        auto bool_val = LocalVal::CreateInt();
        emit_irs_.push_back(ir::Stmt::CreateLoad(
            Operand::FromLocal(bool_val), Operand::FromLocal(bool_evaluated)));
        emit_irs_.push_back(ir::Stmt::CreateCmp(
            ir::RelOpKind::kNe, Operand::FromLocal(bool_val),
            Operand::FromIConst(0), Operand::FromLocal(truncated)));

        return Operand::FromLocal(truncated);

    } else if (true_label == nullptr || false_label == nullptr) {
        assert(0);
    }

    if (b->kind == A_boolExprType::A_boolBiOpExprKind)
        HandleBoolBiOpExpr(b->u.boolBiOpExpr, true_label, false_label);
    else if (b->kind == A_boolExprType::A_boolUnitKind)
        HandleBoolUnit(b->u.boolUnit, true_label, false_label);
    else
        assert(0);
    return nullptr;
}

void IRGenerator::HandleBoolBiOpExpr(aA_boolBiOpExpr b,
                                     std::shared_ptr<BlockLabel> true_label,
                                     std::shared_ptr<BlockLabel> false_label) {
    auto eval_right_label = BlockLabel::CreateEmpty();
    auto lhs = HandleBoolExpr(b->left, nullptr, nullptr);
    assert(true_label && false_label);
    if (b->op == A_and) {
        emit_irs_.push_back(
            ir::Stmt::CreateCJump(lhs, eval_right_label, false_label));
        emit_irs_.push_back(ir::Stmt::CreateLabel(eval_right_label));
        auto rhs = HandleBoolExpr(b->right, nullptr, nullptr);
        emit_irs_.push_back(
            ir::Stmt::CreateCJump(rhs, true_label, false_label));
    } else if (b->op == A_or) {
        emit_irs_.push_back(
            ir::Stmt::CreateCJump(lhs, true_label, eval_right_label));
        emit_irs_.push_back(ir::Stmt::CreateLabel(eval_right_label));
        auto rhs = HandleBoolExpr(b->right, nullptr, nullptr);
        emit_irs_.push_back(
            ir::Stmt::CreateCJump(rhs, true_label, false_label));
    } else {
        assert(0);
    }
}

void IRGenerator::HandleBoolUnit(aA_boolUnit b,
                                 std::shared_ptr<BlockLabel> true_label,
                                 std::shared_ptr<BlockLabel> false_label) {
    if (b->kind == A_boolUnitType::A_comOpExprKind) {
        HandleComOpExpr(b->u.comExpr, true_label, false_label);
    } else if (b->kind == A_boolUnitType::A_boolExprKind) {
        HandleBoolExpr(b->u.boolExpr, true_label, false_label);
    } else if (b->kind == A_boolUnitType::A_boolUOpExprKind) {
        HandleBoolUnit(b->u.boolUOpExpr->cond, false_label, true_label);
    }
}

void IRGenerator::HandleComOpExpr(aA_comExpr c,
                                  std::shared_ptr<BlockLabel> true_label,
                                  std::shared_ptr<BlockLabel> false_label) {
    auto val = LocalVal::CreateInt();
    auto lhs = PtrDeref(HandleExprUnit(c->left));
    auto rhs = PtrDeref(HandleExprUnit(c->right));
    ir::RelOpKind kind;
    switch (c->op) {
        case A_lt:
            kind = RelOpKind::kLt;
            break;
        case A_le:
            kind = RelOpKind::kLe;
            break;
        case A_gt:
            kind = RelOpKind::kGt;
            break;
        case A_ge:
            kind = RelOpKind::kGe;
            break;
        case A_eq:
            kind = RelOpKind::kEq;
            break;
        case A_ne:
            kind = RelOpKind::kNe;
            break;
        default:
            assert(0);
            break;
    }
    emit_irs_.push_back(
        ir::Stmt::CreateCmp(kind, lhs, rhs, Operand::FromLocal(val)));
    emit_irs_.push_back(ir::Stmt::CreateCJump(Operand::FromLocal(val),
                                              true_label, false_label));
}

std::shared_ptr<ir::Operand> IRGenerator::HandleArithBiOpExpr(
    aA_arithBiOpExpr a) {
    auto lhs = HandleArithExpr(a->left);
    auto rhs = HandleArithExpr(a->right);
    auto res = LocalVal::CreateInt();
    ir::BiOpKind kind;
    switch (a->op) {
        case A_add:
            kind = ir::BiOpKind::kPlus;
            break;
        case A_sub:
            kind = ir::BiOpKind::KMinus;
            break;
        case A_mul:
            kind = ir::BiOpKind::kMul;
            break;
        case A_div:
            kind = ir::BiOpKind::kDiv;
            break;
        default:
            assert(0);
            break;
    }
    auto biop_stmt =
        ir::Stmt::CreateBiOp(kind, lhs, rhs, Operand::FromLocal(res));
    emit_irs_.push_back(biop_stmt);
    return Operand::FromLocal(res);
}

std::shared_ptr<ir::Operand> IRGenerator::HandleArithUExpr(aA_arithUExpr a) {
    auto val = PtrDeref(HandleExprUnit(a->expr));
    auto res = LocalVal::CreateInt();
    emit_irs_.push_back(ir::Stmt::CreateBiOp(ir::BiOpKind::KMinus,
                                             Operand::FromIConst(0), val,
                                             Operand::FromLocal(res)));
    return Operand::FromLocal(res);
}

std::shared_ptr<ir::Operand> IRGenerator::HandleArithExpr(aA_arithExpr a) {
    if (a->kind == A_arithExprType::A_arithBiOpExprKind) {
        return HandleArithBiOpExpr(a->u.arithBiOpExpr);
    } else if (a->kind == A_arithExprType::A_exprUnitKind) {
        return PtrDeref(HandleExprUnit(a->u.exprUnit));
    } else {
        assert(0);
    }
}

std::shared_ptr<ir::Operand> IRGenerator::HandleExprUnit(aA_exprUnit e) {
    switch (e->kind) {
        case A_numExprKind: {
            return Operand::FromIConst(e->u.num);
        } break;
        case A_idExprKind: {
            auto id = *e->u.id;
            std::shared_ptr<Operand> val = nullptr;
            if (local_vars_.find(id) != local_vars_.end())
                val = Operand::FromLocal(local_vars_[id]);
            else if (global_vars_.find(id) != global_vars_.end())
                val = Operand::FromGlobal(global_vars_[id]);
            else
                assert(0);
            return val;
        } break;
        case A_arithExprKind: {
            return HandleArithExpr(e->u.arithExpr);
        } break;
        case A_fnCallKind: {
            std::shared_ptr<Operand> res = nullptr;
            auto func_name = *e->u.callExpr->fn;
            switch (func_ret_[func_name].type) {
                case ReturnType::kInt: {
                    res = Operand::FromLocal(LocalVal::CreateInt());
                    break;
                }
                case ReturnType::kStruct: {
                    auto type_name = func_ret_[func_name].structname;
                    res = Operand::FromLocal(LocalVal::CreateStruct(type_name));
                    break;
                }
                default: {
                    assert(0);
                    break;
                }
            }
            vector<std::shared_ptr<Operand>> args;
            for (const auto& arg : e->u.callExpr->vals)
                args.push_back(PtrDeref(HandleRightVal(arg)));
            emit_irs_.push_back(ir::Stmt::CreateCall(func_name, res, args));
            return res;
        } break;
        case A_arrayExprKind: {
            return HandleArrayExpr(e->u.arrayExpr);
        } break;
        case A_memberExprKind: {
            return HandleMemberExpr(e->u.memberExpr);
        } break;
        case A_arithUExprKind: {
            return HandleArithUExpr(e->u.arithUExpr);
        } break;
        default:
            assert(0);
            break;
    }
}

std::shared_ptr<ir::Func> IRGenerator::GenerateFn(std::shared_ptr<FuncProp> f) {
    std::list<std::shared_ptr<Block>> blocks;
    std::list<std::shared_ptr<Stmt>> insts;
    bool flag = false;
    for (const auto& stmt : f->irs) {
        if (stmt->type() == StmtKind::kLabel) {
            if (insts.empty() == false) {
                blocks.push_back(std::make_shared<ir::Block>(
                    std::make_shared<std::list<std::shared_ptr<Stmt>>>(insts)));
                insts.clear();
            }
            flag = false;
        }
        if (flag) continue;
        if (stmt->type() == StmtKind::kRet ||
            stmt->type() == StmtKind::kCjump ||
            stmt->type() == StmtKind::kJump) {
            flag = true;
        }
        insts.push_back(stmt);
    }
    if (insts.empty() == false)
        blocks.push_back(std::make_shared<ir::Block>(
            std::make_shared<std::list<std::shared_ptr<Stmt>>>(insts)));

    return std::make_shared<Func>(f->name, f->ret, f->args, blocks);
}

void IRGenerator::MoveAlloca(std::shared_ptr<ir::Func> f) {
    std::list<std::shared_ptr<Block>> blocks = f->blocks();
    auto first_block = blocks.front();

    for (auto i = ++(blocks.begin()); i != blocks.end(); i++) {
        std::shared_ptr<ir::Block> block = (*i);
        for (auto it = block->instrs()->begin();
             it != block->instrs()->end();) {
            if ((*it)->type() == StmtKind::kAlloca) {
                first_block->instrs()->insert(++first_block->instrs()->begin(),
                                              *it);
                it = block->instrs()->erase(it);
            } else {
                it++;
            }
        }
    }
}

std::shared_ptr<Operand> IRGenerator::PtrDeref(std::shared_ptr<Operand> ptr) {
    if (ptr == nullptr) return nullptr;
    if (ptr->kind() == OperandKind::kIntConst) return ptr;

    auto inner = ptr->inner();

    /**
     * Consider two cases here:
     *  - Dereference a pointer which points to an i32.
     *  - Dereference a global variable.
     */
    if (inner->type() == RegType::kIntPtr) {
        if (inner->len() == 0) {
            auto val = LocalVal::CreateInt();
            emit_irs_.push_back(
                ir::Stmt::CreateLoad(Operand::FromLocal(val), ptr));
            return Operand::FromLocal(val);
        }
    } else if (inner->type() == RegType::kInt) {
        if (ptr->kind() == OperandKind::kGlobal) {
            auto val = LocalVal::CreateInt();
            emit_irs_.push_back(
                ir::Stmt::CreateLoad(Operand::FromLocal(val), ptr));
            return Operand::FromLocal(val);
        }
    }
    return ptr;
}
}  // namespace ir