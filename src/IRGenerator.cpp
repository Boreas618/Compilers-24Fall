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

int ast2llvmRightVal_first(aA_rightVal r) {
  if (r == nullptr) {
    return 0;
  }
  switch (r->kind) {
    case A_arithExprValKind: {
      return ast2llvmArithExpr_first(r->u.arithExpr);
      break;
    }
    case A_boolExprValKind: {
      return ast2llvmBoolExpr_first(r->u.boolExpr);
      break;
    }
    default:
      break;
  }
  return 0;
}

int ast2llvmBoolExpr_first(aA_boolExpr b) {
  switch (b->kind) {
    case A_boolBiOpExprKind: {
      return ast2llvmBoolBiOpExpr_first(b->u.boolBiOpExpr);
      break;
    }
    case A_boolUnitKind: {
      return ast2llvmBoolUnit_first(b->u.boolUnit);
      break;
    }
    default:
      break;
  }
  return 0;
}

int ast2llvmBoolBiOpExpr_first(aA_boolBiOpExpr b) {
  int l = ast2llvmBoolExpr_first(b->left);
  int r = ast2llvmBoolExpr_first(b->right);
  if (b->op == A_and) {
    return l && r;
  } else {
    return l || r;
  }
}

int ast2llvmBoolUOpExpr_first(aA_boolUOpExpr b) {
  if (b->op == A_not) {
    return !ast2llvmBoolUnit_first(b->cond);
  }
  return 0;
}

int ast2llvmBoolUnit_first(aA_boolUnit b) {
  switch (b->kind) {
    case A_comOpExprKind: {
      return ast2llvmComOpExpr_first(b->u.comExpr);
      break;
    }
    case A_boolExprKind: {
      return ast2llvmBoolExpr_first(b->u.boolExpr);
      break;
    }
    case A_boolUOpExprKind: {
      return ast2llvmBoolUOpExpr_first(b->u.boolUOpExpr);
      break;
    }
    default:
      break;
  }
  return 0;
}

