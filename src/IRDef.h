#include <cassert>
#include <list>
#include <memory>
#include <string>
#include <unordered_set>
#include <vector>

namespace ir {
enum class RegType { kInt, kIntPtr, kStruct, kStructPtr };

static int GetNextIndex() {
  static int idx = 100;
  return idx++;
}

static int GetNextLabelIndex() {
  static int label_idx = 1;
  return label_idx++;
}

class LocalVal {
 public:
  static std::shared_ptr<LocalVal> CreateIntReg() {
    return std::make_shared<LocalVal>(GetNextIndex(), RegType::kInt);
  }

  static std::shared_ptr<LocalVal> CreateIntPtrReg(int len) {
    return std::make_shared<LocalVal>(GetNextIndex(), RegType::kIntPtr, len);
  }

  static std::shared_ptr<LocalVal> CreateStructReg(const std::string& name) {
    return std::make_shared<LocalVal>(GetNextIndex(), RegType::kStruct, 0,
                                      name);
  }

  static std::shared_ptr<LocalVal> CreateStructPtrReg(int len,
                                                      const std::string& name) {
    return std::make_shared<LocalVal>(GetNextIndex(), RegType::kStructPtr, len,
                                      name);
  }

  int num() const { return num_; }
  RegType type() const { return type_; }
  const std::string& struct_name() const { return struct_name_; }
  const std::string& var_name() const { return var_name_; }
  int len() const { return len_; }

 private:
  explicit LocalVal(int num, RegType type = RegType::kInt, int len = 0,
                    const std::string& struct_name = std::string())
      : num_(num),
        type_(type),
        struct_name_(struct_name),
        len_(len),
        var_name_("") {}
  int num_;
  RegType type_;
  std::string struct_name_;
  std::string var_name_;
  int len_;
};

struct ValDef {
  RegType kind;
  int len;
  std::string structname;
  ValDef(RegType _kind = RegType::kInt, int _len = 0,
         const std::string& _structname = std::string())
      : kind(_kind), len(_len), structname(_structname) {}
};

class BlockLabel {
 public:
  static std::shared_ptr<BlockLabel> CreateEmpty() {
    return std::make_shared<BlockLabel>("bb" +
                                        std::to_string(GetNextLabelIndex()));
  }

  static std::shared_ptr<BlockLabel> CreateFrom(const std::string& name) {
    return std::make_shared<BlockLabel>(name);
  }

 private:
  explicit BlockLabel(std::string name) : name_(name) {}
  std::string name_;
};

class GlobalVal {
 public:
  static std::shared_ptr<GlobalVal> GlobalVal::CreateInt(
      std::shared_ptr<BlockLabel> name) {
    return std::make_shared<GlobalVal>(name, RegType::kInt);
  }

  static std::shared_ptr<GlobalVal> GlobalVal::CreateIntPtr(
      std::shared_ptr<BlockLabel> name, int len) {
    return std::make_shared<GlobalVal>(name, RegType::kIntPtr, len);
  }

  static std::shared_ptr<GlobalVal> GlobalVal::CreateStruct(
      std::shared_ptr<BlockLabel> name, const std::string& struct_name) {
    return std::make_shared<GlobalVal>(name, RegType::kStruct, 0, struct_name);
  }

  static std::shared_ptr<GlobalVal> GlobalVal::CreateStructPtr(
      std::shared_ptr<BlockLabel> name, int len,
      const std::string& struct_name) {
    return std::make_shared<GlobalVal>(name, RegType::kStructPtr, len,
                                       struct_name);
  }

  std::shared_ptr<BlockLabel> name() const { return name_; }
  RegType type() const { return type_; }
  const std::string& struct_name() const { return struct_name_; }
  int len() const { return len_; }

 private:
  explicit GlobalVal(std::shared_ptr<BlockLabel> name, RegType type, int len,
                     const std::string& struct_name)
      : name_(name), type_(type), len_(len), struct_name_(struct_name) {}

  std::shared_ptr<BlockLabel> name_;
  RegType type_;
  int len_;
  std::string struct_name_;
};

enum class OperandKind { kNumbered, kNamed, kIntConst };

struct Operand {
  using InnerType =
      std::variant<std::shared_ptr<LocalVal>, std::shared_ptr<GlobalVal>, int>;

