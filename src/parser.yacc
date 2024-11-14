%{
#include <stdio.h>
#include "teapl_ast.hh"

extern A_pos pos;
extern A_program root;

extern int yylex(void);
extern "C"{
extern void yyerror(const char *s); 
extern int  yywrap();
}

%}

// TODO:
// your parser

%union {
  A_pos pos;
  A_tokenId tokenId;
  A_tokenNum tokenNum;
  A_type type;
  A_program program;
  A_programElementList programElementList;
  A_programElement programElement;
  A_arithExpr arithExpr;
  A_exprUnit exprUnit;
  A_structDef structDef;
  A_varDeclStmt varDeclStmt;
  A_fnDeclStmt fnDeclStmt;
  A_fnDecl fnDecl;
  A_paramDecl paramDecl;
  A_fnDef fnDef;
  A_codeBlockStmt codeBlockStmt;
  A_assignStmt assignStmt;
  A_leftVal leftVal;
  A_rightVal rightVal;
  A_arrayExpr arrayExpr;
  A_varDecl varDecl;
  A_varDef varDef;
  A_rightValList rightValList;
  A_boolExpr boolExpr;
  A_varDeclList varDeclList;
  A_codeBlockStmtList codeBlockStmtList;
  A_returnStmt returnStmt;
  A_callStmt callStmt;
  A_fnCall fnCall;
  A_ifStmt ifStmt;
  A_whileStmt whileStmt;
  A_boolUnit boolUnit;
  A_arithBiOpExpr arithBiOpExpr;
}

%token <pos> ADD
%token <pos> SUB
%token <pos> MUL
%token <pos> DIV
%token <pos> SEMICOLON // ;
%token <pos> LET
%token <pos> COLON
%token <pos> ASSIGNMENT
%token <pos> FN
%token <pos> LP
%token <pos> RP
%token <pos> RARROW
%token <pos> LSQUAREBRACKET
%token <pos> RSQUAREBRACKET
%token <pos> DOT
%token <pos> LBRACE
%token <pos> RBRACE
%token <pos> COMMA
%token <pos> BREAK
%token <pos> CONTINUE
%token <pos> RET
%token <pos> IF
%token <pos> ELSE
%token <pos> WHILE
%token <pos> AND
%token <pos> OR
%token <pos> NOT
%token <pos> EQ
%token <pos> NE
%token <pos> LT
%token <pos> GT
%token <pos> GE 
%token <pos> LE
%token <pos> STRUCT
%token <pos> INT

%token <tokenId> ID

%token <tokenNum> NUM

%type <type> TYPE


%type <program> Program
%type <arithExpr> ArithExpr
%type <programElementList> ProgramElementList
%type <programElement> ProgramElement
%type <exprUnit> ExprUnit
%type <structDef> StructDef
%type <varDeclStmt> VarDeclStmt
%type <fnDeclStmt> FnDeclStmt
%type <fnDef> FnDef
%type <fnDecl> FnDecl
%type <paramDecl> ParamDecl
%type <assignStmt> AssignStmt
%type <leftVal> LeftVal
%type <rightVal> RightVal
%type <arrayExpr> ArrayExpr
%type <varDecl> VarDecl
%type <varDef> VarDef
%type <rightValList> RightValList
%type <boolExpr> BoolExpr
%type <varDeclList> VarDeclList
%type <codeBlockStmt> CodeBlockStmt
%type <codeBlockStmtList> CodeBlockStmtList
%type <returnStmt> ReturnStmt
%type <callStmt> CallStmt
%type <fnCall> FnCall
%type <ifStmt> IfStmt
%type <whileStmt> WhileStmt
%type <boolUnit> BoolUnit
%type <boolUnit> BoolUnit_
%type <arithBiOpExpr> ArithBiOpExpr

%right ASSIGNMENT
%left OR
%left AND
%left EQ NE
%left LT GT GE LE
%left ADD SUB
%left MUL DIV
%right NOT UMINUS
%left DOT

%start Program

%%                   /* beginning of rules section */