int ast2llvmComOpExpr_first(aA_comExpr c) {
  auto l = ast2llvmExprUnit_first(c->left);
  auto r = ast2llvmExprUnit_first(c->right);
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

int ast2llvmArithBiOpExpr_first(aA_arithBiOpExpr a) {
  auto l = ast2llvmArithExpr_first(a->left);
  auto r = ast2llvmArithExpr_first(a->right);
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

int ast2llvmArithUExpr_first(aA_arithUExpr a) {
  if (a->op == A_neg) {
    return -ast2llvmExprUnit_first(a->expr);
  }
  return 0;
}

int ast2llvmArithExpr_first(aA_arithExpr a) {
  switch (a->kind) {
    case A_arithBiOpExprKind: {
      return ast2llvmArithBiOpExpr_first(a->u.arithBiOpExpr);
      break;
    }
    case A_exprUnitKind: {
      return ast2llvmExprUnit_first(a->u.exprUnit);
      break;
    }
    default:
      assert(0);
      break;
  }
  return 0;
}

int ast2llvmExprUnit_first(aA_exprUnit e) {
  if (e->kind == A_numExprKind) {
    return e->u.num;
  } else if (e->kind == A_arithExprKind) {
    return ast2llvmArithExpr_first(e->u.arithExpr);
  } else if (e->kind == A_arithUExprKind) {
    return ast2llvmArithUExpr_first(e->u.arithUExpr);
  } else {
    assert(0);
  }
  return 0;
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
        if (v->u.varDeclStmt->kind == A_varDeclKind) {
          if (v->u.varDeclStmt->u.varDecl->kind == A_varDeclScalarKind) {
            if (v->u.varDeclStmt->u.varDecl->u.declScalar->type->type ==
                A_structTypeKind) {
              global_vars_.emplace(
                  *v->u.varDeclStmt->u.varDecl->u.declScalar->id,
                  GlobalVal::CreateStruct(
                      BlockLabel::CreateFrom(
                          *v->u.varDeclStmt->u.varDecl->u.declScalar->id),
                      *v->u.varDeclStmt->u.varDecl->u.declScalar->type->u
                           .structType));
              ValDef def(RegType::kStruct, 0,
                         *v->u.varDeclStmt->u.varDecl->u.declScalar->type->u
                              .structType);
              defs.push_back(TopLevelDef::CreateGlobalDef(
                  *v->u.varDeclStmt->u.varDecl->u.declScalar->id, def,
                  vector<int>()));
            } else {
              global_vars_.emplace(
                  *v->u.varDeclStmt->u.varDecl->u.declScalar->id,
                  GlobalVal::CreateInt(BlockLabel::CreateFrom(
                      *v->u.varDeclStmt->u.varDecl->u.declScalar->id)));
              ValDef def(RegType::kInt, 0);
              defs.push_back(TopLevelDef::CreateGlobalDef(
                  *v->u.varDeclStmt->u.varDecl->u.declScalar->id, def,
                  vector<int>()));
            }
          } else if (v->u.varDeclStmt->u.varDecl->kind == A_varDeclArrayKind) {
            if (v->u.varDeclStmt->u.varDecl->u.declArray->type->type ==
                A_structTypeKind) {
              global_vars_.emplace(
                  *v->u.varDeclStmt->u.varDecl->u.declArray->id,
                  GlobalVal::CreateStructPtr(
                      BlockLabel::CreateFrom(
                          *v->u.varDeclStmt->u.varDecl->u.declArray->id),
                      v->u.varDeclStmt->u.varDecl->u.declArray->len,
                      *v->u.varDeclStmt->u.varDecl->u.declArray->type->u
                           .structType));
              ValDef def(RegType::kStructPtr,
                         v->u.varDeclStmt->u.varDecl->u.declArray->len,
                         *v->u.varDeclStmt->u.varDecl->u.declArray->type->u
                              .structType);
              defs.push_back(TopLevelDef::CreateGlobalDef(
                  *v->u.varDeclStmt->u.varDecl->u.declArray->id, def,
                  vector<int>()));
            } else {
              global_vars_.emplace(
                  *v->u.varDeclStmt->u.varDecl->u.declArray->id,
                  GlobalVal::CreateIntPtr(
                      BlockLabel::CreateFrom(
                          *v->u.varDeclStmt->u.varDecl->u.declArray->id),
                      v->u.varDeclStmt->u.varDecl->u.declArray->len));
              ValDef def(RegType::kIntPtr,
                         v->u.varDeclStmt->u.varDecl->u.declArray->len);
              defs.push_back(TopLevelDef::CreateGlobalDef(
                  *v->u.varDeclStmt->u.varDecl->u.declArray->id, def,
                  vector<int>()));
            }
          } else {
            assert(0);
          }
        } else if (v->u.varDeclStmt->kind == A_varDefKind) {
          if (v->u.varDeclStmt->u.varDef->kind == A_varDefScalarKind) {
            if (v->u.varDeclStmt->u.varDef->u.defScalar->type->type ==
                A_structTypeKind) {
              global_vars_.emplace(
                  *v->u.varDeclStmt->u.varDef->u.defScalar->id,
                  GlobalVal::CreateStruct(
                      BlockLabel::CreateFrom(
                          *v->u.varDeclStmt->u.varDef->u.defScalar->id),
                      *v->u.varDeclStmt->u.varDef->u.defScalar->type->u
                           .structType));
              ValDef def(
                  RegType::kStruct, 0,
                  *v->u.varDeclStmt->u.varDef->u.defScalar->type->u.structType);
              defs.push_back(TopLevelDef::CreateGlobalDef(
                  *v->u.varDeclStmt->u.varDef->u.defScalar->id, def,
                  vector<int>()));
            } else {
              global_vars_.emplace(
                  *v->u.varDeclStmt->u.varDef->u.defScalar->id,
                  GlobalVal::CreateInt(BlockLabel::CreateFrom(
                      *v->u.varDeclStmt->u.varDef->u.defScalar->id)));
              ValDef def(RegType::kInt, 0);
              vector<int> init;
              init.push_back(ast2llvmRightVal_first(
                  v->u.varDeclStmt->u.varDef->u.defScalar->val));
              defs.push_back(TopLevelDef::CreateGlobalDef(
                  *v->u.varDeclStmt->u.varDef->u.defScalar->id, def, init));
            }
          } else if (v->u.varDeclStmt->u.varDef->kind == A_varDefArrayKind) {
            if (v->u.varDeclStmt->u.varDef->u.defArray->type->type ==
                A_structTypeKind) {
              global_vars_.emplace(
                  *v->u.varDeclStmt->u.varDef->u.defArray->id,
                  GlobalVal::CreateStructPtr(
                      BlockLabel::CreateFrom(
                          *v->u.varDeclStmt->u.varDef->u.defArray->id),
                      v->u.varDeclStmt->u.varDef->u.defArray->len,
                      *v->u.varDeclStmt->u.varDef->u.defArray->type->u
                           .structType));
              ValDef def(
                  RegType::kStructPtr,
                  v->u.varDeclStmt->u.varDef->u.defArray->len,
                  *v->u.varDeclStmt->u.varDef->u.defArray->type->u.structType);
              defs.push_back(TopLevelDef::CreateGlobalDef(
                  *v->u.varDeclStmt->u.varDef->u.defArray->id, def,
                  vector<int>()));
            } else {
              global_vars_.emplace(
                  *v->u.varDeclStmt->u.varDef->u.defArray->id,
                  GlobalVal::CreateIntPtr(
                      BlockLabel::CreateFrom(
                          *v->u.varDeclStmt->u.varDef->u.defArray->id),
                      v->u.varDeclStmt->u.varDef->u.defArray->len));
              ValDef def(RegType::kIntPtr,
                         v->u.varDeclStmt->u.varDef->u.defArray->len);
              vector<int> init;
              for (auto& el : v->u.varDeclStmt->u.varDef->u.defArray->vals) {
                init.push_back(ast2llvmRightVal_first(el));
              }
              defs.push_back(TopLevelDef::CreateGlobalDef(
                  *v->u.varDeclStmt->u.varDef->u.defArray->id, def, init));
            }
          } else {
            assert(0);
          }
        } else {
          assert(0);
        }
        break;
      }
      case A_programStructDefKind: {
        StructInfo si;
        int off = 0;
        vector<ValDef> members;
        for (const auto& decl : v->u.structDef->varDecls) {
          if (decl->kind == A_varDeclScalarKind) {
            if (decl->u.declScalar->type->type == A_structTypeKind) {
              ValDef def(RegType::kStruct, 0,
                         *decl->u.declScalar->type->u.structType);
              MemberInfo info(off++, def);
              si.memberinfos.emplace(*decl->u.declScalar->id, info);
              members.push_back(def);
            } else {
              ValDef def(RegType::kInt, 0);
              MemberInfo info(off++, def);
              si.memberinfos.emplace(*decl->u.declScalar->id, info);
              members.push_back(def);
            }
          } else if (decl->kind == A_varDeclArrayKind) {
            if (decl->u.declArray->type->type == A_structTypeKind) {
              ValDef def(RegType::kStructPtr, decl->u.declArray->len,
                         *decl->u.declArray->type->u.structType);
              MemberInfo info(off++, def);
              si.memberinfos.emplace(*decl->u.declArray->id, info);
              members.push_back(def);
            } else {
              ValDef def(RegType::kIntPtr, decl->u.declArray->len);
              MemberInfo info(off++, def);
              si.memberinfos.emplace(*decl->u.declArray->id, info);
              members.push_back(def);
            }
          } else {
            assert(0);
          }
        }
        struct_info_.emplace(*v->u.structDef->id, std::move(si));
        defs.push_back(
            TopLevelDef::CreateStructDef(*v->u.structDef->id, members));
        break;
      }
      case A_programFnDeclStmtKind: {
        FuncType type;
        if (v->u.fnDeclStmt->fnDecl->type == nullptr) {
          type.type = ReturnType::VOID_TYPE;
        } else if (v->u.fnDeclStmt->fnDecl->type->type == A_nativeTypeKind) {
          type.type = ReturnType::INT_TYPE;
        } else if (v->u.fnDeclStmt->fnDecl->type->type == A_structTypeKind) {
          type.type = ReturnType::STRUCT_TYPE;
          type.structname = *v->u.fnDeclStmt->fnDecl->type->u.structType;
        } else {
          assert(0);
        }
        if (func_ret_.find(*v->u.fnDeclStmt->fnDecl->id) == func_ret_.end())
          func_ret_.emplace(*v->u.fnDeclStmt->fnDecl->id, std::move(type));
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
        defs.push_back(TopLevelDef::CreateFuncDecl(*v->u.fnDeclStmt->fnDecl->id,
                                                   args, type));
        break;
      }
      case A_programFnDefKind: {
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
        funcs.push_back(ast2llvmFunc(v->u.fnDef));
        break;
      }
      default:
        assert(0);
        break;
    }
  }
  return funcs;
}