 public:
  static std::shared_ptr<Operand> CreateNumberedOp(
      std::shared_ptr<LocalVal> reg) {
    return std::make_shared<Operand>(OperandKind::kNumbered, reg);
  }

  static std::shared_ptr<Operand> CreateNamedOp(
      std::shared_ptr<GlobalVal> reg) {
    return std::make_shared<Operand>(OperandKind::kNamed, reg);
  }

  static std::shared_ptr<Operand> CreateIConstOp(int iconst) {
    return std::make_shared<Operand>(OperandKind::kIntConst, iconst);
  }

  InnerType inner() const {
    switch (kind_) {
      case OperandKind::kNumbered:
        return numbered_reg_;
      case OperandKind::kNamed:
        return named_reg_;
      case OperandKind::kIntConst:
        return iconst_;
    }
    throw std::runtime_error("Unknown OperandKind");
  }

 private:
  explicit Operand(OperandKind kind, std::shared_ptr<LocalVal> inner)
      : kind_(kind), numbered_reg_(inner) {}
  explicit Operand(OperandKind kind, std::shared_ptr<GlobalVal> inner)
      : kind_(kind), named_reg_(inner) {}
  explicit Operand(OperandKind kind, int inner) : kind_(kind), iconst_(inner) {}

  OperandKind kind_;
  std::shared_ptr<LocalVal> numbered_reg_;
  std::shared_ptr<GlobalVal> named_reg_;
  int iconst_;
};

enum class ReturnType { INT_TYPE, STRUCT_TYPE, VOID_TYPE };

struct FuncType {
  ReturnType type;
  std::string structname;
  FuncType(ReturnType _type = ReturnType::INT_TYPE,
           const std::string _name = std::string())
      : type(_type), structname(_name) {}
};

enum class DefKind { kStruct, kGlobal, kFunc };

struct StructDef {
  std::string name;
  std::vector<ValDef> members;
  StructDef(const std::string& _name, const std::vector<ValDef>& _members)
      : name(_name), members(_members) {}
};

struct FuncDecl {
  std::string name;
  std::vector<ValDef> args;
  FuncType ret;
  FuncDecl(const std::string& _name, const std::vector<ValDef>& _args,
           FuncType _ret)
      : name(_name), args(_args), ret(_ret) {}
};

struct GlobalDef {
  std::string name;
  ValDef def;
  std::vector<int> init;
  GlobalDef(const std::string& _name, ValDef _def,
            const std::vector<int>& _init)
      : name(_name), def(_def), init(_init) {}
};

#include <memory>
#include <string>
#include <type_traits>
#include <variant>
#include <vector>

enum class DefKind { kStruct, kFunc, kGlobal };

using DefVariant =
    std::variant<std::shared_ptr<FuncDecl>, std::shared_ptr<StructDef>,
                 std::shared_ptr<GlobalDef>>;

class TopLevelDef {
 public:
  DefKind kind() const { return kind_; }

  static std::shared_ptr<TopLevelDef> CreateStructDef(
      const std::string& name, const std::vector<ValDef>& members) {
    return CreateDef<StructDef>(DefKind::kStruct, name, members);
  }

  static std::shared_ptr<TopLevelDef> CreateFuncDecl(
      const std::string& name, const std::vector<ValDef>& args, FuncType ret) {
    return CreateDef<FuncDecl>(DefKind::kFunc, name, args, ret);
  }

  static std::shared_ptr<TopLevelDef> CreateGlobalDef(
      const std::string& name, ValDef def, const std::vector<int>& init) {
    return CreateDef<GlobalDef>(DefKind::kGlobal, name, def, init);
  }

  template <typename T>
  std::shared_ptr<T> inner() const {
    if (auto ptr = std::get_if<std::shared_ptr<T>>(&inner_)) {
      return *ptr;
    }
    return nullptr;
  }

 private:
  explicit TopLevelDef(DefKind kind) : kind_(kind) {}

  template <typename T, typename... Args>
  static std::shared_ptr<TopLevelDef> CreateDef(DefKind kind, Args&&... args) {
    auto p = std::make_shared<TopLevelDef>(kind);
    p->inner_ = std::make_shared<T>(std::forward<Args>(args)...);
    return p;
  }

