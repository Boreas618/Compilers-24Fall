#include <list>
#include <string>
#include <unordered_map>
#include <vector>

#include "IRDef.h"
#include "TeaplaAst.h"

struct MemberProp {
    int offset;
    ValDef def;
    MemberProp(int off = 0, ValDef d = ValDef()) : offset(off), def(d) {}
};

struct StructProp {
    std::unordered_map<std::string, MemberProp> mem_props;
};

struct FuncProp {
    std::string name;
    ir::FuncType ret;
    std::vector<LocalVal*> args;
    std::list<std::shared_ptr<ir::Stmt>> irs;
    FuncProp(const std::string _name, ir::FuncType _ret,
             const std::vector<LocalVal*>& _args,
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
    void HandleVarDecl(vector<std::shared_ptr<TopLevelDef>>& defs,
                       aA_programElement v);
    void HandleVarDeclScalar(vector<std::shared_ptr<TopLevelDef>>& defs,
                             aA_programElement v);
    void HandleVarDeclArray(vector<std::shared_ptr<TopLevelDef>>& defs,
                            aA_programElement v);
    void HandleVarDefScalar(vector<std::shared_ptr<TopLevelDef>>& defs,
                            aA_programElement v);
    void HandleVarDefArray(vector<std::shared_ptr<TopLevelDef>>& defs,
                           aA_programElement v);
    void HandleStructDef(vector<std::shared_ptr<TopLevelDef>>& defs,
                         aA_programElement v);
    void HandleFnDecl(vector<std::shared_ptr<TopLevelDef>>& defs,
                      aA_programElement v);
    void HandleFnDef(vector<std::shared_ptr<TopLevelDef>>& defs,
                     aA_programElement v);
    int HandleRightValFirst(aA_rightVal r);
    int HandleBoolExpr(aA_boolExpr b);
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
    std::shared_ptr<ir::Operand> IRGenerator::HandleArithBiOpExpr(
        aA_arithBiOpExpr a);
    std::shared_ptr<ir::Operand> IRGenerator::HandleArithUExpr(aA_arithUExpr a);
    std::shared_ptr<ir::Operand> IRGenerator::HandleArithExpr(aA_arithExpr a);
    std::shared_ptr<ir::Operand> IRGenerator::HandleExprUnit(aA_exprUnit e);
    unordered_map<string, FuncType> func_ret_;
    unordered_map<string, StructProp> struct_props_;
    unordered_map<string, std::shared_ptr<GlobalVal>> global_vars_;
    unordered_map<string, std::shared_ptr<LocalVal>> local_vars_;
    list<ir::Stmt> emit_irs;
};