std::shared_ptr<FuncProp> ast2llvmFunc(aA_fnDef f) {}

void ast2llvmBlock(aA_codeBlockStmt b, BlockLabel* con_label,
                   BlockLabel* bre_label) {}

ir::Operand* ast2llvmRightVal(aA_rightVal r) {}

ir::Operand* ast2llvmLeftVal(aA_leftVal l) {}

ir::Operand* ast2llvmIndexExpr(aA_indexExpr index) {}

ir::Operand* ast2llvmBoolExpr(aA_boolExpr b, BlockLabel* true_label,
                              BlockLabel* false_label) {}

void ast2llvmBoolBiOpExpr(aA_boolBiOpExpr b, BlockLabel* true_label,
                          BlockLabel* false_label) {}

void ast2llvmBoolUnit(aA_boolUnit b, BlockLabel* true_label,
                      BlockLabel* false_label) {}

void ast2llvmComOpExpr(aA_comExpr c, BlockLabel* true_label,
                       BlockLabel* false_label) {}

ir::Operand* ast2llvmArithBiOpExpr(aA_arithBiOpExpr a) {}

ir::Operand* ast2llvmArithUExpr(aA_arithUExpr a) {}

ir::Operand* ast2llvmArithExpr(aA_arithExpr a) {}

ir::Operand* ast2llvmExprUnit(aA_exprUnit e) {}

std::shared_ptr<ir::Func> IRGenerator::GenerateFn(std::shared_ptr<FuncProp> f) {
}

void IRGenerator::MoveAlloca(std::shared_ptr<ir::Func> f) {
  auto first_block = f->blocks().front();
  for (auto i = ++f->blocks().begin(); i != f->blocks().end(); ++i) {
    for (auto it = (*i)->instrs().begin(); it != (*i)->instrs().end();) {
      if ((*it)->type() == StmtKind::kAlloca) {
        first_block->instrs().insert(++first_block->instrs().begin(), *it);
        it = (*i)->instrs().erase(it);
      } else {
        ++it;
      }
    }
  }
}