  DefKind kind_;
  DefVariant inner_;
};

enum class BiOpKind {
  kPlus,
  KMinus,
  kMul,
  kDiv,
};

class BiOp {
  BiOpKind kind_;
  std::shared_ptr<Operand> left_;
  std::shared_ptr<Operand> right_;
  std::shared_ptr<Operand> dst_;

  BiOp(BiOpKind op, std::shared_ptr<Operand> left,
       std::shared_ptr<Operand> right, std::shared_ptr<Operand> dst)
      : kind_(op), left_(left), right_(right), dst_(dst) {}
};

enum class RelOpKind {
  kEq,
  kNe,
  kLt,
  kGt,
  kLe,
  kGe,
};

enum class StmtKind {
  kBiOP,
  kLoad,
  kStore,
  kLabel,
  kJump,
  kCmp,
  kCjump,
  kMove,
  kCall,
  kVoidCall,
  kRet,
  kPhi,
  kNull,
  kAlloca,
  kGep
};

class Load {
 public:
  Load(std::shared_ptr<Operand> dst, std::shared_ptr<Operand> ptr)
      : dst_(dst), ptr_(ptr) {}

 private:
  std::shared_ptr<Operand> dst_;
  std::shared_ptr<Operand> ptr_;
};

class Store {
 public:
  Store(std::shared_ptr<Operand> src, std::shared_ptr<Operand> ptr)
      : src_(src), ptr_(ptr) {}

 private:
  std::shared_ptr<Operand> src_;
  std::shared_ptr<Operand> ptr_;
};

class Label {
 public:
  std::shared_ptr<BlockLabel> label() { return label_; }
  Label(std::shared_ptr<BlockLabel> label) : label_(label) {}

 private:
  std::shared_ptr<BlockLabel> label_;
};

class Jump {
 public:
  std::shared_ptr<BlockLabel> jump() { return jump_; }
  Jump(std::shared_ptr<BlockLabel> jump) : jump_(jump) {}

 private:
  std::shared_ptr<BlockLabel> jump_;
};

class Cmp {
 public:
  Cmp(RelOpKind kind, std::shared_ptr<Operand> left,
      std::shared_ptr<Operand> right, std::shared_ptr<Operand> dst)
      : kind_(kind), left_(left), right_(right), dst_(dst) {}

 private:
  RelOpKind kind_;
  std::shared_ptr<Operand> left_;
  std::shared_ptr<Operand> right_;
  std::shared_ptr<Operand> dst_;
};

class CJump {
 public:
  std::shared_ptr<BlockLabel> true_label() { return true_label_; }
  std::shared_ptr<BlockLabel> false_label() { return false_label_; }
  CJump(std::shared_ptr<Operand> dst, std::shared_ptr<BlockLabel> true_label,
        std::shared_ptr<BlockLabel> false_label)
      : dst_(dst), true_label_(true_label), false_label_(false_label) {}

 private:
  std::shared_ptr<Operand> dst_;
  std::shared_ptr<BlockLabel> true_label_;
  std::shared_ptr<BlockLabel> false_label_;
};

class Move {
 public:
  Move(std::shared_ptr<Operand> src, std::shared_ptr<Operand> dst)
      : src_(src), dst_(dst) {}

 private:
  std::shared_ptr<Operand> src_;
  std::shared_ptr<Operand> dst_;
};

class Call {
 public:
  Call(const std::string& fun, std::shared_ptr<Operand> res,
       const std::vector<std::shared_ptr<Operand>>& args)
      : fun_(fun), res_(res), args_(args) {}

 private:
  std::string fun_;
  std::shared_ptr<Operand> res_;
  std::vector<std::shared_ptr<Operand>> args_;
};

class VoidCall {
 public:
  VoidCall(const std::string& fun,
           const std::vector<std::shared_ptr<Operand>>& args)
      : fun_(fun), args_(args) {}

 private:
  std::string fun_;
  std::vector<std::shared_ptr<Operand>> args_;
};

class Ret {
 public:
  Ret(std::shared_ptr<Operand> ret) : ret_(ret) {}

 private:
  std::shared_ptr<Operand> ret_;
};

class Phi {
 public:
  Phi(std::shared_ptr<Operand> dst,
      const std::vector<std::pair<std::shared_ptr<Operand>,
                                  std::shared_ptr<BlockLabel>>>& phis)
      : dst_(dst), phis_(phis) {}

