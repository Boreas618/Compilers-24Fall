#pragma once

#include <cassert>
#include <iostream>
#include <list>
#include <memory>
#include <string>
#include <unordered_set>
#include <vector>

#include "common.hh"

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

class IRValue {
   public:
    IRValue(RegType type) : type_(type), len_(0), struct_name_("") {}
    IRValue(RegType type, int len, const std::string& name)
        : type_(type), len_(len), struct_name_(name) {}
    virtual ~IRValue() = default;

    int len() const { return len_; }
    void set_len(int i) { len_ = i; }
    RegType type() const { return type_; }
    const std::string& struct_name() const { return struct_name_; }

    static std::shared_ptr<IRValue> CreateUndecided() { return nullptr; }
    static std::shared_ptr<IRValue> CreateInt() { return nullptr; }
    static std::shared_ptr<IRValue> CreateIntPtr(int len) { return nullptr; }
    static std::shared_ptr<IRValue> CreateStruct(const std::string& name) {
        return nullptr;
    }
    static std::shared_ptr<IRValue> CreateStructPtr(int len,
                                                    const std::string& name) {
        return nullptr;
    }

   protected:
    RegType type_;
    int len_;
    std::string struct_name_;
};

class LocalVal : public IRValue {
   public:
    static std::shared_ptr<LocalVal> CreateUndecided() {
        std::shared_ptr<LocalVal> ret = nullptr;
        return std::move(ret);
    }

    static std::shared_ptr<LocalVal> CreateInt() {
        return std::make_shared<LocalVal>(GetNextIndex(), RegType::kInt);
    }

    static std::shared_ptr<LocalVal> CreateIntPtr(int len) {
        return std::make_shared<LocalVal>(GetNextIndex(), RegType::kIntPtr,
                                          len);
    }

    static std::shared_ptr<LocalVal> CreateStruct(const std::string& name) {
        return std::make_shared<LocalVal>(GetNextIndex(), RegType::kStruct, 0,
                                          name);
    }

    static std::shared_ptr<LocalVal> CreateStructPtr(int len,
                                                     const std::string& name) {
        return std::make_shared<LocalVal>(GetNextIndex(), RegType::kStructPtr,
                                          len, name);
    }

    LocalVal(int num = 0, RegType type = RegType::kInt, int len = 0,
             const std::string& struct_name = std::string())
        : IRValue(type, len, struct_name), num_(num), var_name_("") {}

    int num() const { return num_; }
    const std::string& var_name() const { return var_name_; }

   private:
    int num_;
    std::string var_name_;
};

using LocalValSet = std::unordered_set<Box<LocalVal>>;

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
    std::string name() { return name_; }
    static std::shared_ptr<BlockLabel> CreateEmpty() {
        return std::make_shared<BlockLabel>(
            "bb" + std::to_string(GetNextLabelIndex()));
    }

    static std::shared_ptr<BlockLabel> CreateFrom(const std::string& name) {
        return std::make_shared<BlockLabel>(name);
    }
    BlockLabel(std::string name) : name_(name) {}

   private:
    std::string name_;
};

class GlobalVal : public IRValue {
   public:
    static std::shared_ptr<GlobalVal> CreateInt(
        std::shared_ptr<BlockLabel> name) {
        return std::make_shared<GlobalVal>(name, RegType::kInt);
    }

    static std::shared_ptr<GlobalVal> CreateIntPtr(
        std::shared_ptr<BlockLabel> name, int len) {
        return std::make_shared<GlobalVal>(name, RegType::kIntPtr, len);
    }

    static std::shared_ptr<GlobalVal> CreateStruct(
        std::shared_ptr<BlockLabel> name, const std::string& struct_name) {
        return std::make_shared<GlobalVal>(name, RegType::kStruct, 0,
                                           struct_name);
    }

    static std::shared_ptr<GlobalVal> CreateStructPtr(
        std::shared_ptr<BlockLabel> name, int len,
        const std::string& struct_name) {
        return std::make_shared<GlobalVal>(name, RegType::kStructPtr, len,
                                           struct_name);
    }

    GlobalVal(std::shared_ptr<BlockLabel> name, RegType type, int len = 0,
              const std::string& struct_name = std::string(""))
        : IRValue(type, len, struct_name), name_(name) {}

    std::shared_ptr<BlockLabel> name() const { return name_; }
    const std::string& struct_name() const { return struct_name_; }

   private:
    std::shared_ptr<BlockLabel> name_;
};

enum class OperandKind { kLocal, kGlobal, kIntConst };