Program: ProgramElementList 
{  
  root = A_Program($1);
  $$ = A_Program($1);
}
;

ProgramElementList: ProgramElement ProgramElementList
{
  $$ = A_ProgramElementList($1, $2);
}
|
{
  $$ = nullptr;
}
;

ProgramElement: VarDeclStmt
{
  $$ = A_ProgramVarDeclStmt($1->pos, $1);
}
| StructDef
{
  $$ = A_ProgramStructDef($1->pos, $1);
}
| FnDeclStmt
{
  $$ = A_ProgramFnDeclStmt($1->pos, $1);
}
| FnDef
{
  $$ = A_ProgramFnDef($1->pos, $1);
}
| SEMICOLON
{
  $$ = A_ProgramNullStmt($1);
}
;

StructDef: STRUCT ID LBRACE VarDeclList RBRACE
{
  $$ = A_StructDef($1, $2->id, $4);
}
;

ExprUnit: NUM
{
  $$ = A_NumExprUnit($1->pos, $1->num);
}
| ID
{
  $$ = A_IdExprUnit($1->pos, $1->id);
}
| LP ArithExpr RP
{
  $$ = A_ArithExprUnit($1, $2);
}
| FnCall 
{
  $$ = A_CallExprUnit($1->pos, $1);
} 
| ArrayExpr
{
  $$ = A_ArrayExprUnit($1->pos, $1);
}
| LeftVal DOT ID
{
  $$ = A_MemberExprUnit($1->pos, A_MemberExpr($1->pos, $1, $3->id));
} 
| SUB NUM %prec UMINUS
{
  $$ = A_NumExprUnit($1, -($2->num));
}
;

ArithExpr: ArithBiOpExpr
{
  $$ = A_ArithBiOp_Expr($1->pos, $1);
}
| ExprUnit
{
  $$ = A_ExprUnit($1->pos, $1);
}
;

ArithBiOpExpr: ArithExpr ADD ArithExpr
{
  $$ = A_ArithBiOpExpr($1->pos, A_add, $1, $3);
}
| ArithExpr SUB ArithExpr
{
  $$ = A_ArithBiOpExpr($1->pos, A_sub, $1, $3);
}
| ArithExpr MUL ArithExpr
{
  $$ = A_ArithBiOpExpr($1->pos, A_mul, $1, $3);
}
| ArithExpr DIV ArithExpr
{
  $$ = A_ArithBiOpExpr($1->pos, A_div, $1, $3);
}
;

RightValList: RightVal COMMA RightValList
{
  $$ = A_RightValList($1, $3);
}
| RightVal
{
  $$ = A_RightValList($1, nullptr);
}
| 
{
  $$ = nullptr;
}
;

ArrayExpr: LeftVal LSQUAREBRACKET NUM RSQUAREBRACKET
{
  $$ = A_ArrayExpr($1->pos, $1, A_NumIndexExpr($3->pos, $3->num));
}
| LeftVal LSQUAREBRACKET ID RSQUAREBRACKET
{
  $$ = A_ArrayExpr($1->pos, $1, A_IdIndexExpr($3->pos, $3->id));
}
;

BoolExpr: BoolExpr AND BoolExpr
{
  $$ = A_BoolBiOp_Expr($1->pos, A_BoolBiOpExpr($1->pos, A_and, $1, $3));
}
| BoolExpr OR BoolExpr
{
  $$ = A_BoolBiOp_Expr($1->pos, A_BoolBiOpExpr($1->pos, A_or, $1, $3));
}
| BoolUnit
{
  $$ = A_BoolExpr($1->pos, $1);
}
;

AssignStmt: LeftVal ASSIGNMENT RightVal SEMICOLON 
{
  $$ = A_AssignStmt($1->pos, $1, $3);
}
;

LeftVal: ID
{
  $$ = A_IdExprLVal($1->pos, $1->id);
}
| ArrayExpr
{
  $$ = A_ArrExprLVal($1->pos, $1);
}
| LeftVal DOT ID // Avoid using MemberExpr to avoid circular production.
{
  $$ = A_MemberExprLVal($1->pos, A_MemberExpr($1->pos, $1, $3->id));
}
;

