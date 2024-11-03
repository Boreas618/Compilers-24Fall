/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
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


#line 86 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif


/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ADD = 258,                     /* ADD  */
    SUB = 259,                     /* SUB  */
    MUL = 260,                     /* MUL  */
    DIV = 261,                     /* DIV  */
    SEMICOLON = 262,               /* SEMICOLON  */
    LET = 263,                     /* LET  */
    COLON = 264,                   /* COLON  */
    ASSIGNMENT = 265,              /* ASSIGNMENT  */
    FN = 266,                      /* FN  */
    LP = 267,                      /* LP  */
    RP = 268,                      /* RP  */
    RARROW = 269,                  /* RARROW  */
    LSQUAREBRACKET = 270,          /* LSQUAREBRACKET  */
    RSQUAREBRACKET = 271,          /* RSQUAREBRACKET  */
    DOT = 272,                     /* DOT  */
    LBRACE = 273,                  /* LBRACE  */
    RBRACE = 274,                  /* RBRACE  */
    COMMA = 275,                   /* COMMA  */
    BREAK = 276,                   /* BREAK  */
    CONTINUE = 277,                /* CONTINUE  */
    RET = 278,                     /* RET  */
    IF = 279,                      /* IF  */
    ELSE = 280,                    /* ELSE  */
    WHILE = 281,                   /* WHILE  */
    AND = 282,                     /* AND  */
    OR = 283,                      /* OR  */
    NOT = 284,                     /* NOT  */
    EQ = 285,                      /* EQ  */
    NE = 286,                      /* NE  */
    LT = 287,                      /* LT  */
    GT = 288,                      /* GT  */
    GE = 289,                      /* GE  */
    LE = 290,                      /* LE  */
    STRUCT = 291,                  /* STRUCT  */
    INT = 292,                     /* INT  */
    ID = 293,                      /* ID  */
    NUM = 294,                     /* NUM  */
    UMINUS = 295                   /* UMINUS  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
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

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 19 "parser.yacc"

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

#line 252 "y.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);



/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_ADD = 3,                        /* ADD  */
  YYSYMBOL_SUB = 4,                        /* SUB  */
  YYSYMBOL_MUL = 5,                        /* MUL  */
  YYSYMBOL_DIV = 6,                        /* DIV  */
  YYSYMBOL_SEMICOLON = 7,                  /* SEMICOLON  */
  YYSYMBOL_LET = 8,                        /* LET  */
  YYSYMBOL_COLON = 9,                      /* COLON  */
  YYSYMBOL_ASSIGNMENT = 10,                /* ASSIGNMENT  */
  YYSYMBOL_FN = 11,                        /* FN  */
  YYSYMBOL_LP = 12,                        /* LP  */
  YYSYMBOL_RP = 13,                        /* RP  */
  YYSYMBOL_RARROW = 14,                    /* RARROW  */
  YYSYMBOL_LSQUAREBRACKET = 15,            /* LSQUAREBRACKET  */
  YYSYMBOL_RSQUAREBRACKET = 16,            /* RSQUAREBRACKET  */
  YYSYMBOL_DOT = 17,                       /* DOT  */
  YYSYMBOL_LBRACE = 18,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 19,                    /* RBRACE  */
  YYSYMBOL_COMMA = 20,                     /* COMMA  */
  YYSYMBOL_BREAK = 21,                     /* BREAK  */
  YYSYMBOL_CONTINUE = 22,                  /* CONTINUE  */
  YYSYMBOL_RET = 23,                       /* RET  */
  YYSYMBOL_IF = 24,                        /* IF  */
  YYSYMBOL_ELSE = 25,                      /* ELSE  */
  YYSYMBOL_WHILE = 26,                     /* WHILE  */
  YYSYMBOL_AND = 27,                       /* AND  */
  YYSYMBOL_OR = 28,                        /* OR  */
  YYSYMBOL_NOT = 29,                       /* NOT  */
  YYSYMBOL_EQ = 30,                        /* EQ  */
  YYSYMBOL_NE = 31,                        /* NE  */
  YYSYMBOL_LT = 32,                        /* LT  */
  YYSYMBOL_GT = 33,                        /* GT  */
  YYSYMBOL_GE = 34,                        /* GE  */
  YYSYMBOL_LE = 35,                        /* LE  */
  YYSYMBOL_STRUCT = 36,                    /* STRUCT  */
  YYSYMBOL_INT = 37,                       /* INT  */
  YYSYMBOL_ID = 38,                        /* ID  */
  YYSYMBOL_NUM = 39,                       /* NUM  */
  YYSYMBOL_UMINUS = 40,                    /* UMINUS  */
  YYSYMBOL_YYACCEPT = 41,                  /* $accept  */
  YYSYMBOL_Program = 42,                   /* Program  */
  YYSYMBOL_ProgramElementList = 43,        /* ProgramElementList  */
  YYSYMBOL_ProgramElement = 44,            /* ProgramElement  */
  YYSYMBOL_StructDef = 45,                 /* StructDef  */
  YYSYMBOL_ExprUnit = 46,                  /* ExprUnit  */
  YYSYMBOL_ArithExpr = 47,                 /* ArithExpr  */
  YYSYMBOL_ArithBiOpExpr = 48,             /* ArithBiOpExpr  */
  YYSYMBOL_RightValList = 49,              /* RightValList  */
  YYSYMBOL_ArrayExpr = 50,                 /* ArrayExpr  */
  YYSYMBOL_BoolExpr = 51,                  /* BoolExpr  */
  YYSYMBOL_AssignStmt = 52,                /* AssignStmt  */
  YYSYMBOL_LeftVal = 53,                   /* LeftVal  */
  YYSYMBOL_RightVal = 54,                  /* RightVal  */
  YYSYMBOL_VarDeclStmt = 55,               /* VarDeclStmt  */
  YYSYMBOL_VarDecl = 56,                   /* VarDecl  */
  YYSYMBOL_VarDef = 57,                    /* VarDef  */
  YYSYMBOL_VarDeclList = 58,               /* VarDeclList  */
  YYSYMBOL_FnDeclStmt = 59,                /* FnDeclStmt  */
  YYSYMBOL_FnDecl = 60,                    /* FnDecl  */
  YYSYMBOL_ParamDecl = 61,                 /* ParamDecl  */
  YYSYMBOL_FnDef = 62,                     /* FnDef  */
  YYSYMBOL_CodeBlockStmtList = 63,         /* CodeBlockStmtList  */
  YYSYMBOL_CodeBlockStmt = 64,             /* CodeBlockStmt  */
  YYSYMBOL_ReturnStmt = 65,                /* ReturnStmt  */
  YYSYMBOL_CallStmt = 66,                  /* CallStmt  */
  YYSYMBOL_BoolUnit_ = 67,                 /* BoolUnit_  */
  YYSYMBOL_IfStmt = 68,                    /* IfStmt  */
  YYSYMBOL_WhileStmt = 69,                 /* WhileStmt  */
  YYSYMBOL_FnCall = 70,                    /* FnCall  */
  YYSYMBOL_BoolUnit = 71,                  /* BoolUnit  */
  YYSYMBOL_TYPE = 72                       /* TYPE  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

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
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
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
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  18
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   211

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  41
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  32
/* YYNRULES -- Number of rules.  */
#define YYNRULES  90
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  196

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   295


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
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
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   143,   143,   150,   155,   160,   164,   168,   172,   176,
     182,   188,   192,   196,   200,   204,   208,   212,   218,   222,
     228,   232,   236,   240,   246,   250,   255,   260,   264,   270,
     274,   278,   284,   290,   294,   298,   304,   308,   314,   318,
     324,   328,   332,   336,   342,   346,   350,   354,   360,   364,
     369,   374,   380,   384,   390,   396,   402,   406,   412,   416,
     420,   424,   428,   432,   436,   440,   444,   450,   454,   460,
     466,   470,   474,   478,   482,   486,   490,   496,   500,   506,
     512,   518,   522,   526,   530,   534,   538,   542,   546,   552,
     556
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "ADD", "SUB", "MUL",
  "DIV", "SEMICOLON", "LET", "COLON", "ASSIGNMENT", "FN", "LP", "RP",
  "RARROW", "LSQUAREBRACKET", "RSQUAREBRACKET", "DOT", "LBRACE", "RBRACE",
  "COMMA", "BREAK", "CONTINUE", "RET", "IF", "ELSE", "WHILE", "AND", "OR",
  "NOT", "EQ", "NE", "LT", "GT", "GE", "LE", "STRUCT", "INT", "ID", "NUM",
  "UMINUS", "$accept", "Program", "ProgramElementList", "ProgramElement",
  "StructDef", "ExprUnit", "ArithExpr", "ArithBiOpExpr", "RightValList",
  "ArrayExpr", "BoolExpr", "AssignStmt", "LeftVal", "RightVal",
  "VarDeclStmt", "VarDecl", "VarDef", "VarDeclList", "FnDeclStmt",
  "FnDecl", "ParamDecl", "FnDef", "CodeBlockStmtList", "CodeBlockStmt",
  "ReturnStmt", "CallStmt", "BoolUnit_", "IfStmt", "WhileStmt", "FnCall",
  "BoolUnit", "TYPE", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-136)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-36)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
       2,  -136,   -27,     7,    39,    19,  -136,     2,  -136,  -136,
    -136,     0,  -136,    49,    10,    29,    93,   120,  -136,  -136,
    -136,    92,    17,    40,   109,  -136,  -136,   112,   112,  -136,
     145,   146,    22,   142,   142,   143,  -136,  -136,   102,  -136,
     137,    92,  -136,  -136,  -136,  -136,   150,  -136,  -136,   148,
     121,    40,     3,   125,  -136,  -136,   140,  -136,    68,    13,
     124,  -136,  -136,  -136,   147,    18,   139,  -136,   149,   152,
    -136,  -136,  -136,   154,    40,   151,   155,    40,    40,    24,
     126,  -136,  -136,  -136,    40,  -136,    94,    98,    79,    40,
    -136,    27,    27,    27,    27,     3,     3,   127,   100,    17,
     128,   112,   161,  -136,  -136,   101,    95,    92,    92,   153,
     156,   170,   162,   163,  -136,  -136,    27,    27,    27,    27,
      27,    27,  -136,  -136,    94,    27,   115,   115,  -136,  -136,
    -136,   141,   132,    17,   164,  -136,   165,  -136,    17,    27,
      27,    27,    27,    27,    27,  -136,   166,   167,  -136,    40,
    -136,  -136,  -136,   171,   174,   175,   176,   177,   178,   173,
      40,   183,  -136,   180,   181,   182,   184,   185,   186,   179,
    -136,  -136,  -136,  -136,  -136,  -136,  -136,  -136,   187,   188,
      17,  -136,  -136,  -136,  -136,  -136,  -136,   190,    40,  -136,
    -136,    92,   191,   192,  -136,  -136
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       4,     9,     0,     0,     0,     0,     2,     4,     6,     5,
       7,     0,     8,    42,     0,     0,     0,     0,     1,     3,
      51,     0,     0,     0,     0,    39,    38,    50,    50,    66,
       0,     0,     0,     0,     0,    33,    34,    59,     0,    58,
       0,    56,    63,    60,    61,    62,     0,    89,    90,    40,
       0,     0,     0,    12,    11,    19,    36,    18,    15,    37,
       0,    45,    14,    31,     0,    42,    49,    54,     0,     0,
      65,    64,    68,     0,     0,     0,     0,    26,     0,     0,
       0,    55,    57,    69,     0,    17,    19,     0,     0,     0,
      88,     0,     0,     0,     0,     0,     0,     0,    43,     0,
       0,    50,    52,    10,    67,     0,     0,     0,     0,     0,
      25,     0,     0,     0,    35,    44,     0,     0,     0,     0,
       0,     0,    13,    87,     0,     0,    20,    21,    22,    23,
      29,    30,    16,     0,     0,    40,     0,    48,     0,     0,
       0,     0,     0,     0,     0,    76,     0,     0,    80,    26,
      32,    28,    27,     0,     0,     0,     0,     0,     0,    41,
      26,    43,    53,     0,     0,     0,     0,     0,     0,    77,
      79,    24,    85,    86,    81,    83,    84,    82,     0,     0,
       0,    74,    75,    70,    72,    73,    71,     0,    26,    47,
      41,     0,     0,     0,    46,    78
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -136,  -136,   189,  -136,  -136,   -46,   -45,  -136,  -135,   -21,
     -39,  -136,   -19,    -2,    16,   198,  -136,   -20,  -136,  -136,
    -136,  -136,   -40,  -136,  -136,  -136,   168,  -136,  -136,   -17,
     157,   -96
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,     5,     6,     7,     8,    55,    56,    57,   109,    58,
      59,    37,    60,   110,    39,    66,    15,    67,    10,    11,
      68,    12,    40,    41,    42,    43,    75,    44,    45,    62,
      63,    49
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      36,    82,    38,   135,    46,    86,    87,    20,    69,     1,
       2,    13,    88,     3,   171,    89,     9,    25,    21,    18,
      36,    61,    38,     9,    46,   179,    50,    99,   105,    72,
      73,    50,    52,   100,    51,   106,    26,   159,     4,   125,
      95,    96,   162,   124,    50,    16,   126,   127,   128,   129,
      88,    52,    51,   192,    47,    48,   130,   131,    22,    23,
      53,    54,   112,   113,    24,    53,    54,   146,   147,    52,
     153,   154,   155,   156,   157,   158,   111,    17,    53,    54,
      87,   137,   115,   -34,   190,   -34,    36,    36,    38,    38,
      46,    46,   123,   163,   164,   165,   166,   167,   168,    29,
       2,    91,    92,    93,    94,    27,    95,    96,   145,   133,
     134,   122,    78,    30,    31,    32,    33,    79,    34,    80,
      93,    94,    95,    96,   116,   117,   118,   119,   120,   121,
      35,   139,   140,   141,   142,   143,   144,    77,    28,    79,
     -33,    97,   -33,    91,    92,    93,    94,   -35,    64,   -35,
      65,   193,    70,    71,    74,    77,    81,    83,    84,   101,
      85,   104,   102,    98,   114,   132,   148,   136,    95,   107,
      36,   103,    38,   108,    46,   138,   149,   150,   151,   152,
       0,   161,   160,   178,   172,   169,   170,   173,   174,   175,
     176,   177,   180,   181,   182,   183,    19,   184,   185,   186,
      14,     0,    76,     0,   187,   188,     0,   189,   191,    90,
     194,   195
};

