#include <list>
#include <string>
#include <unordered_map>
#include <vector>

#include "IRDef.h"
#include "TeaplaAst.h"

struct MemberInfo {
    int offset;
    ValDef def;
    MemberInfo(int off = 0, ValDef d = ValDef()) : offset(off), def(d) {}
};

struct StructInfo {
    std::unordered_map<std::string, MemberInfo> memberinfos;
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
    unordered_map<string, FuncType> func_ret_;
    unordered_map<string, StructInfo> struct_info_;
    unordered_map<string, std::shared_ptr<GlobalVal>> global_vars_;
    unordered_map<string, std::shared_ptr<LocalVal>> local_vars_;
    list<ir::Stmt> emit_irs;
};