RightVal: ArithExpr
{
  $$ = A_ArithExprRVal($1->pos, $1);
}
| BoolExpr
{
  $$ = A_BoolExprRVal($1->pos, $1);
}
;

VarDeclStmt: LET VarDef SEMICOLON
{
  $$ = A_VarDefStmt($1, $2);
}
| LET VarDecl SEMICOLON
{
  $$ = A_VarDeclStmt($1, $2);
}
;

VarDecl: ID COLON TYPE
{
  $$ = A_VarDecl_Scalar($1->pos, A_VarDeclScalar($1->pos, $1->id, $3));
}
| ID LSQUAREBRACKET NUM RSQUAREBRACKET COLON TYPE
{
  $$ = A_VarDecl_Array($1->pos, A_VarDeclArray($1->pos, $1->id, $3->num, $6));
}
| ID
{
  $$ = A_VarDecl_Scalar($1->pos, A_VarDeclScalar($1->pos, $1->id, NULL));
}
| ID LSQUAREBRACKET NUM RSQUAREBRACKET
{
  $$ = A_VarDecl_Array($1->pos, A_VarDeclArray($1->pos, $1->id, $3->num, NULL));
}
;

VarDef: ID COLON TYPE ASSIGNMENT RightVal
{
  $$ = A_VarDef_Scalar($1->pos, A_VarDefScalar($1->pos, $1->id, $3, $5));
}
| ID ASSIGNMENT RightVal
{
  $$ = A_VarDef_Scalar($1->pos, A_VarDefScalar($1->pos, $1->id, NULL, $3));
}
| ID LSQUAREBRACKET NUM RSQUAREBRACKET COLON TYPE ASSIGNMENT LBRACE RightValList RBRACE
{
  $$ = A_VarDef_Array($1->pos, A_VarDefArray($1->pos, $1->id, $3->num, $6, $9));
}
| ID LSQUAREBRACKET NUM RSQUAREBRACKET ASSIGNMENT LBRACE RightValList RBRACE
{
  $$ = A_VarDef_Array($1->pos, A_VarDefArray($1->pos, $1->id, $3->num, NULL, $7));
}
;

VarDeclList: VarDecl COMMA VarDeclList
{
  $$ = A_VarDeclList($1, $3);
}
| VarDecl
{
  $$ = A_VarDeclList($1, nullptr);
}
|
{
  $$ = nullptr;
}
;

FnDeclStmt: FnDecl SEMICOLON 
{
  $$ = A_FnDeclStmt($1->pos, $1);
}
;

FnDecl: FN ID LP ParamDecl RP
{
  $$ = A_FnDecl($1, $2->id, $4, NULL);
}
| FN ID LP ParamDecl RP RARROW TYPE
{
  $$ = A_FnDecl($1, $2->id, $4, $7);
}
;

ParamDecl: VarDeclList
{
  $$ = A_ParamDecl($1);
}
;

FnDef: FnDecl LBRACE CodeBlockStmtList RBRACE
{
  $$ = A_FnDef($1->pos, $1, $3);
}
;

CodeBlockStmtList:  CodeBlockStmt 
{
  $$ = A_CodeBlockStmtList($1, nullptr);
}
| CodeBlockStmt CodeBlockStmtList
{
  $$ = A_CodeBlockStmtList($1, $2);
}
;

CodeBlockStmt: VarDeclStmt
{
  $$ = A_BlockVarDeclStmt($1->pos, $1);
}
| AssignStmt
{
  $$ = A_BlockAssignStmt($1->pos, $1);
}
| CallStmt
{
  $$ = A_BlockCallStmt($1->pos, $1);
}
| IfStmt
{
  $$ = A_BlockIfStmt($1->pos, $1);
}
| WhileStmt
{
  $$ = A_BlockWhileStmt($1->pos, $1);
}
| ReturnStmt
{
  $$ = A_BlockReturnStmt($1->pos, $1);
}
| CONTINUE SEMICOLON
{
  $$ = A_BlockContinueStmt($1);
}
| BREAK SEMICOLON
{
  $$ = A_BlockBreakStmt($1);
}
| SEMICOLON
{
  $$ = A_BlockNullStmt($1);
}
;

