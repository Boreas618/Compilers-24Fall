/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ADD = 258,
     SUB = 259,
     MUL = 260,
     DIV = 261,
     SEMICOLON = 262,
     LET = 263,
     COLON = 264,
     ASSIGNMENT = 265,
     FN = 266,
     LP = 267,
     RP = 268,
     RARROW = 269,
     LSQUAREBRACKET = 270,
     RSQUAREBRACKET = 271,
     DOT = 272,
     LBRACE = 273,
     RBRACE = 274,
     COMMA = 275,
     BREAK = 276,
     CONTINUE = 277,
     RET = 278,
     IF = 279,
     ELSE = 280,
     WHILE = 281,
     AND = 282,
     OR = 283,
     NOT = 284,
     EQ = 285,
     NE = 286,
     LT = 287,
     GT = 288,
     GE = 289,
     LE = 290,
     STRUCT = 291,
     INT = 292,
     ID = 293,
     NUM = 294,
     UMINUS = 295
   };
#endif
/* Tokens.  */
#define ADD 258
#define SUB 259
#define MUL 260
#define DIV 261
#define SEMICOLON 262
#define LET 263
#define COLON 264
#define ASSIGNMENT 265
#define FN 266
#define LP 267
#define RP 268
#define RARROW 269
#define LSQUAREBRACKET 270
#define RSQUAREBRACKET 271
#define DOT 272
#define LBRACE 273
#define RBRACE 274
#define COMMA 275
#define BREAK 276
#define CONTINUE 277
#define RET 278
#define IF 279
#define ELSE 280
#define WHILE 281
#define AND 282
#define OR 283
#define NOT 284
#define EQ 285
#define NE 286
#define LT 287
#define GT 288
#define GE 289
#define LE 290
#define STRUCT 291
#define INT 292
#define ID 293
#define NUM 294
#define UMINUS 295




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 19 "parser.yacc"
{
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
/* Line 1529 of yacc.c.  */
#line 165 "y.tab.hpp"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

