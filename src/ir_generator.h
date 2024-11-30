#pragma once

#include <list>
#include <string>
#include <unordered_map>
#include <vector>

#include "ir_def.h"
#include "teapl_aast.h"

namespace ir {

struct MemberProp {
    int offset;
    ir::ValDef def;
    MemberProp(int off = 0, ir::ValDef d = ir::ValDef())
        : offset(off), def(d) {}
};

struct StructProp {
    std::unordered_map<std::string, MemberProp> mem_props;
};

struct FuncProp {
    std::string name;
    ir::FuncType ret;
    std::vector<std::shared_ptr<ir::LocalVal>> args;
    std::list<std::shared_ptr<ir::Stmt>> irs;
    FuncProp(const std::string _name, ir::FuncType _ret,
             const std::vector<std::shared_ptr<LocalVal>>& _args,
             const std::list<std::shared_ptr<ir::Stmt>>& _irs)
        : name(_name), ret(_ret), args(_args), irs(_irs) {}
};

class IRGenerator {
   public:
    std::shared_ptr<ir::Prog> Generate(aA_program p);

   private:
    std::shared_ptr<ir::Func> GenerateFn(std::shared_ptr<FuncProp> f);
    std::vector<std::shared_ptr<ir::TopLevelDef>> GenerateFirst(aA_program p);
    std::vector<std::shared_ptr<FuncProp>> GenerateSecond(aA_program p);
    void MoveAlloca(std::shared_ptr<ir::Func> f);
    void HandleGlobalVarDecl(vector<std::shared_ptr<TopLevelDef>>& defs,
                             aA_programElement v);
    void HandleGlobalVarDeclScalar(vector<std::shared_ptr<TopLevelDef>>& defs,
                                   aA_programElement v);
    void HandleGlobalVarDeclArray(vector<std::shared_ptr<TopLevelDef>>& defs,
                                  aA_programElement v);
    void HandleGlobalVarDefScalar(vector<std::shared_ptr<TopLevelDef>>& defs,
                                  aA_programElement v);
    void HandleGlobalVarDefArray(vector<std::shared_ptr<TopLevelDef>>& defs,
                                 aA_programElement v);
    void HandleStructDef(vector<std::shared_ptr<TopLevelDef>>& defs,
                         aA_programElement v);
    void HandleFnDecl(vector<std::shared_ptr<TopLevelDef>>& defs,
                      aA_programElement v);
    void HandleFnDef(vector<std::shared_ptr<TopLevelDef>>& defs,
                     aA_programElement v);
    int HandleRightValFirst(aA_rightVal r);
    int HandleBoolExprFirst(aA_boolExpr b);
    int HandleBoolBiOpExpr(aA_boolBiOpExpr b);
    int HandleBoolUOpExpr(aA_boolUOpExpr b);
    int HandleBoolUnit(aA_boolUnit b);
    int HandleComOpExpr(aA_comExpr c);
    int HandleArithBiOpExprFirst(aA_arithBiOpExpr a);
    int HandleArithUExprFirst(aA_arithUExpr a);
    int HandleArithExprFirst(aA_arithExpr a);
    int HandleExprUnitFirst(aA_exprUnit e);
    std::shared_ptr<FuncProp> HandleFunc(aA_fnDef f);
    void HandleBlock(aA_codeBlockStmt b, std::shared_ptr<BlockLabel> con_label,
                     std::shared_ptr<BlockLabel> bre_label);
    std::shared_ptr<ir::Operand> HandleRightVal(aA_rightVal r);
    std::shared_ptr<ir::Operand> HandleLeftVal(aA_leftVal l);
    std::shared_ptr<ir::Operand> HandleIndexExpr(aA_indexExpr index);
    std::shared_ptr<ir::Operand> HandleBoolExpr(
        aA_boolExpr b, std::shared_ptr<BlockLabel> true_label,
        std::shared_ptr<BlockLabel> false_label);
    void HandleBoolBiOpExpr(aA_boolBiOpExpr b,
                            std::shared_ptr<BlockLabel> true_label,
                            std::shared_ptr<BlockLabel> false_label);
    void HandleBoolUnit(aA_boolUnit b, std::shared_ptr<BlockLabel> true_label,
                        std::shared_ptr<BlockLabel> false_label);
    void HandleComOpExpr(aA_comExpr c, std::shared_ptr<BlockLabel> true_label,
                         std::shared_ptr<BlockLabel> false_label);
    std::shared_ptr<ir::Operand> HandleArithBiOpExpr(aA_arithBiOpExpr a);
    std::shared_ptr<ir::Operand> HandleArithUExpr(aA_arithUExpr a);
    std::shared_ptr<ir::Operand> HandleArithExpr(aA_arithExpr a);
    std::shared_ptr<ir::Operand> HandleExprUnit(aA_exprUnit e);
    void HandleLocalVarDecl(aA_varDeclStmt v);
    void HandleLocalVarDeclScalar(aA_varDecl d);
    void HandleLocalVarDeclArray(aA_varDecl d);
    void HandleLocalVarDefScalar(aA_varDef d);
    void HandleLocalVarDefArray(aA_varDef d);
    void HandleAssignmentStmt(aA_assignStmt as);
    void HandleCallStmt(aA_callStmt call);
    void HandleIfStmt(aA_ifStmt ifs, std::shared_ptr<BlockLabel> con_label,
                      std::shared_ptr<BlockLabel> bre_label);
    void HandleWhileStmt(aA_whileStmt ws);
    void HandleReturnStmt(aA_returnStmt r);
    std::shared_ptr<ir::Operand> HandleArrayExpr(aA_arrayExpr ae);
    std::shared_ptr<ir::Operand> HandleMemberExpr(aA_memberExpr ae);
    void InitArray(std::shared_ptr<LocalVal> base_ptr, int len,
                   vector<aA_rightVal> vals);
    void InitStruct(std::shared_ptr<LocalVal> base_ptr, int len,
                    vector<aA_rightVal> vals, string& type_name);
    void ProduceBoolVal(std::shared_ptr<ir::BlockLabel> true_label,
                        std::shared_ptr<ir::BlockLabel> false_label,
                        std::shared_ptr<ir::BlockLabel> after_label,
                        std::shared_ptr<ir::LocalVal> bool_evaluated);
    std::vector<std::shared_ptr<ir::LocalVal>> HandleFunctionArguments(
        const std::vector<aA_varDecl>& arg_decls);
    std::shared_ptr<ir::LocalVal> HandleScalarArgument(const aA_varDecl& decl);
    std::shared_ptr<ir::LocalVal> HandleArrayArgument(const aA_varDecl& decl);
    void HandleFunctionReturn(const FuncType& ret_type);
    std::shared_ptr<Operand> PtrDeref(std::shared_ptr<Operand> ptr);
    std::unordered_map<string, FuncType> func_ret_;
    std::unordered_map<string, StructProp> struct_props_;
    std::unordered_map<string, std::shared_ptr<GlobalVal>> global_vars_;
    std::unordered_map<string, std::shared_ptr<LocalVal>> local_vars_;
    std::list<std::shared_ptr<ir::Stmt>> emit_irs_;
};

}  // namespace ir