static const yytype_int16 yycheck[] =
{
      21,    41,    21,    99,    21,    51,    51,     7,    28,     7,
       8,    38,    51,    11,   149,    12,     0,     7,    18,     0,
      41,    23,    41,     7,    41,   160,     4,     9,    74,     7,
      32,     4,    29,    15,    12,    74,     7,   133,    36,    12,
      27,    28,   138,    89,     4,    38,    91,    92,    93,    94,
      89,    29,    12,   188,    37,    38,    95,    96,     9,    10,
      38,    39,    38,    39,    15,    38,    39,   107,   108,    29,
     116,   117,   118,   119,   120,   121,    78,    38,    38,    39,
     125,   101,    84,    15,   180,    17,   107,   108,   107,   108,
     107,   108,    13,   139,   140,   141,   142,   143,   144,     7,
       8,     3,     4,     5,     6,    12,    27,    28,    13,     9,
      10,    13,    10,    21,    22,    23,    24,    15,    26,    17,
       5,     6,    27,    28,    30,    31,    32,    33,    34,    35,
      38,    30,    31,    32,    33,    34,    35,    12,    18,    15,
      15,    17,    17,     3,     4,     5,     6,    15,    39,    17,
      38,   191,     7,     7,    12,    12,    19,     7,    10,    20,
      39,     7,    13,    16,    38,    38,    13,    39,    27,    18,
     191,    19,   191,    18,   191,    14,    20,     7,    16,    16,
      -1,    16,    18,    10,    13,    19,    19,    13,    13,    13,
      13,    13,     9,    13,    13,    13,     7,    13,    13,    13,
       2,    -1,    34,    -1,    25,    18,    -1,    19,    18,    52,
      19,    19
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
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
      15,    20,    13,    19,     7,    46,    51,    18,    18,    49,
      54,    54,    38,    39,    38,    54,    30,    31,    32,    33,
      34,    35,    13,    13,    46,    12,    47,    47,    47,    47,
      51,    51,    38,     9,    10,    72,    39,    58,    14,    30,
      31,    32,    33,    34,    35,    13,    63,    63,    13,    20,
       7,    16,    16,    46,    46,    46,    46,    46,    46,    72,
      18,    16,    72,    46,    46,    46,    46,    46,    46,    19,
      19,    49,    13,    13,    13,    13,    13,    13,    10,    49,
       9,    13,    13,    13,    13,    13,    13,    25,    18,    19,
      72,    18,    49,    63,    19,    19
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    41,    42,    43,    43,    44,    44,    44,    44,    44,
      45,    46,    46,    46,    46,    46,    46,    46,    47,    47,
      48,    48,    48,    48,    49,    49,    49,    50,    50,    51,
      51,    51,    52,    53,    53,    53,    54,    54,    55,    55,
      56,    56,    56,    56,    57,    57,    57,    57,    58,    58,
      58,    59,    60,    60,    61,    62,    63,    63,    64,    64,
      64,    64,    64,    64,    64,    64,    64,    65,    65,    66,
      67,    67,    67,    67,    67,    67,    67,    68,    68,    69,
      70,    71,    71,    71,    71,    71,    71,    71,    71,    72,
      72
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     0,     1,     1,     1,     1,     1,
       5,     1,     1,     3,     1,     1,     3,     2,     1,     1,
       3,     3,     3,     3,     3,     1,     0,     4,     4,     3,
       3,     1,     4,     1,     1,     3,     1,     1,     3,     3,
       3,     6,     1,     4,     5,     3,    10,     8,     3,     1,
       0,     2,     5,     7,     1,     4,     1,     2,     1,     1,
       1,     1,     1,     1,     2,     2,     1,     3,     2,     2,
       5,     5,     5,     5,     5,     5,     3,     5,     9,     5,
       4,     5,     5,     5,     5,     5,     5,     3,     2,     1,
       1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
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






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
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
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
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
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Program: ProgramElementList  */
#line 144 "parser.yacc"
{  
  root = A_Program((yyvsp[0].programElementList));
  (yyval.program) = A_Program((yyvsp[0].programElementList));
}
#line 1438 "y.tab.c"
    break;

  case 3: /* ProgramElementList: ProgramElement ProgramElementList  */
#line 151 "parser.yacc"
{
  (yyval.programElementList) = A_ProgramElementList((yyvsp[-1].programElement), (yyvsp[0].programElementList));
}
#line 1446 "y.tab.c"
    break;

  case 4: /* ProgramElementList: %empty  */
#line 155 "parser.yacc"
{
  (yyval.programElementList) = nullptr;
}
#line 1454 "y.tab.c"
    break;

  case 5: /* ProgramElement: VarDeclStmt  */
#line 161 "parser.yacc"
{
  (yyval.programElement) = A_ProgramVarDeclStmt((yyvsp[0].varDeclStmt)->pos, (yyvsp[0].varDeclStmt));
}
#line 1462 "y.tab.c"
    break;

  case 6: /* ProgramElement: StructDef  */
#line 165 "parser.yacc"
{
  (yyval.programElement) = A_ProgramStructDef((yyvsp[0].structDef)->pos, (yyvsp[0].structDef));
}
#line 1470 "y.tab.c"
    break;

  case 7: /* ProgramElement: FnDeclStmt  */
#line 169 "parser.yacc"
{
  (yyval.programElement) = A_ProgramFnDeclStmt((yyvsp[0].fnDeclStmt)->pos, (yyvsp[0].fnDeclStmt));
}
#line 1478 "y.tab.c"
    break;

  case 8: /* ProgramElement: FnDef  */
#line 173 "parser.yacc"
{
  (yyval.programElement) = A_ProgramFnDef((yyvsp[0].fnDef)->pos, (yyvsp[0].fnDef));
}
#line 1486 "y.tab.c"
    break;

  case 9: /* ProgramElement: SEMICOLON  */
#line 177 "parser.yacc"
{
  (yyval.programElement) = A_ProgramNullStmt((yyvsp[0].pos));
}
#line 1494 "y.tab.c"
    break;

  case 10: /* StructDef: STRUCT ID LBRACE VarDeclList RBRACE  */
#line 183 "parser.yacc"
{
  (yyval.structDef) = A_StructDef((yyvsp[-4].pos), (yyvsp[-3].tokenId)->id, (yyvsp[-1].varDeclList));
}
#line 1502 "y.tab.c"
    break;

  case 11: /* ExprUnit: NUM  */
#line 189 "parser.yacc"
{
  (yyval.exprUnit) = A_NumExprUnit((yyvsp[0].tokenNum)->pos, (yyvsp[0].tokenNum)->num);
}
#line 1510 "y.tab.c"
    break;

  case 12: /* ExprUnit: ID  */
#line 193 "parser.yacc"
{
  (yyval.exprUnit) = A_IdExprUnit((yyvsp[0].tokenId)->pos, (yyvsp[0].tokenId)->id);
}
#line 1518 "y.tab.c"
    break;

  case 13: /* ExprUnit: LP ArithExpr RP  */
#line 197 "parser.yacc"
{
  (yyval.exprUnit) = A_ArithExprUnit((yyvsp[-2].pos), (yyvsp[-1].arithExpr));
}
#line 1526 "y.tab.c"
    break;

  case 14: /* ExprUnit: FnCall  */
#line 201 "parser.yacc"
{
  (yyval.exprUnit) = A_CallExprUnit((yyvsp[0].fnCall)->pos, (yyvsp[0].fnCall));
}
#line 1534 "y.tab.c"
    break;

  case 15: /* ExprUnit: ArrayExpr  */
#line 205 "parser.yacc"
{
  (yyval.exprUnit) = A_ArrayExprUnit((yyvsp[0].arrayExpr)->pos, (yyvsp[0].arrayExpr));
}
#line 1542 "y.tab.c"
    break;

  case 16: /* ExprUnit: LeftVal DOT ID  */
#line 209 "parser.yacc"
{
  (yyval.exprUnit) = A_MemberExprUnit((yyvsp[-2].leftVal)->pos, A_MemberExpr((yyvsp[-2].leftVal)->pos, (yyvsp[-2].leftVal), (yyvsp[0].tokenId)->id));
}
#line 1550 "y.tab.c"
    break;

  case 17: /* ExprUnit: SUB NUM  */
#line 213 "parser.yacc"
{
  (yyval.exprUnit) = A_NumExprUnit((yyvsp[-1].pos), -((yyvsp[0].tokenNum)->num));
}
#line 1558 "y.tab.c"
    break;

  case 18: /* ArithExpr: ArithBiOpExpr  */
#line 219 "parser.yacc"
{
  (yyval.arithExpr) = A_ArithBiOp_Expr((yyvsp[0].arithBiOpExpr)->pos, (yyvsp[0].arithBiOpExpr));
}
#line 1566 "y.tab.c"
    break;

  case 19: /* ArithExpr: ExprUnit  */
#line 223 "parser.yacc"
{
  (yyval.arithExpr) = A_ExprUnit((yyvsp[0].exprUnit)->pos, (yyvsp[0].exprUnit));
}
#line 1574 "y.tab.c"
    break;

  case 20: /* ArithBiOpExpr: ArithExpr ADD ArithExpr  */
#line 229 "parser.yacc"
{
  (yyval.arithBiOpExpr) = A_ArithBiOpExpr((yyvsp[-2].arithExpr)->pos, A_add, (yyvsp[-2].arithExpr), (yyvsp[0].arithExpr));
}
#line 1582 "y.tab.c"
    break;

  case 21: /* ArithBiOpExpr: ArithExpr SUB ArithExpr  */
#line 233 "parser.yacc"
{
  (yyval.arithBiOpExpr) = A_ArithBiOpExpr((yyvsp[-2].arithExpr)->pos, A_sub, (yyvsp[-2].arithExpr), (yyvsp[0].arithExpr));
}
#line 1590 "y.tab.c"
    break;

  case 22: /* ArithBiOpExpr: ArithExpr MUL ArithExpr  */
#line 237 "parser.yacc"
{
  (yyval.arithBiOpExpr) = A_ArithBiOpExpr((yyvsp[-2].arithExpr)->pos, A_mul, (yyvsp[-2].arithExpr), (yyvsp[0].arithExpr));
}
#line 1598 "y.tab.c"
    break;

  case 23: /* ArithBiOpExpr: ArithExpr DIV ArithExpr  */
#line 241 "parser.yacc"
{
  (yyval.arithBiOpExpr) = A_ArithBiOpExpr((yyvsp[-2].arithExpr)->pos, A_div, (yyvsp[-2].arithExpr), (yyvsp[0].arithExpr));
}
#line 1606 "y.tab.c"
    break;

  case 24: /* RightValList: RightVal COMMA RightValList  */
#line 247 "parser.yacc"
{
  (yyval.rightValList) = A_RightValList((yyvsp[-2].rightVal), (yyvsp[0].rightValList));
}
#line 1614 "y.tab.c"
    break;

  case 25: /* RightValList: RightVal  */
#line 251 "parser.yacc"
{
  (yyval.rightValList) = A_RightValList((yyvsp[0].rightVal), nullptr);
}
#line 1622 "y.tab.c"
    break;

  case 26: /* RightValList: %empty  */
#line 255 "parser.yacc"
{
  (yyval.rightValList) = nullptr;
}
#line 1630 "y.tab.c"
    break;

  case 27: /* ArrayExpr: LeftVal LSQUAREBRACKET NUM RSQUAREBRACKET  */
#line 261 "parser.yacc"
{
  (yyval.arrayExpr) = A_ArrayExpr((yyvsp[-3].leftVal)->pos, (yyvsp[-3].leftVal), A_NumIndexExpr((yyvsp[-1].tokenNum)->pos, (yyvsp[-1].tokenNum)->num));
}
#line 1638 "y.tab.c"
    break;

  case 28: /* ArrayExpr: LeftVal LSQUAREBRACKET ID RSQUAREBRACKET  */
#line 265 "parser.yacc"
{
  (yyval.arrayExpr) = A_ArrayExpr((yyvsp[-3].leftVal)->pos, (yyvsp[-3].leftVal), A_IdIndexExpr((yyvsp[-1].tokenId)->pos, (yyvsp[-1].tokenId)->id));
}
#line 1646 "y.tab.c"
    break;

  case 29: /* BoolExpr: BoolExpr AND BoolExpr  */
#line 271 "parser.yacc"
{
  (yyval.boolExpr) = A_BoolBiOp_Expr((yyvsp[-2].boolExpr)->pos, A_BoolBiOpExpr((yyvsp[-2].boolExpr)->pos, A_and, (yyvsp[-2].boolExpr), (yyvsp[0].boolExpr)));
}
#line 1654 "y.tab.c"
    break;

  case 30: /* BoolExpr: BoolExpr OR BoolExpr  */
#line 275 "parser.yacc"
{
  (yyval.boolExpr) = A_BoolBiOp_Expr((yyvsp[-2].boolExpr)->pos, A_BoolBiOpExpr((yyvsp[-2].boolExpr)->pos, A_or, (yyvsp[-2].boolExpr), (yyvsp[0].boolExpr)));
}
#line 1662 "y.tab.c"
    break;

  case 31: /* BoolExpr: BoolUnit  */
#line 279 "parser.yacc"
{
  (yyval.boolExpr) = A_BoolExpr((yyvsp[0].boolUnit)->pos, (yyvsp[0].boolUnit));
}
#line 1670 "y.tab.c"
    break;

  case 32: /* AssignStmt: LeftVal ASSIGNMENT RightVal SEMICOLON  */
#line 285 "parser.yacc"
{
  (yyval.assignStmt) = A_AssignStmt((yyvsp[-3].leftVal)->pos, (yyvsp[-3].leftVal), (yyvsp[-1].rightVal));
}
#line 1678 "y.tab.c"
    break;

  case 33: /* LeftVal: ID  */
#line 291 "parser.yacc"
{
  (yyval.leftVal) = A_IdExprLVal((yyvsp[0].tokenId)->pos, (yyvsp[0].tokenId)->id);
}
#line 1686 "y.tab.c"
    break;

  case 34: /* LeftVal: ArrayExpr  */
#line 295 "parser.yacc"
{
  (yyval.leftVal) = A_ArrExprLVal((yyvsp[0].arrayExpr)->pos, (yyvsp[0].arrayExpr));
}
#line 1694 "y.tab.c"
    break;

  case 35: /* LeftVal: LeftVal DOT ID  */
#line 299 "parser.yacc"
{
  (yyval.leftVal) = A_MemberExprLVal((yyvsp[-2].leftVal)->pos, A_MemberExpr((yyvsp[-2].leftVal)->pos, (yyvsp[-2].leftVal), (yyvsp[0].tokenId)->id));
}
#line 1702 "y.tab.c"
    break;

  case 36: /* RightVal: ArithExpr  */
#line 305 "parser.yacc"
{
  (yyval.rightVal) = A_ArithExprRVal((yyvsp[0].arithExpr)->pos, (yyvsp[0].arithExpr));
}
#line 1710 "y.tab.c"
    break;

  case 37: /* RightVal: BoolExpr  */
#line 309 "parser.yacc"
{
  (yyval.rightVal) = A_BoolExprRVal((yyvsp[0].boolExpr)->pos, (yyvsp[0].boolExpr));
}
#line 1718 "y.tab.c"
    break;

  case 38: /* VarDeclStmt: LET VarDef SEMICOLON  */
#line 315 "parser.yacc"
{
  (yyval.varDeclStmt) = A_VarDefStmt((yyvsp[-2].pos), (yyvsp[-1].varDef));
}
#line 1726 "y.tab.c"
    break;

  case 39: /* VarDeclStmt: LET VarDecl SEMICOLON  */
#line 319 "parser.yacc"
{
  (yyval.varDeclStmt) = A_VarDeclStmt((yyvsp[-2].pos), (yyvsp[-1].varDecl));
}
#line 1734 "y.tab.c"
    break;

  case 40: /* VarDecl: ID COLON TYPE  */
#line 325 "parser.yacc"
{
  (yyval.varDecl) = A_VarDecl_Scalar((yyvsp[-2].tokenId)->pos, A_VarDeclScalar((yyvsp[-2].tokenId)->pos, (yyvsp[-2].tokenId)->id, (yyvsp[0].type)));
}
#line 1742 "y.tab.c"
    break;

  case 41: /* VarDecl: ID LSQUAREBRACKET NUM RSQUAREBRACKET COLON TYPE  */
#line 329 "parser.yacc"
{
  (yyval.varDecl) = A_VarDecl_Array((yyvsp[-5].tokenId)->pos, A_VarDeclArray((yyvsp[-5].tokenId)->pos, (yyvsp[-5].tokenId)->id, (yyvsp[-3].tokenNum)->num, (yyvsp[0].type)));
}
#line 1750 "y.tab.c"
    break;

  case 42: /* VarDecl: ID  */
#line 333 "parser.yacc"
{
  (yyval.varDecl) = A_VarDecl_Scalar((yyvsp[0].tokenId)->pos, A_VarDeclScalar((yyvsp[0].tokenId)->pos, (yyvsp[0].tokenId)->id, NULL));
}
#line 1758 "y.tab.c"
    break;

  case 43: /* VarDecl: ID LSQUAREBRACKET NUM RSQUAREBRACKET  */
#line 337 "parser.yacc"
{
  (yyval.varDecl) = A_VarDecl_Array((yyvsp[-3].tokenId)->pos, A_VarDeclArray((yyvsp[-3].tokenId)->pos, (yyvsp[-3].tokenId)->id, (yyvsp[-1].tokenNum)->num, NULL));
}
#line 1766 "y.tab.c"
    break;

  case 44: /* VarDef: ID COLON TYPE ASSIGNMENT RightVal  */
#line 343 "parser.yacc"
{
  (yyval.varDef) = A_VarDef_Scalar((yyvsp[-4].tokenId)->pos, A_VarDefScalar((yyvsp[-4].tokenId)->pos, (yyvsp[-4].tokenId)->id, (yyvsp[-2].type), (yyvsp[0].rightVal)));
}
#line 1774 "y.tab.c"
    break;

  case 45: /* VarDef: ID ASSIGNMENT RightVal  */
#line 347 "parser.yacc"
{
  (yyval.varDef) = A_VarDef_Scalar((yyvsp[-2].tokenId)->pos, A_VarDefScalar((yyvsp[-2].tokenId)->pos, (yyvsp[-2].tokenId)->id, NULL, (yyvsp[0].rightVal)));
}
#line 1782 "y.tab.c"
    break;

  case 46: /* VarDef: ID LSQUAREBRACKET NUM RSQUAREBRACKET COLON TYPE ASSIGNMENT LBRACE RightValList RBRACE  */
#line 351 "parser.yacc"
{
  (yyval.varDef) = A_VarDef_Array((yyvsp[-9].tokenId)->pos, A_VarDefArray((yyvsp[-9].tokenId)->pos, (yyvsp[-9].tokenId)->id, (yyvsp[-7].tokenNum)->num, (yyvsp[-4].type), (yyvsp[-1].rightValList)));
}
#line 1790 "y.tab.c"
    break;

  case 47: /* VarDef: ID LSQUAREBRACKET NUM RSQUAREBRACKET ASSIGNMENT LBRACE RightValList RBRACE  */
#line 355 "parser.yacc"
{
  (yyval.varDef) = A_VarDef_Array((yyvsp[-7].tokenId)->pos, A_VarDefArray((yyvsp[-7].tokenId)->pos, (yyvsp[-7].tokenId)->id, (yyvsp[-5].tokenNum)->num, NULL, (yyvsp[-1].rightValList)));
}
#line 1798 "y.tab.c"
    break;

  case 48: /* VarDeclList: VarDecl COMMA VarDeclList  */
#line 361 "parser.yacc"
{
  (yyval.varDeclList) = A_VarDeclList((yyvsp[-2].varDecl), (yyvsp[0].varDeclList));
}
#line 1806 "y.tab.c"
    break;

  case 49: /* VarDeclList: VarDecl  */
#line 365 "parser.yacc"
{
  (yyval.varDeclList) = A_VarDeclList((yyvsp[0].varDecl), nullptr);
}
#line 1814 "y.tab.c"
    break;

  case 50: /* VarDeclList: %empty  */
#line 369 "parser.yacc"
{
  (yyval.varDeclList) = nullptr;
}
#line 1822 "y.tab.c"
    break;

  case 51: /* FnDeclStmt: FnDecl SEMICOLON  */
#line 375 "parser.yacc"
{
  (yyval.fnDeclStmt) = A_FnDeclStmt((yyvsp[-1].fnDecl)->pos, (yyvsp[-1].fnDecl));
}
#line 1830 "y.tab.c"
    break;

  case 52: /* FnDecl: FN ID LP ParamDecl RP  */
#line 381 "parser.yacc"
{
  (yyval.fnDecl) = A_FnDecl((yyvsp[-4].pos), (yyvsp[-3].tokenId)->id, (yyvsp[-1].paramDecl), NULL);
}
#line 1838 "y.tab.c"
    break;

  case 53: /* FnDecl: FN ID LP ParamDecl RP RARROW TYPE  */
#line 385 "parser.yacc"
{
  (yyval.fnDecl) = A_FnDecl((yyvsp[-6].pos), (yyvsp[-5].tokenId)->id, (yyvsp[-3].paramDecl), (yyvsp[0].type));
}
#line 1846 "y.tab.c"
    break;

  case 54: /* ParamDecl: VarDeclList  */
#line 391 "parser.yacc"
{
  (yyval.paramDecl) = A_ParamDecl((yyvsp[0].varDeclList));
}
#line 1854 "y.tab.c"
    break;

  case 55: /* FnDef: FnDecl LBRACE CodeBlockStmtList RBRACE  */
#line 397 "parser.yacc"
{
  (yyval.fnDef) = A_FnDef((yyvsp[-3].fnDecl)->pos, (yyvsp[-3].fnDecl), (yyvsp[-1].codeBlockStmtList));
}
#line 1862 "y.tab.c"
    break;

  case 56: /* CodeBlockStmtList: CodeBlockStmt  */
#line 403 "parser.yacc"
{
  (yyval.codeBlockStmtList) = A_CodeBlockStmtList((yyvsp[0].codeBlockStmt), nullptr);
}
#line 1870 "y.tab.c"
    break;

  case 57: /* CodeBlockStmtList: CodeBlockStmt CodeBlockStmtList  */
#line 407 "parser.yacc"
{
  (yyval.codeBlockStmtList) = A_CodeBlockStmtList((yyvsp[-1].codeBlockStmt), (yyvsp[0].codeBlockStmtList));
}
#line 1878 "y.tab.c"
    break;

  case 58: /* CodeBlockStmt: VarDeclStmt  */
#line 413 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockVarDeclStmt((yyvsp[0].varDeclStmt)->pos, (yyvsp[0].varDeclStmt));
}
#line 1886 "y.tab.c"
    break;

  case 59: /* CodeBlockStmt: AssignStmt  */