 private:
  std::shared_ptr<Operand> dst_;
  std::vector<std::pair<std::shared_ptr<Operand>, std::shared_ptr<BlockLabel>>>
      phis_;
};

class Alloca {
 public:
  Alloca(std::shared_ptr<Operand> dst) : dst_(dst) {}

 private:
  std::shared_ptr<Operand> dst_;
};

class Gep {
 public:
  Gep(std::shared_ptr<Operand> new_ptr, std::shared_ptr<Operand> base_ptr,
      std::shared_ptr<Operand> index)
      : new_ptr_(new_ptr), base_ptr_(base_ptr), index_(index) {}

 private:
  std::shared_ptr<Operand> new_ptr_;
  std::shared_ptr<Operand> base_ptr_;
  std::shared_ptr<Operand> index_;
};

using StmtVariant = std::variant<
    std::shared_ptr<BiOp>, std::shared_ptr<Load>, std::shared_ptr<Store>,
    std::shared_ptr<Label>, std::shared_ptr<Jump>, std::shared_ptr<Cmp>,
    std::shared_ptr<CJump>, std::shared_ptr<Move>, std::shared_ptr<Call>,
    std::shared_ptr<VoidCall>, std::shared_ptr<Ret>, std::shared_ptr<Phi>,
    std::shared_ptr<Alloca>, std::shared_ptr<Gep>>;

class Stmt {
 public:
  StmtKind type() { return type_; }
  static std::shared_ptr<Stmt> CreateBiOp(BiOpKind kind,
                                          std::shared_ptr<Operand> left,
                                          std::shared_ptr<Operand> right,
                                          std::shared_ptr<Operand> dst) {
    return std::make_shared<Stmt>(
        StmtKind::kBiOP, std::make_shared<BiOp>(kind, left, right, dst));
  }

  static std::shared_ptr<Stmt> CreateLoad(std::shared_ptr<Operand> dst,
                                          std::shared_ptr<Operand> ptr) {
    return std::make_shared<Stmt>(StmtKind::kLoad,
                                  std::make_shared<Load>(dst, ptr));
  }

  static std::shared_ptr<Stmt> CreateStore(std::shared_ptr<Operand> src,
                                           std::shared_ptr<Operand> ptr) {
    return std::make_shared<Stmt>(StmtKind::kStore,
                                  std::make_shared<Store>(src, ptr));
  }

  static std::shared_ptr<Stmt> CreateLabel(std::shared_ptr<BlockLabel> label) {
    return std::make_shared<Stmt>(StmtKind::kLabel,
                                  std::make_shared<Label>(label));
  }

  static std::shared_ptr<Stmt> CreateJump(std::shared_ptr<BlockLabel> jump) {
    return std::make_shared<Stmt>(StmtKind::kJump,
                                  std::make_shared<Jump>(jump));
  }

  static std::shared_ptr<Stmt> CreateCmp(RelOpKind kind,
                                         std::shared_ptr<Operand> left,
                                         std::shared_ptr<Operand> right,
                                         std::shared_ptr<Operand> dst) {
    return std::make_shared<Stmt>(
        StmtKind::kCmp, std::make_shared<Cmp>(kind, left, right, dst));
  }

  static std::shared_ptr<Stmt> CreateCJump(
      std::shared_ptr<Operand> dst, std::shared_ptr<BlockLabel> true_label,
      std::shared_ptr<BlockLabel> false_label) {
    return std::make_shared<Stmt>(
        StmtKind::kCjump,
        std::make_shared<CJump>(dst, true_label, false_label));
  }

  static std::shared_ptr<Stmt> CreateMove(std::shared_ptr<Operand> src,
                                          std::shared_ptr<Operand> dst) {
    return std::make_shared<Stmt>(StmtKind::kMove,
                                  std::make_shared<Move>(src, dst));
  }

  static std::shared_ptr<Stmt> CreateCall(
      const std::string& fun, std::shared_ptr<Operand> res,
      const std::vector<std::shared_ptr<Operand>>& args) {
    return std::make_shared<Stmt>(StmtKind::kCall,
                                  std::make_shared<Call>(fun, res, args));
  }

