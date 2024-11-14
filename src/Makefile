CXX = clang++
CXXFLAGS = -std=c++17 -g

TESTCASE_DIR := tests
TESTCASES = $(wildcard $(TESTCASE_DIR)/*.tea)
LLFILES = $(patsubst $(TESTCASE_DIR)/%.tea,$(TESTCASE_DIR)/%.ast,$(TESTCASES))

.SECONDARY: $(LLFILES)

run: $(patsubst $(TESTCASE_DIR)/%.tea,$(TESTCASE_DIR)/%.ll,$(TESTCASES))

$(TESTCASE_DIR)/%.ll: $(TESTCASE_DIR)/%.tea compiler
#	@echo TEST $*
	@./test-functional.sh $*
	@echo 

compiler: y.tab.o lex.yy.o teapl_ast.o teapl_aast.o ast_printer.o compiler.o ir_generator.o ir_printer.o type_checker.o
	$(CXX) $(CXXFLAGS) -o compiler $^ 

y.tab.cc: parser.yacc teapl_ast.hh 
#	yacc --verbose --debug -d $< -o y.tab.cc
	yacc -o y.tab.cc -d $< -v --debug

y.tab.hpp: parser.yacc
#	yacc --verbose --debug -d $< -o y.tab.cc
	yacc -o y.tab.cc -d $< -v --debug

lex.yy.cc: lexer.lex y.tab.hpp y.tab.cc
	lex -o lex.yy.cc $< 

y.tab.o: y.tab.cc y.tab.hpp
	$(CXX) $(CXXFLAGS) -c $<

lex.yy.o: lex.yy.cc y.tab.hpp
	$(CXX) $(CXXFLAGS) -c $<

type_checker.o: type_checker.cc type_checker.hh
	$(CXX) $(CXXFLAGS) -c $<

teapl_ast.o: teapl_ast.cc teapl_ast.hh
	$(CXX) $(CXXFLAGS) -c $<

teapl_aast.o: teapl_aast.cc teapl_aast.hh
	$(CXX) $(CXXFLAGS) -c $<

ast_printer.o: ast_printer.cc ast_printer.hh
	$(CXX) $(CXXFLAGS) -c $<

compiler.o: compiler.cc teapl_ast.o teapl_aast.o ast_printer.o y.tab.o lex.yy.o ir_generator.o ir_printer.o
	$(CXX) $(CXXFLAGS) -c $<

# IRDef.o: ir_def.hh
#	$(CXX) $(CXXFLAGS) -c $<

ir_generator.o: ir_generator.cc ir_generator.hh ir_def.hh
	$(CXX) $(CXXFLAGS) -c $<

ir_printer.o: ir_printer.cc ir_printer.hh ir_def.hh
	$(CXX) $(CXXFLAGS) -c $<


clean:
	rm *.o *.output y.tab.cc y.tab.hpp lex.yy.cc compiler tests/*.ast tests/*.ll output/*.ll output/*.out