class Integer : public IRValue {
   public:
    Integer(int i) : IRValue(RegType::kInt), inner_(i) {}
    int inner() { return inner_; }

   private:
    int inner_;
};

struct Operand {
    using InnerType =
        std::variant<std::shared_ptr<LocalVal>, std::shared_ptr<GlobalVal>,
                     std::shared_ptr<Integer>>;

   public:
    static std::shared_ptr<Operand> FromLocal(std::shared_ptr<LocalVal> reg) {
        return std::make_shared<Operand>(OperandKind::kLocal, reg);
    }

    static std::shared_ptr<Operand> FromGlobal(std::shared_ptr<GlobalVal> reg) {
        return std::make_shared<Operand>(OperandKind::kGlobal, reg);
    }

    static std::shared_ptr<Operand> FromIConst(int iconst) {
        return std::make_shared<Operand>(OperandKind::kIntConst, iconst);
    }

    OperandKind kind() const { return kind_; }

    std::shared_ptr<IRValue> inner() const {
        switch (kind_) {
            case OperandKind::kLocal:
                return std::get<std::shared_ptr<LocalVal>>(inner_);
            case OperandKind::kGlobal:
                return std::get<std::shared_ptr<GlobalVal>>(inner_);
            case OperandKind::kIntConst:
                return std::get<std::shared_ptr<Integer>>(inner_);
            default:
                return nullptr;
        }
    }

    template <typename T>
    std::shared_ptr<T> inner_generic() {
        if (std::shared_ptr<T>* ptr =
                std::get_if<std::shared_ptr<T>>(&inner_)) {
            return *ptr;
        }
        return nullptr;
    }

    explicit Operand(OperandKind kind, std::shared_ptr<LocalVal> inner)
        : kind_(kind), inner_(inner) {}
    explicit Operand(OperandKind kind, std::shared_ptr<GlobalVal> inner)
        : kind_(kind), inner_(inner) {}
    explicit Operand(OperandKind kind, int inner)
        : kind_(kind), inner_(std::make_shared<Integer>(inner)) {}

   private:
    OperandKind kind_;
    InnerType inner_;
};

enum class ReturnType { kInt, kStruct, kVoid };

