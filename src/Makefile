CXX = clang++
CXXFLAGS = -std=c++17 -g

TESTCASE_DIR := tests/public
#TESTCASE_DIR := tests/private
TESTCASES = $(wildcard $(TESTCASE_DIR)/*.tea)
LLFILES = $(patsubst $(TESTCASE_DIR)/%.tea,$(TESTCASE_DIR)/%.ast,$(TESTCASES))

.SECONDARY: $(LLFILES)

run: $(patsubst $(TESTCASE_DIR)/%.tea,$(TESTCASE_DIR)/%.ll,$(TESTCASES))

$(TESTCASE_DIR)/%.ll: $(TESTCASE_DIR)/%.tea compiler
#	@echo TEST $*
	@./test-functional.sh $*
	@echo 

compiler: y.tab.o lex.yy.o teapl_ast.o teapl_aast.o ast_printer.o compiler.o ir_generator.o ir_printer.o type_checker.o ssa.o block_graph.o liveness.o
	$(CXX) $(CXXFLAGS) -o compiler $^ 

y.tab.cc: parser.yacc teapl_ast.h 
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

type_checker.o: type_checker.cc type_checker.h
	$(CXX) $(CXXFLAGS) -c $<

teapl_ast.o: teapl_ast.cc teapl_ast.h
	$(CXX) $(CXXFLAGS) -c $<

teapl_aast.o: teapl_aast.cc teapl_aast.h
	$(CXX) $(CXXFLAGS) -c $<

ast_printer.o: ast_printer.cc ast_printer.h
	$(CXX) $(CXXFLAGS) -c $<

compiler.o: compiler.cc teapl_ast.o teapl_aast.o ast_printer.o y.tab.o lex.yy.o ir_generator.o ir_printer.o block_graph.o ssa.o liveness.o
	$(CXX) $(CXXFLAGS) -c $<

# IRDef.o: ir_def.h
#	$(CXX) $(CXXFLAGS) -c $<

ir_generator.o: ir_generator.cc ir_generator.h ir_def.h
	$(CXX) $(CXXFLAGS) -c $<

ir_printer.o: ir_printer.cc ir_printer.h ir_def.h
	$(CXX) $(CXXFLAGS) -c $<

ssa.o: ssa.cc ssa.h graph.h
	@$(CXX) $(CXXFLAGS) -c $<

block_graph.o: block_graph.cc block_graph.h graph.h
	@$(CXX) $(CXXFLAGS) -c $<

liveness.o: liveness.cc liveness.h graph.h
	@$(CXX) $(CXXFLAGS) -c $<


clean:
	rm *.o *.output y.tab.cc y.tab.h lex.yy.cc compiler tests/*.ast tests/*.ll output/*.ll output/*.out
