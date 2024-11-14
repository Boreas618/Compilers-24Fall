#include <fstream>
#include <iostream>

#include "ir_generator.hh"
#include "ast_printer.hh"
#include "teapl_ast.hh"
#include "teapl_aast.hh"
#include "type_checker.hh"
#include "ir_printer.hh"
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
    yyparse();

    aroot = aA_Program(root);

#if TYPE_CHECK
    TypeChecker checker(std::cout);
    checker.CheckProgram(aroot);
#endif

    std::ofstream llvm_stream;
    llvm_stream.open(file_name + ".ll");
    IRGenerator ir_generator;
    auto prog = ir_generator.Generate(aroot);
    printL_prog(llvm_stream, prog);
    llvm_stream.close();

    return 0;
}
