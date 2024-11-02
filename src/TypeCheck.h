#pragma once
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <iostream>
#include <unordered_map>

#include "TeaplAst.h"
#include "TeaplaAst.h"

/* Token id to token type, including function name to return type. */
typedef std::unordered_map<string, IdentifierType *> TypeMap;

// func name to params
typedef std::unordered_map<string, vector<aA_varDecl> *> ParamMemberMap;

/*void check_Prog(std::ostream &out, aA_program p);
void check_VarDecl(std::ostream &out, aA_varDeclStmt vd);
void check_StructDef(std::ostream &out, aA_structDef sd);
void check_FnDecl(std::ostream &out, aA_fnDecl fd);
void check_FnDeclStmt(std::ostream &out, aA_fnDeclStmt fd);
void check_FnDef(std::ostream &out, aA_fnDef fd);
void check_CodeblockStmt(std::ostream &out, aA_codeBlockStmt cs);
void check_AssignStmt(std::ostream &out, aA_assignStmt as);
void check_ArrayExpr(std::ostream &out, aA_arrayExpr ae);
IdentifierType *check_MemberExpr(std::ostream &out, aA_memberExpr me);
void check_IfStmt(std::ostream &out, aA_ifStmt is);
void check_BoolExpr(std::ostream &out, aA_boolExpr be);
void check_BoolUnit(std::ostream &out, aA_boolUnit bu);
IdentifierType *check_ExprUnit(std::ostream &out, aA_exprUnit eu);
IdentifierType *check_ArithExpr(std::ostream &out, aA_arithExpr ae);
void check_FuncCall(std::ostream &out, aA_fnCall fc);
void check_WhileStmt(std::ostream &out, aA_whileStmt ws);
void check_CallStmt(std::ostream &out, aA_callStmt cs);
void check_ReturnStmt(std::ostream &out, aA_returnStmt rs);*/

enum class ConstructType {
    SCALAR = 0,
    ARRAY = 1,
    FUNCTION = 2,
};

/**
 * @todo: Move this to somewhere else.
 */
bool comp_aA_type(aA_type target, aA_type t) {
    if (!target || !t) return false;
    if (target->type != t->type) return false;
    if (target->type == A_dataType::A_nativeTypeKind)
        if (target->u.nativeType != t->u.nativeType) return false;
    if (target->type == A_dataType::A_structTypeKind)
        if (target->u.structType != t->u.structType) return false;
    return true;
}

struct IdentifierType {
    IdentifierType(aA_type t, uint construct_type)
        : type(t), construct_type(ConstructType(construct_type)) {}

    IdentifierType(aA_varDecl vd)
        : IdentifierType(
              (vd->kind == A_varDeclType::A_varDeclScalarKind)
                  ? vd->u.declScalar->type
                  : vd->u.declArray->type,
              (vd->kind == A_varDeclType::A_varDeclScalarKind) ? 0 : 1) {}

    bool operator==(const IdentifierType &other) const {
        if (construct_type != other.construct_type) return false;
        return comp_aA_type(type, other.type);
    }

    aA_type type;
    ConstructType construct_type;
};

class TypeChecker {
   public:
    TypeChecker(std::ostream &out) : out_(out) {}

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
    IdentifierType *CheckMemberExpr(aA_memberExpr me);
    IdentifierType *CheckExprUnit(aA_exprUnit eu);
    IdentifierType *CheckArithExpr(aA_arithExpr ae);

   private:
    bool ExistFuncParamConflicts(string &name);
    bool ExistLocalVarConflicts(string &name);
    friend void PrintError(TypeChecker &checker, A_pos p, string info);
    friend void PrintTypeMaps(TypeChecker &checker);

    std::ostream &out_;
    TypeMap global_type_map_;      // Global token ids to type.
    TypeMap func_param_type_map_;  // Local token ids to type, since func
                                   // param can override global param.
    vector<TypeMap *> local_type_map_;
    ParamMemberMap func_params_map_;
    ParamMemberMap struct_members_map_;
};