#line 417 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockAssignStmt((yyvsp[0].assignStmt)->pos, (yyvsp[0].assignStmt));
}
#line 1894 "y.tab.c"
    break;

  case 60: /* CodeBlockStmt: CallStmt  */
#line 421 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockCallStmt((yyvsp[0].callStmt)->pos, (yyvsp[0].callStmt));
}
#line 1902 "y.tab.c"
    break;

  case 61: /* CodeBlockStmt: IfStmt  */
#line 425 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockIfStmt((yyvsp[0].ifStmt)->pos, (yyvsp[0].ifStmt));
}
#line 1910 "y.tab.c"
    break;

  case 62: /* CodeBlockStmt: WhileStmt  */
#line 429 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockWhileStmt((yyvsp[0].whileStmt)->pos, (yyvsp[0].whileStmt));
}
#line 1918 "y.tab.c"
    break;

  case 63: /* CodeBlockStmt: ReturnStmt  */
#line 433 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockReturnStmt((yyvsp[0].returnStmt)->pos, (yyvsp[0].returnStmt));
}
#line 1926 "y.tab.c"
    break;

  case 64: /* CodeBlockStmt: CONTINUE SEMICOLON  */
#line 437 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockContinueStmt((yyvsp[-1].pos));
}
#line 1934 "y.tab.c"
    break;

  case 65: /* CodeBlockStmt: BREAK SEMICOLON  */