ReturnStmt: RET RightVal SEMICOLON
{
  $$ = A_ReturnStmt($1, $2);
}
| RET SEMICOLON
{
  $$ = A_ReturnStmt($1, nullptr);
}
;

CallStmt: FnCall SEMICOLON
{
  $$ = A_CallStmt($1->pos, $1);
}
;

BoolUnit_: LP ExprUnit LT ExprUnit RP
{
  $$ = A_ComExprUnit($1, A_ComExpr($2->pos, A_lt, $2, $4));
}
| LP ExprUnit LE ExprUnit RP
{
  $$ = A_ComExprUnit($1, A_ComExpr($2->pos, A_le, $2, $4));
}
| LP ExprUnit GT ExprUnit RP
{
  $$ = A_ComExprUnit($1, A_ComExpr($2->pos, A_gt, $2, $4));
}
| LP ExprUnit GE ExprUnit RP
{
  $$ = A_ComExprUnit($1, A_ComExpr($2->pos, A_ge, $2, $4));
}
| LP ExprUnit EQ ExprUnit RP
{
  $$ = A_ComExprUnit($1, A_ComExpr($2->pos, A_eq, $2, $4));
}
| LP ExprUnit NE ExprUnit RP
{
  $$ = A_ComExprUnit($1,  A_ComExpr($2->pos, A_ne, $2, $4));
}
| LP BoolExpr RP
{
  $$ = A_BoolExprUnit($1, $2);
}
;

IfStmt: IF BoolUnit_ LBRACE CodeBlockStmtList RBRACE
{
  $$ = A_IfStmt($1, $2, $4, nullptr);
}
| IF BoolUnit_ LBRACE CodeBlockStmtList RBRACE ELSE LBRACE CodeBlockStmtList RBRACE
{
  $$ = A_IfStmt($1, $2, $4, $8);
}
;

WhileStmt: WHILE BoolUnit_ LBRACE CodeBlockStmtList RBRACE
{
  $$ = A_WhileStmt($1, $2, $4);
}
;

FnCall: ID LP RightValList RP
{
  $$ = A_FnCall($1->pos, $1->id, $3);
}
;

BoolUnit: LP ExprUnit LT ExprUnit RP
{
  $$ = A_ComExprUnit($1, A_ComExpr($2->pos, A_lt, $2, $4));
}
| LP ExprUnit LE ExprUnit RP
{
  $$ = A_ComExprUnit($1, A_ComExpr($2->pos, A_le, $2, $4));
}
| LP ExprUnit GT ExprUnit RP
{
  $$ = A_ComExprUnit($1, A_ComExpr($2->pos, A_gt, $2, $4));
}
| LP ExprUnit GE ExprUnit RP
{
  $$ = A_ComExprUnit($1, A_ComExpr($2->pos, A_ge, $2, $4));
}
| LP ExprUnit EQ ExprUnit RP
{
  $$ = A_ComExprUnit($1, A_ComExpr($2->pos, A_eq, $2, $4));
}
| LP ExprUnit NE ExprUnit RP
{
  $$ = A_ComExprUnit($1, A_ComExpr($2->pos, A_ne, $2, $4));
}
| LP BoolExpr RP
{
  $$ = A_BoolExprUnit($1, $2);
}
| NOT BoolUnit
{
  $$ = A_BoolUOpExprUnit($1, A_BoolUOpExpr($1, A_not, $2));
}
;

TYPE: INT
{
  $$ = A_NativeType($1, A_intTypeKind);
}
| ID
{
  $$ = A_StructType($1->pos, $1->id);
}
;


%%

extern "C"{
void yyerror(const char * s)
{
  fprintf(stderr, "%s\n",s);
}
int yywrap()
{
  return(1);
}
}