  static std::shared_ptr<Stmt> CreateVoidCall(
      const std::string& fun,
      const std::vector<std::shared_ptr<Operand>>& args) {
    return std::make_shared<Stmt>(StmtKind::kVoidCall,
                                  std::make_shared<VoidCall>(fun, args));
  }

  static std::shared_ptr<Stmt> CreateRet(std::shared_ptr<Operand> ret) {
    return std::make_shared<Stmt>(StmtKind::kRet, std::make_shared<Ret>(ret));
  }

  static std::shared_ptr<Stmt> CreatePhi(
      std::shared_ptr<Operand> dst,
      const std::vector<std::pair<std::shared_ptr<Operand>,
                                  std::shared_ptr<BlockLabel>>>& phis) {
    return std::make_shared<Stmt>(StmtKind::kPhi,
                                  std::make_shared<Phi>(dst, phis));
  }

  static std::shared_ptr<Stmt> CreateAlloca(std::shared_ptr<Operand> dst) {
    return std::make_shared<Stmt>(StmtKind::kAlloca,
                                  std::make_shared<Alloca>(dst));
  }

  static std::shared_ptr<Stmt> CreateGep(std::shared_ptr<Operand> new_ptr,
                                         std::shared_ptr<Operand> base_ptr,
                                         std::shared_ptr<Operand> index) {
    return std::make_shared<Stmt>(
        StmtKind::kGep, std::make_shared<Gep>(new_ptr, base_ptr, index));
  }

  template <typename T>
  std::shared_ptr<T> inner() {
    if (auto ptr = std::get_if<std::shared_ptr<T>>(&stmt_)) {
      return ptr;
    }
    return nullptr;
  }

  StmtKind type() const { return type_; }

 private:
  StmtKind type_;
  StmtVariant stmt_;

  explicit Stmt(StmtKind type, StmtVariant stmt)
      : type_(type), stmt_(std::move(stmt)) {}
};

class Block {
 public:
  std::list<std::shared_ptr<Stmt>> instrs() { return instrs_; }
  Block(std::shared_ptr<BlockLabel> label,
        const std::unordered_set<std::shared_ptr<BlockLabel>>& succs,
        const std::list<std::shared_ptr<Stmt>>& instrs)
      : label_(label), succs_(succs), instrs_(instrs) {}

  Block(const std::list<std::shared_ptr<Stmt>> instrs) {
    auto label_ins = instrs.front();
    if (label_ins->type() != StmtKind::kLabel) {
      assert(0);
    }
    this->label_ = label_ins->inner<Label>()->label();
    auto jump_ins = instrs.back();
    if (jump_ins->type() == StmtKind::kCjump) {
      this->succs_.emplace(jump_ins->inner<CJump>()->true_label());
      this->succs_.emplace(jump_ins->inner<CJump>()->false_label());
    } else if (jump_ins->type() == StmtKind::kJump) {
      this->succs_.emplace(jump_ins->inner<Jump>()->jump());
    } else if (jump_ins->type() == StmtKind::kRet) {
    } else {
      assert(0);
    }
    this->instrs_ = instrs;
  }

 private:
  std::shared_ptr<BlockLabel> label_;
  std::unordered_set<std::shared_ptr<BlockLabel>> succs_;
  std::list<std::shared_ptr<Stmt>> instrs_;
};

class Func {
 public:
  std::list<std::shared_ptr<Block>> blocks() { return blocks_; }
  Func(const std::string& name, FuncType ret,
       const std::vector<std::shared_ptr<LocalVal>> args,
       const std::list<std::shared_ptr<Block>>& blocks)
      : name_(name), ret_(ret), args_(args), blocks_(blocks) {}

 private:
  std::string name_;
  FuncType ret_;
  std::vector<std::shared_ptr<LocalVal>> args_;
  std::list<std::shared_ptr<Block>> blocks_;
};

class Prog {
 public:
  Prog(const std::vector<std::shared_ptr<TopLevelDef>>& defs,
       const std::vector<std::shared_ptr<Func>>& funcs)
      : defs_(defs), funcs_(funcs) {}

 private:
  std::vector<std::shared_ptr<TopLevelDef>> defs_;
  std::vector<std::shared_ptr<Func>> funcs_;
};

}  // namespace ir