#line 441 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockBreakStmt((yyvsp[-1].pos));
}
#line 1942 "y.tab.c"
    break;

  case 66: /* CodeBlockStmt: SEMICOLON  */
#line 445 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockNullStmt((yyvsp[0].pos));
}
#line 1950 "y.tab.c"
    break;

  case 67: /* ReturnStmt: RET RightVal SEMICOLON  */
#line 451 "parser.yacc"
{
  (yyval.returnStmt) = A_ReturnStmt((yyvsp[-2].pos), (yyvsp[-1].rightVal));
}
#line 1958 "y.tab.c"
    break;

  case 68: /* ReturnStmt: RET SEMICOLON  */
#line 455 "parser.yacc"
{
  (yyval.returnStmt) = A_ReturnStmt((yyvsp[-1].pos), nullptr);
}
#line 1966 "y.tab.c"
    break;

  case 69: /* CallStmt: FnCall SEMICOLON  */
#line 461 "parser.yacc"
{
  (yyval.callStmt) = A_CallStmt((yyvsp[-1].fnCall)->pos, (yyvsp[-1].fnCall));
}
#line 1974 "y.tab.c"
    break;

  case 70: /* BoolUnit_: LP ExprUnit LT ExprUnit RP  */
#line 467 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-3].exprUnit)->pos, A_ComExpr((yyvsp[-3].exprUnit)->pos, A_lt, (yyvsp[-3].exprUnit), (yyvsp[-1].exprUnit)));
}
#line 1982 "y.tab.c"
    break;

  case 71: /* BoolUnit_: LP ExprUnit LE ExprUnit RP  */
