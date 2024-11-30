#include <fstream>
#include <iostream>

#include "ast_printer.hh"
#include "ir_generator.hh"
#include "ir_printer.hh"
#include "ssa.hh"
#include "teapl_aast.hh"
#include "teapl_ast.hh"
#include "type_checker.hh"
#include "y.tab.hh"

#define YACC_DEBUG 0
#define TYPE_CHECK 0
#define LEGACY_AST 1

using namespace std;
using namespace ir;

extern int yyparse();
extern YYSTYPE yylval;
extern int yydebug;

int line, col;

A_program root;
aA_program aroot;

int main(int argc, char* argv[]) {
    if (argc < 2) {
        cerr << "Usage: " << argv[0] << " <input_file>" << endl;
        return EXIT_FAILURE;
    }
#if YACC_DEBUG
    yydebug = 1;
#endif

    line = 1;
    col = 1;

    string input_name = argv[1];
    size_t dot_pos = input_name.find('.');
    if (dot_pos == string::npos) {
        cerr << "Error: Input file must have an extension." << endl;
        return EXIT_FAILURE;
    }

    string file_name(input_name.substr(0, dot_pos));

    if (freopen(argv[1], "r", stdin) == nullptr) {
        cerr << "Error: Failed to open input file " << argv[1] << endl;
        return EXIT_FAILURE;
    }

    if (yyparse() != 0) {
        cerr << "Error: Parsing failed." << endl;
        return EXIT_FAILURE;
    }

#if LEGACY_AST
    aroot = aA_Program(root);
#elif
    aroot = ast::Program(root);
#endif

#if TYPE_CHECK
    TypeChecker checker(std::cout);
    checker.CheckProgram(aroot);
#endif

    ofstream llvm_stream(file_name + ".ll");
    if (!llvm_stream) {
        cerr << "Error: Failed to open output file " << file_name << ".ll"
             << endl;
        return EXIT_FAILURE;
    }

    IRGenerator ir_generator;
    auto prog = ir_generator.Generate(aroot);
    SSAWorker ssa;

    /**
     * An ugly fix here.
     */
    llvm_stream
        << "declare i32 @getch( )\ndeclare i32 @getint( )\ndeclare void "
           "@putch( i32 )\ndeclare void @putint( i32 )\ndeclare void "
           "@putarray( i32, i32* )\ndeclare void @_sysy_starttime( i32 "
           ")\ndeclare void @_sysy_stoptime( i32 )\n";

    prog = ssa.Launch(prog);
    printL_prog(llvm_stream, prog);
    llvm_stream.close();

    return 0;
}
