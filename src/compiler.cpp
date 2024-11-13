#include <fstream>
#include <iostream>

#include "IRGenerator.h"
#include "PrintTeaplaAst.h"
#include "TeaplAst.h"
#include "TeaplaAst.h"
#include "TypeCheck.h"
#include "llvm_ir.h"
#include "printLLVM.h"
#include "y.tab.hpp"

#define YACCDEBUG 0
#define TYPE_CHECK 0

using namespace std;
using namespace ir;

extern int yyparse();
extern YYSTYPE yylval;
extern int yydebug;

int line, col;

A_program root;
aA_program aroot;

int main(int argc, char* argv[]) {
#if YACCDEBUG
    yydebug = 1;
#endif

    line = 1;
    col = 1;

    string input_name = argv[1];
    auto dot_pos = input_name.find('.');
    if (dot_pos == input_name.npos) {
        cout << "input error";
        return -1;
    }
    string file_name(input_name.substr(0, dot_pos));

    freopen(argv[1], "r", stdin);
    ofstream ASTStream;
    // ASTStream.open(file_name+".ast");

    yyparse();

    aroot = aA_Program(root);
    // print_aA_Program(aroot, ASTStream);
    // ASTStream.close();

#if TYPE_CHECK
    TypeChecker checker(std::cout);
    checker.CheckProgram(aroot);
#endif

    std::ofstream llvm_stream;
    llvm_stream.open(file_name + ".ll");
    auto prog = ast2llvm(a_root);
    PrintLlProg(llvm_stream, prog);
    llvm_stream.close();

    return 0;
}