#line 471 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-3].exprUnit)->pos, A_ComExpr((yyvsp[-3].exprUnit)->pos, A_le, (yyvsp[-3].exprUnit), (yyvsp[-1].exprUnit)));
}
#line 1990 "y.tab.c"
    break;

  case 72: /* BoolUnit_: LP ExprUnit GT ExprUnit RP  */
#line 475 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-3].exprUnit)->pos, A_ComExpr((yyvsp[-3].exprUnit)->pos, A_gt, (yyvsp[-3].exprUnit), (yyvsp[-1].exprUnit)));
}
#line 1998 "y.tab.c"
    break;

  case 73: /* BoolUnit_: LP ExprUnit GE ExprUnit RP  */
#line 479 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-3].exprUnit)->pos, A_ComExpr((yyvsp[-3].exprUnit)->pos, A_ge, (yyvsp[-3].exprUnit), (yyvsp[-1].exprUnit)));
}
#line 2006 "y.tab.c"
    break;

  case 74: /* BoolUnit_: LP ExprUnit EQ ExprUnit RP  */
#line 483 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-3].exprUnit)->pos, A_ComExpr((yyvsp[-3].exprUnit)->pos, A_eq, (yyvsp[-3].exprUnit), (yyvsp[-1].exprUnit)));
}
#line 2014 "y.tab.c"
    break;

  case 75: /* BoolUnit_: LP ExprUnit NE ExprUnit RP  */
