/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



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




/* Copy the first part of user declarations.  */
#line 1 "parser.yacc"

#include <stdio.h>
#include "TeaplAst.h"

extern A_pos pos;
extern A_program root;

extern int yylex(void);
extern "C"{
extern void yyerror(const char *s); 
extern int  yywrap();
}



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

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
/* Line 193 of yacc.c.  */
#line 227 "y.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 240 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  18
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   218

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  41
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  32
/* YYNRULES -- Number of rules.  */
#define YYNRULES  91
/* YYNRULES -- Number of states.  */
#define YYNSTATES  199

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   295

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     8,     9,    11,    13,    15,    17,
      19,    25,    27,    29,    33,    35,    37,    41,    44,    46,
      48,    52,    56,    60,    64,    68,    70,    71,    76,    81,
      85,    89,    91,    96,    98,   100,   104,   106,   108,   112,
     116,   120,   127,   129,   134,   140,   144,   155,   164,   168,
     170,   171,   174,   180,   188,   190,   195,   197,   200,   202,
     204,   206,   208,   210,   212,   215,   218,   220,   224,   227,
     230,   236,   242,   248,   254,   260,   266,   270,   275,   281,
     291,   297,   302,   308,   314,   320,   326,   332,   338,   342,
     345,   347
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      42,     0,    -1,    43,    -1,    44,    43,    -1,    -1,    55,
      -1,    45,    -1,    59,    -1,    62,    -1,     7,    -1,    36,
      38,    18,    58,    19,    -1,    39,    -1,    38,    -1,    12,
      47,    13,    -1,    70,    -1,    50,    -1,    53,    17,    38,
      -1,     4,    39,    -1,    48,    -1,    46,    -1,    47,     3,
      47,    -1,    47,     4,    47,    -1,    47,     5,    47,    -1,
      47,     6,    47,    -1,    54,    20,    49,    -1,    54,    -1,
      -1,    53,    15,    39,    16,    -1,    53,    15,    38,    16,
      -1,    51,    27,    51,    -1,    51,    28,    51,    -1,    71,
      -1,    53,    10,    54,     7,    -1,    38,    -1,    50,    -1,
      53,    17,    38,    -1,    47,    -1,    51,    -1,     8,    57,
       7,    -1,     8,    56,     7,    -1,    38,     9,    72,    -1,
      38,    15,    39,    16,     9,    72,    -1,    38,    -1,    38,
      15,    39,    16,    -1,    38,     9,    72,    10,    54,    -1,
      38,    10,    54,    -1,    38,    15,    39,    16,     9,    72,
      10,    18,    49,    19,    -1,    38,    15,    39,    16,    10,
      18,    49,    19,    -1,    56,    20,    58,    -1,    56,    -1,
      -1,    60,     7,    -1,    11,    38,    12,    61,    13,    -1,
      11,    38,    12,    61,    13,    14,    72,    -1,    58,    -1,
      60,    18,    63,    19,    -1,    64,    -1,    64,    63,    -1,
      55,    -1,    52,    -1,    66,    -1,    68,    -1,    69,    -1,
      65,    -1,    22,     7,    -1,    21,     7,    -1,     7,    -1,
      23,    54,     7,    -1,    23,     7,    -1,    70,     7,    -1,
      12,    46,    32,    46,    13,    -1,    12,    46,    33,    46,
      13,    -1,    12,    46,    34,    46,    13,    -1,    12,    46,
      35,    46,    13,    -1,    12,    46,    30,    46,    13,    -1,
      12,    46,    31,    46,    13,    -1,    12,    51,    13,    -1,
      12,    29,    71,    13,    -1,    24,    67,    18,    63,    19,
      -1,    24,    67,    18,    63,    19,    25,    18,    63,    19,
      -1,    26,    67,    18,    63,    19,    -1,    38,    12,    49,
      13,    -1,    12,    46,    32,    46,    13,    -1,    12,    46,
      33,    46,    13,    -1,    12,    46,    34,    46,    13,    -1,
      12,    46,    35,    46,    13,    -1,    12,    46,    30,    46,
      13,    -1,    12,    46,    31,    46,    13,    -1,    12,    51,
      13,    -1,    29,    71,    -1,    37,    -1,    38,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   143,   143,   150,   155,   160,   164,   168,   172,   176,
     182,   188,   192,   196,   200,   204,   208,   212,   218,   222,
     228,   232,   236,   240,   246,   250,   255,   260,   264,   270,
     274,   278,   284,   290,   294,   298,   304,   308,   314,   318,
     324,   328,   332,   336,   342,   346,   350,   354,   360,   364,
     369,   374,   380,   384,   390,   396,   402,   406,   412,   416,
     420,   424,   428,   432,   436,   440,   444,   450,   454,   460,
     466,   470,   474,   478,   482,   486,   490,   494,   500,   504,
     510,   516,   522,   526,   530,   534,   538,   542,   546,   550,
     556,   560
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "ADD", "SUB", "MUL", "DIV", "SEMICOLON",
  "LET", "COLON", "ASSIGNMENT", "FN", "LP", "RP", "RARROW",
  "LSQUAREBRACKET", "RSQUAREBRACKET", "DOT", "LBRACE", "RBRACE", "COMMA",
  "BREAK", "CONTINUE", "RET", "IF", "ELSE", "WHILE", "AND", "OR", "NOT",
  "EQ", "NE", "LT", "GT", "GE", "LE", "STRUCT", "INT", "ID", "NUM",
  "UMINUS", "$accept", "Program", "ProgramElementList", "ProgramElement",
  "StructDef", "ExprUnit", "ArithExpr", "ArithBiOpExpr", "RightValList",
  "ArrayExpr", "BoolExpr", "AssignStmt", "LeftVal", "RightVal",
  "VarDeclStmt", "VarDecl", "VarDef", "VarDeclList", "FnDeclStmt",
  "FnDecl", "ParamDecl", "FnDef", "CodeBlockStmtList", "CodeBlockStmt",
  "ReturnStmt", "CallStmt", "BoolUnit_", "IfStmt", "WhileStmt", "FnCall",
  "BoolUnit", "TYPE", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    41,    42,    43,    43,    44,    44,    44,    44,    44,
      45,    46,    46,    46,    46,    46,    46,    46,    47,    47,
      48,    48,    48,    48,    49,    49,    49,    50,    50,    51,
      51,    51,    52,    53,    53,    53,    54,    54,    55,    55,
      56,    56,    56,    56,    57,    57,    57,    57,    58,    58,
      58,    59,    60,    60,    61,    62,    63,    63,    64,    64,
      64,    64,    64,    64,    64,    64,    64,    65,    65,    66,
      67,    67,    67,    67,    67,    67,    67,    67,    68,    68,
      69,    70,    71,    71,    71,    71,    71,    71,    71,    71,
      72,    72
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     0,     1,     1,     1,     1,     1,
       5,     1,     1,     3,     1,     1,     3,     2,     1,     1,
       3,     3,     3,     3,     3,     1,     0,     4,     4,     3,
       3,     1,     4,     1,     1,     3,     1,     1,     3,     3,
       3,     6,     1,     4,     5,     3,    10,     8,     3,     1,
       0,     2,     5,     7,     1,     4,     1,     2,     1,     1,
       1,     1,     1,     1,     2,     2,     1,     3,     2,     2,
       5,     5,     5,     5,     5,     5,     3,     4,     5,     9,
       5,     4,     5,     5,     5,     5,     5,     5,     3,     2,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,     9,     0,     0,     0,     0,     2,     4,     6,     5,
       7,     0,     8,    42,     0,     0,     0,     0,     1,     3,
      51,     0,     0,     0,     0,    39,    38,    50,    50,    66,
       0,     0,     0,     0,     0,    33,    34,    59,     0,    58,
       0,    56,    63,    60,    61,    62,     0,    90,    91,    40,
       0,     0,     0,    12,    11,    19,    36,    18,    15,    37,
       0,    45,    14,    31,     0,    42,    49,    54,     0,     0,
      65,    64,    68,     0,     0,     0,     0,    26,     0,     0,
       0,    55,    57,    69,     0,    17,    19,     0,     0,     0,
      89,     0,     0,     0,     0,     0,     0,     0,    43,     0,
       0,    50,    52,    10,    67,     0,     0,     0,     0,     0,
       0,    25,     0,     0,     0,    35,    44,     0,     0,     0,
       0,     0,     0,    13,    88,     0,     0,    20,    21,    22,
      23,    29,    30,    16,     0,     0,    40,     0,    48,     0,
      89,     0,     0,     0,     0,     0,     0,    76,     0,     0,
      81,    26,    32,    28,    27,     0,     0,     0,     0,     0,
       0,    41,    26,    43,    53,    77,     0,     0,     0,     0,
       0,     0,    78,    80,    24,    86,    87,    82,    83,    84,
      85,     0,     0,     0,    74,    75,    70,    71,    72,    73,
       0,    26,    47,    41,     0,     0,     0,    46,    79
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     5,     6,     7,     8,    55,    56,    57,   110,    58,
      59,    37,    60,   111,    39,    66,    15,    67,    10,    11,
      68,    12,    40,    41,    42,    43,    75,    44,    45,    62,
      63,    49
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -144
static const yytype_int16 yypact[] =
{
      34,  -144,   -23,   -15,    -1,    47,  -144,    34,  -144,  -144,
    -144,     9,  -144,   117,    50,    52,    51,    49,  -144,  -144,
    -144,    99,   120,    74,    44,  -144,  -144,    63,    63,  -144,
     124,   144,    27,   112,   112,   141,  -144,  -144,    67,  -144,
     145,    99,  -144,  -144,  -144,  -144,   158,  -144,  -144,   153,
     127,    74,     1,   118,  -144,  -144,   111,  -144,    21,    77,
     119,  -144,  -144,  -144,   151,    20,   148,  -144,   157,   150,
    -144,  -144,  -144,   164,    90,   154,   160,    74,    74,   121,
     136,  -144,  -144,  -144,    74,  -144,   108,   105,    -2,    74,
    -144,    42,    42,    42,    42,     1,     1,   138,   146,   120,
     140,    63,   166,  -144,  -144,     1,   114,     5,    99,    99,
     168,   162,   176,   169,   170,  -144,  -144,    42,    42,    42,
      42,    42,    42,  -144,  -144,   108,    42,   156,   156,  -144,
    -144,  -144,   161,   135,   120,   171,  -144,   174,  -144,   120,
     178,    42,    42,    42,    42,    42,    42,  -144,   165,   173,
    -144,    74,  -144,  -144,  -144,   180,   181,   182,   183,   184,
     185,   177,    74,   190,  -144,  -144,   187,   188,   189,   191,
     192,   193,   186,  -144,  -144,  -144,  -144,  -144,  -144,  -144,
    -144,   194,   195,   120,  -144,  -144,  -144,  -144,  -144,  -144,
     197,    74,  -144,  -144,    99,   198,   199,  -144,  -144
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -144,  -144,   196,  -144,  -144,   -46,   -41,  -144,  -143,   -21,
     -34,  -144,   -19,   -20,    14,   205,  -144,   -22,  -144,  -144,
    -144,  -144,   -40,  -144,  -144,  -144,   175,  -144,  -144,   -17,
     -45,   -90
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -36
static const yytype_int16 yytable[] =
{
      36,    82,    38,    61,    46,    86,    69,    90,   174,   136,
      87,   124,    73,    89,     9,    13,    20,    88,   147,   182,
      36,     9,    38,    16,    46,    95,    96,    21,   106,    99,
      52,    50,    95,    96,    72,   100,   -34,    17,   -34,    51,
     107,     1,     2,   125,   161,     3,    50,    18,   195,   164,
     127,   128,   129,   130,   126,    88,    52,    25,   112,    26,
     140,   131,   132,    27,   116,    53,    54,    28,   148,   149,
       4,   155,   156,   157,   158,   159,   160,    78,    50,   138,
      53,    54,    79,    64,    80,    87,    51,    36,    36,    38,
      38,    46,    46,   193,    50,   166,   167,   168,   169,   170,
     171,    65,    51,    52,    95,    96,    29,     2,    91,    92,
      93,    94,    53,    54,    91,    92,    93,    94,   123,   105,
      30,    31,    32,    33,    74,    34,    22,    23,    53,    54,
      77,    70,    24,   -33,    79,   -33,    97,    35,   117,   118,
     119,   120,   121,   122,   141,   142,   143,   144,   145,   146,
     -35,    71,   -35,    77,   196,   134,   135,    47,    48,   113,
     114,    93,    94,    84,    81,    83,    85,    98,   101,   103,
     102,   104,   108,    36,   115,    38,   133,    46,   109,   137,
     139,   150,   151,   152,   172,   153,   154,   181,    95,   162,
     163,   165,   173,   175,   176,   177,   178,   179,   180,   183,
     184,   185,   186,    19,   187,   188,   189,    14,     0,    76,
       0,   190,   191,     0,   192,   194,     0,   197,   198
};

static const yytype_int16 yycheck[] =
{
      21,    41,    21,    23,    21,    51,    28,    52,   151,    99,
      51,    13,    32,    12,     0,    38,     7,    51,    13,   162,
      41,     7,    41,    38,    41,    27,    28,    18,    74,     9,
      29,     4,    27,    28,     7,    15,    15,    38,    17,    12,
      74,     7,     8,    89,   134,    11,     4,     0,   191,   139,
      91,    92,    93,    94,    12,    89,    29,     7,    78,     7,
     105,    95,    96,    12,    84,    38,    39,    18,   108,   109,
      36,   117,   118,   119,   120,   121,   122,    10,     4,   101,
      38,    39,    15,    39,    17,   126,    12,   108,   109,   108,
     109,   108,   109,   183,     4,   141,   142,   143,   144,   145,
     146,    38,    12,    29,    27,    28,     7,     8,     3,     4,
       5,     6,    38,    39,     3,     4,     5,     6,    13,    29,
      21,    22,    23,    24,    12,    26,     9,    10,    38,    39,
      12,     7,    15,    15,    15,    17,    17,    38,    30,    31,
      32,    33,    34,    35,    30,    31,    32,    33,    34,    35,
      15,     7,    17,    12,   194,     9,    10,    37,    38,    38,
      39,     5,     6,    10,    19,     7,    39,    16,    20,    19,
      13,     7,    18,   194,    38,   194,    38,   194,    18,    39,
      14,    13,    20,     7,    19,    16,    16,    10,    27,    18,
      16,    13,    19,    13,    13,    13,    13,    13,    13,     9,
      13,    13,    13,     7,    13,    13,    13,     2,    -1,    34,
      -1,    25,    18,    -1,    19,    18,    -1,    19,    19
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     7,     8,    11,    36,    42,    43,    44,    45,    55,
      59,    60,    62,    38,    56,    57,    38,    38,     0,    43,
       7,    18,     9,    10,    15,     7,     7,    12,    18,     7,
      21,    22,    23,    24,    26,    38,    50,    52,    53,    55,
      63,    64,    65,    66,    68,    69,    70,    37,    38,    72,
       4,    12,    29,    38,    39,    46,    47,    48,    50,    51,
      53,    54,    70,    71,    39,    38,    56,    58,    61,    58,
       7,     7,     7,    54,    12,    67,    67,    12,    10,    15,
      17,    19,    63,     7,    10,    39,    46,    47,    51,    12,
      71,     3,     4,     5,     6,    27,    28,    17,    16,     9,
      15,    20,    13,    19,     7,    29,    46,    51,    18,    18,
      49,    54,    54,    38,    39,    38,    54,    30,    31,    32,
      33,    34,    35,    13,    13,    46,    12,    47,    47,    47,
      47,    51,    51,    38,     9,    10,    72,    39,    58,    14,
      71,    30,    31,    32,    33,    34,    35,    13,    63,    63,
      13,    20,     7,    16,    16,    46,    46,    46,    46,    46,
      46,    72,    18,    16,    72,    13,    46,    46,    46,    46,
      46,    46,    19,    19,    49,    13,    13,    13,    13,    13,
      13,    10,    49,     9,    13,    13,    13,    13,    13,    13,
      25,    18,    19,    72,    18,    49,    63,    19,    19
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 144 "parser.yacc"
    {  
  root = A_Program((yyvsp[(1) - (1)].programElementList));
  (yyval.program) = A_Program((yyvsp[(1) - (1)].programElementList));
}
    break;

  case 3:
#line 151 "parser.yacc"
    {
  (yyval.programElementList) = A_ProgramElementList((yyvsp[(1) - (2)].programElement), (yyvsp[(2) - (2)].programElementList));
}
    break;

  case 4:
#line 155 "parser.yacc"
    {
  (yyval.programElementList) = nullptr;
}
    break;

  case 5:
#line 161 "parser.yacc"
    {
  (yyval.programElement) = A_ProgramVarDeclStmt((yyvsp[(1) - (1)].varDeclStmt)->pos, (yyvsp[(1) - (1)].varDeclStmt));
}
    break;

  case 6:
#line 165 "parser.yacc"
    {
  (yyval.programElement) = A_ProgramStructDef((yyvsp[(1) - (1)].structDef)->pos, (yyvsp[(1) - (1)].structDef));
}
    break;

  case 7:
#line 169 "parser.yacc"
    {
  (yyval.programElement) = A_ProgramFnDeclStmt((yyvsp[(1) - (1)].fnDeclStmt)->pos, (yyvsp[(1) - (1)].fnDeclStmt));
}
    break;

  case 8:
#line 173 "parser.yacc"
    {
  (yyval.programElement) = A_ProgramFnDef((yyvsp[(1) - (1)].fnDef)->pos, (yyvsp[(1) - (1)].fnDef));
}
    break;

  case 9:
#line 177 "parser.yacc"
    {
  (yyval.programElement) = A_ProgramNullStmt((yyvsp[(1) - (1)].pos));
}
    break;

  case 10:
#line 183 "parser.yacc"
    {
  (yyval.structDef) = A_StructDef((yyvsp[(1) - (5)].pos), (yyvsp[(2) - (5)].tokenId)->id, (yyvsp[(4) - (5)].varDeclList));
}
    break;

  case 11:
#line 189 "parser.yacc"
    {
  (yyval.exprUnit) = A_NumExprUnit((yyvsp[(1) - (1)].tokenNum)->pos, (yyvsp[(1) - (1)].tokenNum)->num);
}
    break;

  case 12:
#line 193 "parser.yacc"
    {
  (yyval.exprUnit) = A_IdExprUnit((yyvsp[(1) - (1)].tokenId)->pos, (yyvsp[(1) - (1)].tokenId)->id);
}
    break;

  case 13:
#line 197 "parser.yacc"
    {
  (yyval.exprUnit) = A_ArithExprUnit((yyvsp[(1) - (3)].pos), (yyvsp[(2) - (3)].arithExpr));
}
    break;

  case 14:
#line 201 "parser.yacc"
    {
  (yyval.exprUnit) = A_CallExprUnit((yyvsp[(1) - (1)].fnCall)->pos, (yyvsp[(1) - (1)].fnCall));
}
    break;

  case 15:
#line 205 "parser.yacc"
    {
  (yyval.exprUnit) = A_ArrayExprUnit((yyvsp[(1) - (1)].arrayExpr)->pos, (yyvsp[(1) - (1)].arrayExpr));
}
    break;

  case 16:
#line 209 "parser.yacc"
    {
  (yyval.exprUnit) = A_MemberExprUnit((yyvsp[(1) - (3)].leftVal)->pos, A_MemberExpr((yyvsp[(1) - (3)].leftVal)->pos, (yyvsp[(1) - (3)].leftVal), (yyvsp[(3) - (3)].tokenId)->id));
}
    break;

  case 17:
#line 213 "parser.yacc"
    {
  (yyval.exprUnit) = A_NumExprUnit((yyvsp[(1) - (2)].pos), -((yyvsp[(2) - (2)].tokenNum)->num));
}
    break;

  case 18:
#line 219 "parser.yacc"
    {
  (yyval.arithExpr) = A_ArithBiOp_Expr((yyvsp[(1) - (1)].arithBiOpExpr)->pos, (yyvsp[(1) - (1)].arithBiOpExpr));
}
    break;

  case 19:
#line 223 "parser.yacc"
    {
  (yyval.arithExpr) = A_ExprUnit((yyvsp[(1) - (1)].exprUnit)->pos, (yyvsp[(1) - (1)].exprUnit));
}
    break;

  case 20:
#line 229 "parser.yacc"
    {
  (yyval.arithBiOpExpr) = A_ArithBiOpExpr((yyvsp[(1) - (3)].arithExpr)->pos, A_add, (yyvsp[(1) - (3)].arithExpr), (yyvsp[(3) - (3)].arithExpr));
}
    break;

  case 21:
#line 233 "parser.yacc"
    {
  (yyval.arithBiOpExpr) = A_ArithBiOpExpr((yyvsp[(1) - (3)].arithExpr)->pos, A_sub, (yyvsp[(1) - (3)].arithExpr), (yyvsp[(3) - (3)].arithExpr));
}
    break;

  case 22:
#line 237 "parser.yacc"
    {
  (yyval.arithBiOpExpr) = A_ArithBiOpExpr((yyvsp[(1) - (3)].arithExpr)->pos, A_mul, (yyvsp[(1) - (3)].arithExpr), (yyvsp[(3) - (3)].arithExpr));
}
    break;

  case 23:
#line 241 "parser.yacc"
    {
  (yyval.arithBiOpExpr) = A_ArithBiOpExpr((yyvsp[(1) - (3)].arithExpr)->pos, A_div, (yyvsp[(1) - (3)].arithExpr), (yyvsp[(3) - (3)].arithExpr));
}
    break;

  case 24:
#line 247 "parser.yacc"
    {
  (yyval.rightValList) = A_RightValList((yyvsp[(1) - (3)].rightVal), (yyvsp[(3) - (3)].rightValList));
}
    break;

  case 25:
#line 251 "parser.yacc"
    {
  (yyval.rightValList) = A_RightValList((yyvsp[(1) - (1)].rightVal), nullptr);
}
    break;

  case 26:
#line 255 "parser.yacc"
    {
  (yyval.rightValList) = nullptr;
}
    break;

  case 27:
#line 261 "parser.yacc"
    {
  (yyval.arrayExpr) = A_ArrayExpr((yyvsp[(1) - (4)].leftVal)->pos, (yyvsp[(1) - (4)].leftVal), A_NumIndexExpr((yyvsp[(3) - (4)].tokenNum)->pos, (yyvsp[(3) - (4)].tokenNum)->num));
}
    break;

  case 28:
#line 265 "parser.yacc"
    {
  (yyval.arrayExpr) = A_ArrayExpr((yyvsp[(1) - (4)].leftVal)->pos, (yyvsp[(1) - (4)].leftVal), A_IdIndexExpr((yyvsp[(3) - (4)].tokenId)->pos, (yyvsp[(3) - (4)].tokenId)->id));
}
    break;

  case 29:
#line 271 "parser.yacc"
    {
  (yyval.boolExpr) = A_BoolBiOp_Expr((yyvsp[(1) - (3)].boolExpr)->pos, A_BoolBiOpExpr((yyvsp[(1) - (3)].boolExpr)->pos, A_and, (yyvsp[(1) - (3)].boolExpr), (yyvsp[(3) - (3)].boolExpr)));
}
    break;

  case 30:
#line 275 "parser.yacc"
    {
  (yyval.boolExpr) = A_BoolBiOp_Expr((yyvsp[(1) - (3)].boolExpr)->pos, A_BoolBiOpExpr((yyvsp[(1) - (3)].boolExpr)->pos, A_or, (yyvsp[(1) - (3)].boolExpr), (yyvsp[(3) - (3)].boolExpr)));
}
    break;

  case 31:
#line 279 "parser.yacc"
    {
  (yyval.boolExpr) = A_BoolExpr((yyvsp[(1) - (1)].boolUnit)->pos, (yyvsp[(1) - (1)].boolUnit));
}
    break;

  case 32:
#line 285 "parser.yacc"
    {
  (yyval.assignStmt) = A_AssignStmt((yyvsp[(1) - (4)].leftVal)->pos, (yyvsp[(1) - (4)].leftVal), (yyvsp[(3) - (4)].rightVal));
}
    break;

  case 33:
#line 291 "parser.yacc"
    {
  (yyval.leftVal) = A_IdExprLVal((yyvsp[(1) - (1)].tokenId)->pos, (yyvsp[(1) - (1)].tokenId)->id);
}
    break;

  case 34:
#line 295 "parser.yacc"
    {
  (yyval.leftVal) = A_ArrExprLVal((yyvsp[(1) - (1)].arrayExpr)->pos, (yyvsp[(1) - (1)].arrayExpr));
}
    break;

  case 35:
#line 299 "parser.yacc"
    {
  (yyval.leftVal) = A_MemberExprLVal((yyvsp[(1) - (3)].leftVal)->pos, A_MemberExpr((yyvsp[(1) - (3)].leftVal)->pos, (yyvsp[(1) - (3)].leftVal), (yyvsp[(3) - (3)].tokenId)->id));
}
    break;

  case 36:
#line 305 "parser.yacc"
    {
  (yyval.rightVal) = A_ArithExprRVal((yyvsp[(1) - (1)].arithExpr)->pos, (yyvsp[(1) - (1)].arithExpr));
}
    break;

  case 37:
#line 309 "parser.yacc"
    {
  (yyval.rightVal) = A_BoolExprRVal((yyvsp[(1) - (1)].boolExpr)->pos, (yyvsp[(1) - (1)].boolExpr));
}
    break;

  case 38:
#line 315 "parser.yacc"
    {
  (yyval.varDeclStmt) = A_VarDefStmt((yyvsp[(1) - (3)].pos), (yyvsp[(2) - (3)].varDef));
}
    break;

  case 39:
#line 319 "parser.yacc"
    {
  (yyval.varDeclStmt) = A_VarDeclStmt((yyvsp[(1) - (3)].pos), (yyvsp[(2) - (3)].varDecl));
}
    break;

  case 40:
#line 325 "parser.yacc"
    {
  (yyval.varDecl) = A_VarDecl_Scalar((yyvsp[(1) - (3)].tokenId)->pos, A_VarDeclScalar((yyvsp[(1) - (3)].tokenId)->pos, (yyvsp[(1) - (3)].tokenId)->id, (yyvsp[(3) - (3)].type)));
}
    break;

  case 41:
#line 329 "parser.yacc"
    {
  (yyval.varDecl) = A_VarDecl_Array((yyvsp[(1) - (6)].tokenId)->pos, A_VarDeclArray((yyvsp[(1) - (6)].tokenId)->pos, (yyvsp[(1) - (6)].tokenId)->id, (yyvsp[(3) - (6)].tokenNum)->num, (yyvsp[(6) - (6)].type)));
}
    break;

  case 42:
#line 333 "parser.yacc"
    {
  (yyval.varDecl) = A_VarDecl_Scalar((yyvsp[(1) - (1)].tokenId)->pos, A_VarDeclScalar((yyvsp[(1) - (1)].tokenId)->pos, (yyvsp[(1) - (1)].tokenId)->id, NULL));
}
    break;

  case 43:
#line 337 "parser.yacc"
    {
  (yyval.varDecl) = A_VarDecl_Array((yyvsp[(1) - (4)].tokenId)->pos, A_VarDeclArray((yyvsp[(1) - (4)].tokenId)->pos, (yyvsp[(1) - (4)].tokenId)->id, (yyvsp[(3) - (4)].tokenNum)->num, NULL));
}
    break;

  case 44:
#line 343 "parser.yacc"
    {
  (yyval.varDef) = A_VarDef_Scalar((yyvsp[(1) - (5)].tokenId)->pos, A_VarDefScalar((yyvsp[(1) - (5)].tokenId)->pos, (yyvsp[(1) - (5)].tokenId)->id, (yyvsp[(3) - (5)].type), (yyvsp[(5) - (5)].rightVal)));
}
    break;

  case 45:
#line 347 "parser.yacc"
    {
  (yyval.varDef) = A_VarDef_Scalar((yyvsp[(1) - (3)].tokenId)->pos, A_VarDefScalar((yyvsp[(1) - (3)].tokenId)->pos, (yyvsp[(1) - (3)].tokenId)->id, NULL, (yyvsp[(3) - (3)].rightVal)));
}
    break;

  case 46:
#line 351 "parser.yacc"
    {
  (yyval.varDef) = A_VarDef_Array((yyvsp[(1) - (10)].tokenId)->pos, A_VarDefArray((yyvsp[(1) - (10)].tokenId)->pos, (yyvsp[(1) - (10)].tokenId)->id, (yyvsp[(3) - (10)].tokenNum)->num, (yyvsp[(6) - (10)].type), (yyvsp[(9) - (10)].rightValList)));
}
    break;

  case 47:
#line 355 "parser.yacc"
    {
  (yyval.varDef) = A_VarDef_Array((yyvsp[(1) - (8)].tokenId)->pos, A_VarDefArray((yyvsp[(1) - (8)].tokenId)->pos, (yyvsp[(1) - (8)].tokenId)->id, (yyvsp[(3) - (8)].tokenNum)->num, NULL, (yyvsp[(7) - (8)].rightValList)));
}
    break;

  case 48:
#line 361 "parser.yacc"
    {
  (yyval.varDeclList) = A_VarDeclList((yyvsp[(1) - (3)].varDecl), (yyvsp[(3) - (3)].varDeclList));
}
    break;

  case 49:
#line 365 "parser.yacc"
    {
  (yyval.varDeclList) = A_VarDeclList((yyvsp[(1) - (1)].varDecl), nullptr);
}
    break;

  case 50:
#line 369 "parser.yacc"
    {
  (yyval.varDeclList) = nullptr;
}
    break;

  case 51:
#line 375 "parser.yacc"
    {
  (yyval.fnDeclStmt) = A_FnDeclStmt((yyvsp[(1) - (2)].fnDecl)->pos, (yyvsp[(1) - (2)].fnDecl));
}
    break;

  case 52:
#line 381 "parser.yacc"
    {
  (yyval.fnDecl) = A_FnDecl((yyvsp[(1) - (5)].pos), (yyvsp[(2) - (5)].tokenId)->id, (yyvsp[(4) - (5)].paramDecl), NULL);
}
    break;

  case 53:
#line 385 "parser.yacc"
    {
  (yyval.fnDecl) = A_FnDecl((yyvsp[(1) - (7)].pos), (yyvsp[(2) - (7)].tokenId)->id, (yyvsp[(4) - (7)].paramDecl), (yyvsp[(7) - (7)].type));
}
    break;

  case 54:
#line 391 "parser.yacc"
    {
  (yyval.paramDecl) = A_ParamDecl((yyvsp[(1) - (1)].varDeclList));
}
    break;

  case 55:
#line 397 "parser.yacc"
    {
  (yyval.fnDef) = A_FnDef((yyvsp[(1) - (4)].fnDecl)->pos, (yyvsp[(1) - (4)].fnDecl), (yyvsp[(3) - (4)].codeBlockStmtList));
}
    break;

  case 56:
#line 403 "parser.yacc"
    {
  (yyval.codeBlockStmtList) = A_CodeBlockStmtList((yyvsp[(1) - (1)].codeBlockStmt), nullptr);
}
    break;

  case 57:
#line 407 "parser.yacc"
    {
  (yyval.codeBlockStmtList) = A_CodeBlockStmtList((yyvsp[(1) - (2)].codeBlockStmt), (yyvsp[(2) - (2)].codeBlockStmtList));
}
    break;

  case 58:
#line 413 "parser.yacc"
    {
  (yyval.codeBlockStmt) = A_BlockVarDeclStmt((yyvsp[(1) - (1)].varDeclStmt)->pos, (yyvsp[(1) - (1)].varDeclStmt));
}
    break;

  case 59:
#line 417 "parser.yacc"
    {
  (yyval.codeBlockStmt) = A_BlockAssignStmt((yyvsp[(1) - (1)].assignStmt)->pos, (yyvsp[(1) - (1)].assignStmt));
}
    break;

  case 60:
#line 421 "parser.yacc"
    {
  (yyval.codeBlockStmt) = A_BlockCallStmt((yyvsp[(1) - (1)].callStmt)->pos, (yyvsp[(1) - (1)].callStmt));
}
    break;

  case 61:
#line 425 "parser.yacc"
    {
  (yyval.codeBlockStmt) = A_BlockIfStmt((yyvsp[(1) - (1)].ifStmt)->pos, (yyvsp[(1) - (1)].ifStmt));
}
    break;

  case 62:
#line 429 "parser.yacc"
    {
  (yyval.codeBlockStmt) = A_BlockWhileStmt((yyvsp[(1) - (1)].whileStmt)->pos, (yyvsp[(1) - (1)].whileStmt));
}
    break;

  case 63:
#line 433 "parser.yacc"
    {
  (yyval.codeBlockStmt) = A_BlockReturnStmt((yyvsp[(1) - (1)].returnStmt)->pos, (yyvsp[(1) - (1)].returnStmt));
}
    break;

  case 64:
#line 437 "parser.yacc"
    {
  (yyval.codeBlockStmt) = A_BlockContinueStmt((yyvsp[(1) - (2)].pos));
}
    break;

  case 65:
#line 441 "parser.yacc"
    {
  (yyval.codeBlockStmt) = A_BlockBreakStmt((yyvsp[(1) - (2)].pos));
}
    break;

  case 66:
#line 445 "parser.yacc"
    {
  (yyval.codeBlockStmt) = A_BlockNullStmt((yyvsp[(1) - (1)].pos));
}
    break;

  case 67:
#line 451 "parser.yacc"
    {
  (yyval.returnStmt) = A_ReturnStmt((yyvsp[(1) - (3)].pos), (yyvsp[(2) - (3)].rightVal));
}
    break;

  case 68:
#line 455 "parser.yacc"
    {
  (yyval.returnStmt) = A_ReturnStmt((yyvsp[(1) - (2)].pos), nullptr);
}
    break;

  case 69:
#line 461 "parser.yacc"
    {
  (yyval.callStmt) = A_CallStmt((yyvsp[(1) - (2)].fnCall)->pos, (yyvsp[(1) - (2)].fnCall));
}
    break;

  case 70:
#line 467 "parser.yacc"
    {
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[(1) - (5)].pos), A_ComExpr((yyvsp[(2) - (5)].exprUnit)->pos, A_lt, (yyvsp[(2) - (5)].exprUnit), (yyvsp[(4) - (5)].exprUnit)));
}
    break;

  case 71:
#line 471 "parser.yacc"
    {
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[(1) - (5)].pos), A_ComExpr((yyvsp[(2) - (5)].exprUnit)->pos, A_gt, (yyvsp[(2) - (5)].exprUnit), (yyvsp[(4) - (5)].exprUnit)));
}
    break;

  case 72:
#line 475 "parser.yacc"
    {
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[(1) - (5)].pos), A_ComExpr((yyvsp[(2) - (5)].exprUnit)->pos, A_ge, (yyvsp[(2) - (5)].exprUnit), (yyvsp[(4) - (5)].exprUnit)));
}
    break;

  case 73:
#line 479 "parser.yacc"
    {
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[(1) - (5)].pos), A_ComExpr((yyvsp[(2) - (5)].exprUnit)->pos, A_le, (yyvsp[(2) - (5)].exprUnit), (yyvsp[(4) - (5)].exprUnit)));
}
    break;

  case 74:
#line 483 "parser.yacc"
    {
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[(1) - (5)].pos), A_ComExpr((yyvsp[(2) - (5)].exprUnit)->pos, A_eq, (yyvsp[(2) - (5)].exprUnit), (yyvsp[(4) - (5)].exprUnit)));
}
    break;

  case 75:
#line 487 "parser.yacc"
    {
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[(1) - (5)].pos), A_ComExpr((yyvsp[(2) - (5)].exprUnit)->pos, A_ne, (yyvsp[(2) - (5)].exprUnit), (yyvsp[(4) - (5)].exprUnit)));
}
    break;

  case 76:
#line 491 "parser.yacc"
    {
  (yyval.boolUnit) = A_BoolExprUnit((yyvsp[(1) - (3)].pos), (yyvsp[(2) - (3)].boolExpr));
}
    break;

  case 77:
#line 495 "parser.yacc"
    {
  (yyval.boolUnit) = A_BoolUOpExprUnit((yyvsp[(1) - (4)].pos), A_BoolUOpExpr((yyvsp[(2) - (4)].pos), A_not, (yyvsp[(3) - (4)].boolUnit)));
}
    break;

  case 78:
#line 501 "parser.yacc"
    {
  (yyval.ifStmt) = A_IfStmt((yyvsp[(1) - (5)].pos), (yyvsp[(2) - (5)].boolUnit), (yyvsp[(4) - (5)].codeBlockStmtList), nullptr);
}
    break;

  case 79:
#line 505 "parser.yacc"
    {
  (yyval.ifStmt) = A_IfStmt((yyvsp[(1) - (9)].pos), (yyvsp[(2) - (9)].boolUnit), (yyvsp[(4) - (9)].codeBlockStmtList), (yyvsp[(8) - (9)].codeBlockStmtList));
}
    break;

  case 80:
#line 511 "parser.yacc"
    {
  (yyval.whileStmt) = A_WhileStmt((yyvsp[(1) - (5)].pos), (yyvsp[(2) - (5)].boolUnit), (yyvsp[(4) - (5)].codeBlockStmtList));
}
    break;

  case 81:
#line 517 "parser.yacc"
    {
  (yyval.fnCall) = A_FnCall((yyvsp[(1) - (4)].tokenId)->pos, (yyvsp[(1) - (4)].tokenId)->id, (yyvsp[(3) - (4)].rightValList));
}
    break;

  case 82:
#line 523 "parser.yacc"
    {
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[(1) - (5)].pos), A_ComExpr((yyvsp[(2) - (5)].exprUnit)->pos, A_lt, (yyvsp[(2) - (5)].exprUnit), (yyvsp[(4) - (5)].exprUnit)));
}
    break;

  case 83:
#line 527 "parser.yacc"
    {
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[(1) - (5)].pos), A_ComExpr((yyvsp[(2) - (5)].exprUnit)->pos, A_gt, (yyvsp[(2) - (5)].exprUnit), (yyvsp[(4) - (5)].exprUnit)));
}
    break;

  case 84:
#line 531 "parser.yacc"
    {
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[(1) - (5)].pos), A_ComExpr((yyvsp[(2) - (5)].exprUnit)->pos, A_ge, (yyvsp[(2) - (5)].exprUnit), (yyvsp[(4) - (5)].exprUnit)));
}
    break;

  case 85:
#line 535 "parser.yacc"
    {
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[(1) - (5)].pos), A_ComExpr((yyvsp[(2) - (5)].exprUnit)->pos, A_le, (yyvsp[(2) - (5)].exprUnit), (yyvsp[(4) - (5)].exprUnit)));
}
    break;

  case 86:
#line 539 "parser.yacc"
    {
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[(1) - (5)].pos), A_ComExpr((yyvsp[(2) - (5)].exprUnit)->pos, A_eq, (yyvsp[(2) - (5)].exprUnit), (yyvsp[(4) - (5)].exprUnit)));
}
    break;

  case 87:
#line 543 "parser.yacc"
    {
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[(1) - (5)].pos), A_ComExpr((yyvsp[(2) - (5)].exprUnit)->pos, A_ne, (yyvsp[(2) - (5)].exprUnit), (yyvsp[(4) - (5)].exprUnit)));
}
    break;

  case 88:
#line 547 "parser.yacc"
    {
  (yyval.boolUnit) = A_BoolExprUnit((yyvsp[(1) - (3)].pos), (yyvsp[(2) - (3)].boolExpr));
}
    break;

  case 89:
#line 551 "parser.yacc"
    {
  (yyval.boolUnit) = A_BoolUOpExprUnit((yyvsp[(1) - (2)].pos), A_BoolUOpExpr((yyvsp[(2) - (2)].boolUnit)->pos, A_not, (yyvsp[(2) - (2)].boolUnit)));
}
    break;

  case 90:
#line 557 "parser.yacc"
    {
  (yyval.type) = A_NativeType((yyvsp[(1) - (1)].pos), A_intTypeKind);
}
    break;

  case 91:
#line 561 "parser.yacc"
    {
  (yyval.type) = A_StructType((yyvsp[(1) - (1)].tokenId)->pos, (yyvsp[(1) - (1)].tokenId)->id);
}
    break;


/* Line 1267 of yacc.c.  */
#line 2243 "y.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 567 "parser.yacc"


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



