#pragma once

#include <iostream>
#include <memory>
#include <unordered_map>

#include "TeaplAst.h"
#include "TeaplaAst.h"

struct ExprType;

/* Token id to token type, including function name to return type. */
typedef std::unordered_map<string, std::shared_ptr<ExprType>> TypeMap;

/* Function name to params. */
typedef std::unordered_map<string, std::shared_ptr<vector<aA_varDecl>>> ParamMemberMap;

enum class ConstructType {
    SCALAR = 0,
    ARRAY = 1,
    FUNCTION = 2,
};

/**
 * @todo: Move this to somewhere else.
 */
static bool comp_aA_type(aA_type target, aA_type t) {
    if (!target || !t) return false;
    if (target->type != t->type) return false;
    if (target->type == A_dataType::A_nativeTypeKind)
        if (target->u.nativeType != t->u.nativeType) return false;
    if (target->type == A_dataType::A_structTypeKind)
        if (target->u.structType != t->u.structType) return false;
    return true;
}

struct ExprType {
    ExprType(aA_type t, uint construct_type)
        : type(t), construct_type(ConstructType(construct_type)) {}

    ExprType(aA_varDecl vd)
        : ExprType(
              (vd->kind == A_varDeclType::A_varDeclScalarKind)
                  ? vd->u.declScalar->type
                  : vd->u.declArray->type,
              (vd->kind == A_varDeclType::A_varDeclScalarKind) ? 0 : 1) {}

    ExprType(aA_varDef vdef)
        : ExprType(
              (vdef->kind == A_varDefType::A_varDefScalarKind)
                  ? vdef->u.defScalar->type
                  : vdef->u.defArray->type,
              (vdef->kind == A_varDefType::A_varDefScalarKind) ? 0 : 1) {}

    bool operator==(const ExprType &other) const {
        if (construct_type != other.construct_type) return false;
        return comp_aA_type(type, other.type);
    }

    aA_type type;
    ConstructType construct_type;
};

class TypeChecker {
   public:
    TypeChecker() = delete;
    TypeChecker(std::ostream &out)
        : out_(out), local_type_map_(vector{std::make_shared<TypeMap>()}) {}

    void CheckProgram(aA_program p);
    void CheckVarDecl(aA_varDeclStmt vd);
    void CheckSymbolConficts(string &name, A_pos pos);
    void CheckStructDef(aA_structDef sd);
    void CheckFnDeclStmt(aA_fnDeclStmt fd);
    void CheckFnDecl(aA_fnDecl fd);
    void CheckFnDef(aA_fnDef fd);
    void CheckCodeblockStmt(aA_codeBlockStmt cs);
    void CheckAssignStmt(aA_assignStmt as);
    void CheckIfStmt(aA_ifStmt is);
    void CheckBoolUnit(aA_boolUnit bu);
    void CheckBoolExpr(aA_boolExpr be);
    void CheckWhileStmt(aA_whileStmt ws);
    void CheckCallStmt(aA_callStmt cs);
    void CheckFuncCall(aA_fnCall fc);
    void CheckReturnStmt(aA_returnStmt rs);
    void CheckArrayExpr(aA_arrayExpr ae);
    std::shared_ptr<ExprType> CheckMemberExpr(aA_memberExpr me);
    std::shared_ptr<ExprType> CheckExprUnit(aA_exprUnit eu);
    std::shared_ptr<ExprType> CheckArithExpr(aA_arithExpr ae);

   private:
    bool QueryInFuncParams(string &name, std::shared_ptr<ExprType> *ret);
    bool QueryInLocalVars(string &name, std::shared_ptr<ExprType> *ret);
    bool QueryInGlobalVars(string &name, std::shared_ptr<ExprType> *ret);
    bool QueryIdentifier(string &name, std::shared_ptr<ExprType> *ret);
    bool QueryInStructDefs(string &name);
    void EnterBlock();
    void LeaveBlock();
    friend void PrintError(TypeChecker &checker, A_pos p, string info);
    friend void PrintTypeMaps(TypeChecker &checker);

    std::ostream &out_;
    size_t level_;
    string *current_func_;
    TypeMap global_type_map_;      // Global token ids to type.
    TypeMap func_param_type_map_;  // Local token ids to type, since func
                                   // param can override global param.
    vector<std::shared_ptr<TypeMap>> local_type_map_;
    ParamMemberMap func_params_map_;
    ParamMemberMap struct_members_map_;
};

void PrintTypeMap(TypeMap *map);