#line 487 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-3].exprUnit)->pos, A_ComExpr((yyvsp[-3].exprUnit)->pos, A_ne, (yyvsp[-3].exprUnit), (yyvsp[-1].exprUnit)));
}
#line 2022 "y.tab.c"
    break;

  case 76: /* BoolUnit_: LP BoolExpr RP  */
#line 491 "parser.yacc"
{
  (yyval.boolUnit) = A_BoolExprUnit((yyvsp[-2].pos), (yyvsp[-1].boolExpr));
}
#line 2030 "y.tab.c"
    break;

  case 77: /* IfStmt: IF BoolUnit_ LBRACE CodeBlockStmtList RBRACE  */
#line 497 "parser.yacc"
{
  (yyval.ifStmt) = A_IfStmt((yyvsp[-4].pos), (yyvsp[-3].boolUnit), (yyvsp[-1].codeBlockStmtList), nullptr);
}
#line 2038 "y.tab.c"
    break;

  case 78: /* IfStmt: IF BoolUnit_ LBRACE CodeBlockStmtList RBRACE ELSE LBRACE CodeBlockStmtList RBRACE  */
#line 501 "parser.yacc"
{
  (yyval.ifStmt) = A_IfStmt((yyvsp[-8].pos), (yyvsp[-7].boolUnit), (yyvsp[-5].codeBlockStmtList), (yyvsp[-1].codeBlockStmtList));
}
#line 2046 "y.tab.c"
    break;

  case 79: /* WhileStmt: WHILE BoolUnit_ LBRACE CodeBlockStmtList RBRACE  */