struct FuncType {
    ReturnType type;
    std::string structname;
    FuncType(ReturnType _type = ReturnType::kInt,
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
        const std::string& name, const std::vector<ValDef>& args,
        FuncType ret) {
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

    explicit TopLevelDef(DefKind kind) : kind_(kind) {}

   private:
    template <typename T, typename... Args>
    static std::shared_ptr<TopLevelDef> CreateDef(DefKind kind,
                                                  Args&&... args) {
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
   public:
    BiOpKind kind() { return kind_; }
    std::shared_ptr<Operand> left() { return left_; }
    std::shared_ptr<Operand> right() { return right_; }
    std::shared_ptr<Operand> dst() { return dst_; }
    BiOp(BiOpKind op, std::shared_ptr<Operand> left,
         std::shared_ptr<Operand> right, std::shared_ptr<Operand> dst)
        : kind_(op), left_(left), right_(right), dst_(dst) {}

   private:
    BiOpKind kind_;
    std::shared_ptr<Operand> left_;
    std::shared_ptr<Operand> right_;
    std::shared_ptr<Operand> dst_;
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
    std::shared_ptr<Operand> dst() { return dst_; }
    std::shared_ptr<Operand> ptr() { return ptr_; }
    Load(std::shared_ptr<Operand> dst, std::shared_ptr<Operand> ptr)
        : dst_(dst), ptr_(ptr) {}

   private:
    std::shared_ptr<Operand> dst_;
    std::shared_ptr<Operand> ptr_;
};

class Store {
   public:
    std::shared_ptr<Operand> src() { return src_; }
    std::shared_ptr<Operand> ptr() { return ptr_; }
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
    RelOpKind kind() { return kind_; }
    std::shared_ptr<Operand> left() { return left_; }
    std::shared_ptr<Operand> right() { return right_; }
    std::shared_ptr<Operand> dst() { return dst_; }
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
    std::shared_ptr<Operand> dst() { return dst_; }
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
    std::shared_ptr<Operand> src() { return src_; }
    std::shared_ptr<Operand> dst() { return dst_; }
    Move(std::shared_ptr<Operand> src, std::shared_ptr<Operand> dst)
        : src_(src), dst_(dst) {}

   private:
    std::shared_ptr<Operand> src_;
    std::shared_ptr<Operand> dst_;
};

class Call {
   public:
    std::string fun() { return fun_; }
    std::shared_ptr<Operand> res() { return res_; }
    std::vector<std::shared_ptr<Operand>> args() { return args_; }
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
    std::string fun() { return fun_; }
    std::vector<std::shared_ptr<Operand>> args() { return args_; }
    VoidCall(const std::string& fun,
             const std::vector<std::shared_ptr<Operand>>& args)
        : fun_(fun), args_(args) {}

   private:
    std::string fun_;
    std::vector<std::shared_ptr<Operand>> args_;
};

class Ret {
   public:
    std::shared_ptr<Operand> ret() { return ret_; }
    Ret(std::shared_ptr<Operand> ret) : ret_(ret) {}

   private:
    std::shared_ptr<Operand> ret_;
};

class Phi {
   public:
    std::shared_ptr<Operand> dst() { return dst_; }
    std::vector<
        std::pair<std::shared_ptr<Operand>, std::shared_ptr<BlockLabel>>>&
    phis() {
        return phis_;
    }

    Phi(std::shared_ptr<Operand> dst,
        const std::vector<std::pair<std::shared_ptr<Operand>,
                                    std::shared_ptr<BlockLabel>>>& phis)
        : dst_(dst), phis_(phis) {}

   private:
    std::shared_ptr<Operand> dst_;
    std::vector<
        std::pair<std::shared_ptr<Operand>, std::shared_ptr<BlockLabel>>>
        phis_;
};

class Alloca {
   public:
    std::shared_ptr<Operand> dst() { return dst_; }
    Alloca(std::shared_ptr<Operand> dst) : dst_(dst) {}

   private:
    std::shared_ptr<Operand> dst_;
};

class Gep {
   public:
    std::shared_ptr<Operand> new_ptr() { return new_ptr_; }
    std::shared_ptr<Operand> base_ptr() { return base_ptr_; }
    std::shared_ptr<Operand> index() { return index_; }
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

    static std::shared_ptr<Stmt> CreateLabel(
        std::shared_ptr<BlockLabel> label) {
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
        return std::make_shared<Stmt>(StmtKind::kRet,
                                      std::make_shared<Ret>(ret));
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
        if (std::shared_ptr<T>* ptr = std::get_if<std::shared_ptr<T>>(&stmt_)) {
            return *ptr;
        }
        return nullptr;
    }

    StmtKind type() const { return type_; }

    explicit Stmt(StmtKind type, StmtVariant stmt)
        : type_(type), stmt_(std::move(stmt)) {}

   private:
    StmtKind type_;
    StmtVariant stmt_;
};

class Block {
   public:
    std::shared_ptr<BlockLabel> label() { return label_; }
    std::unordered_set<std::shared_ptr<BlockLabel>> succs() { return succs_; }
    std::shared_ptr<std::list<std::shared_ptr<Stmt>>>& instrs() {
        return instrs_;
    }

    Block(std::shared_ptr<BlockLabel> label,
          const std::unordered_set<std::shared_ptr<BlockLabel>>& succs,
          const std::shared_ptr<std::list<std::shared_ptr<Stmt>>>& instrs)
        : label_(label), succs_(succs), instrs_(instrs) {}

    Block(const std::shared_ptr<std::list<std::shared_ptr<Stmt>>> instrs) {
        auto label_ins = instrs->front();
        if (label_ins->type() != StmtKind::kLabel) {
            assert(0);
        }
        this->label_ = label_ins->inner<Label>()->label();
        auto jump_ins = instrs->back();
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

    // TODO: instrs_ do not have to be wrapped in a shared_ptr.
    std::shared_ptr<std::list<std::shared_ptr<Stmt>>> instrs_;
};

class Func {
   public:
    std::string name() { return name_; }
    FuncType ret() { return ret_; }
    std::vector<std::shared_ptr<LocalVal>>& args() { return args_; }
    std::list<std::shared_ptr<Block>>& blocks() { return blocks_; }
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
    std::vector<std::shared_ptr<TopLevelDef>> defs() { return defs_; }
    std::vector<std::shared_ptr<Func>> funcs() { return funcs_; }
    Prog(const std::vector<std::shared_ptr<TopLevelDef>>& defs,
         const std::vector<std::shared_ptr<Func>>& funcs)
        : defs_(defs), funcs_(funcs) {}

   private:
    std::vector<std::shared_ptr<TopLevelDef>> defs_;
    std::vector<std::shared_ptr<Func>> funcs_;
};

}  // namespace ir
