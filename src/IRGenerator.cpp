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

void IRGenerator::HandleVarDeclScalar(
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

void IRGenerator::HandleVarDeclArray(vector<std::shared_ptr<TopLevelDef>>& defs,
                                     aA_programElement v) {
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

void IRGenerator::HandleVarDefScalar(vector<std::shared_ptr<TopLevelDef>>& defs,
                                     aA_programElement v) {
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

void IRGenerator::HandleVarDefArray(vector<std::shared_ptr<TopLevelDef>>& defs,
                                    aA_programElement v) {
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

void IRGenerator::HandleVarDecl(vector<std::shared_ptr<TopLevelDef>>& defs,
                                aA_programElement v) {
    if (v->u.varDeclStmt->kind == A_varDeclKind) {
        if (v->u.varDeclStmt->u.varDecl->kind == A_varDeclScalarKind) {
            HandleVarDeclScalar(defs, v);
        } else if (v->u.varDeclStmt->u.varDecl->kind == A_varDeclArrayKind) {
            HandleVarDeclArray(defs, v);
        } else {
            assert(0);
        }
    } else if (v->u.varDeclStmt->kind == A_varDefKind) {
        if (v->u.varDeclStmt->u.varDef->kind == A_varDefScalarKind) {
            HandleVarDefScalar(defs, v);
        } else if (v->u.varDeclStmt->u.varDef->kind == A_varDefArrayKind) {
            HandleVarDefArray(defs, v);
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
        ft.type = ReturnType::VOID_TYPE;
    } else if (v->u.fnDeclStmt->fnDecl->type->type == A_nativeTypeKind) {
        ft.type = ReturnType::INT_TYPE;
    } else if (v->u.fnDeclStmt->fnDecl->type->type == A_structTypeKind) {
        ft.type = ReturnType::STRUCT_TYPE;
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
            type.type = ReturnType::VOID_TYPE;
        } else if (v->u.fnDef->fnDecl->type->type == A_nativeTypeKind) {
            type.type = ReturnType::INT_TYPE;
        } else if (v->u.fnDef->fnDecl->type->type == A_structTypeKind) {
            type.type = ReturnType::STRUCT_TYPE;
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
                HandleVarDecl(defs, v);
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

std::shared_ptr<FuncProp> IRGenerator::HandleFunc(aA_fnDef f) {}

void IRGenerator::HandleBlock(aA_codeBlockStmt b,
                              std::shared_ptr<BlockLabel> con_label,
                              std::shared_ptr<BlockLabel> bre_label) {}

std::shared_ptr<ir::Operand> IRGenerator::HandleRightVal(aA_rightVal r) {}

std::shared_ptr<ir::Operand> IRGenerator::HandleLeftVal(aA_leftVal l) {}

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