#line 507 "parser.yacc"
{
  (yyval.whileStmt) = A_WhileStmt((yyvsp[-4].pos), (yyvsp[-3].boolUnit), (yyvsp[-1].codeBlockStmtList));
}
#line 2054 "y.tab.c"
    break;

  case 80: /* FnCall: ID LP RightValList RP  */
#line 513 "parser.yacc"
{
  (yyval.fnCall) = A_FnCall((yyvsp[-3].tokenId)->pos, (yyvsp[-3].tokenId)->id, (yyvsp[-1].rightValList));
}
#line 2062 "y.tab.c"
    break;

  case 81: /* BoolUnit: LP ExprUnit LT ExprUnit RP  */
#line 519 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-3].exprUnit)->pos, A_ComExpr((yyvsp[-3].exprUnit)->pos, A_lt, (yyvsp[-3].exprUnit), (yyvsp[-1].exprUnit)));
}
#line 2070 "y.tab.c"
    break;

  case 82: /* BoolUnit: LP ExprUnit LE ExprUnit RP  */
#line 523 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-3].exprUnit)->pos, A_ComExpr((yyvsp[-3].exprUnit)->pos, A_le, (yyvsp[-3].exprUnit), (yyvsp[-1].exprUnit)));
}
#line 2078 "y.tab.c"
    break;

  case 83: /* BoolUnit: LP ExprUnit GT ExprUnit RP  */
#line 527 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-3].exprUnit)->pos, A_ComExpr((yyvsp[-3].exprUnit)->pos, A_gt, (yyvsp[-3].exprUnit), (yyvsp[-1].exprUnit)));
}
#line 2086 "y.tab.c"
    break;

  case 84: /* BoolUnit: LP ExprUnit GE ExprUnit RP  */
#line 531 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-3].exprUnit)->pos, A_ComExpr((yyvsp[-3].exprUnit)->pos, A_ge, (yyvsp[-3].exprUnit), (yyvsp[-1].exprUnit)));
}
#line 2094 "y.tab.c"
    break;

  case 85: /* BoolUnit: LP ExprUnit EQ ExprUnit RP  */
#line 535 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-3].exprUnit)->pos, A_ComExpr((yyvsp[-3].exprUnit)->pos, A_eq, (yyvsp[-3].exprUnit), (yyvsp[-1].exprUnit)));
}
#line 2102 "y.tab.c"
    break;

  case 86: /* BoolUnit: LP ExprUnit NE ExprUnit RP  */
#line 539 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-3].exprUnit)->pos, A_ComExpr((yyvsp[-3].exprUnit)->pos, A_ne, (yyvsp[-3].exprUnit), (yyvsp[-1].exprUnit)));
}
#line 2110 "y.tab.c"
    break;

  case 87: /* BoolUnit: LP BoolExpr RP  */
#line 543 "parser.yacc"
{
  (yyval.boolUnit) = A_BoolExprUnit((yyvsp[-2].pos), (yyvsp[-1].boolExpr));
}
#line 2118 "y.tab.c"
    break;

  case 88: /* BoolUnit: NOT BoolUnit  */
#line 547 "parser.yacc"
{
  (yyval.boolUnit) = A_BoolUOpExprUnit((yyvsp[-1].pos), A_BoolUOpExpr((yyvsp[-1].pos), A_not, (yyvsp[0].boolUnit)));
}
#line 2126 "y.tab.c"
    break;

  case 89: /* TYPE: INT  */
#line 553 "parser.yacc"
{
  (yyval.type) = A_NativeType((yyvsp[0].pos), A_intTypeKind);
}
#line 2134 "y.tab.c"
    break;

  case 90: /* TYPE: ID  */
#line 557 "parser.yacc"
{
  (yyval.type) = A_StructType((yyvsp[0].tokenId)->pos, (yyvsp[0].tokenId)->id);
}
#line 2142 "y.tab.c"
    break;


#line 2146 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
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

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
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
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
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
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 563 "parser.yacc"


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


