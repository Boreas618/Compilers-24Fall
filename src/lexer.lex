%{
#include <stdio.h>
#include <string.h>
#include "teapl_ast.h"
#include "y.tab.h"
extern int line, col;
int c;
int calc(const char *s, int len);
%}

%start COMMENT1 COMMENT2

%%
<INITIAL>"\t" { col+=4; }

<INITIAL>[1-9][0-9]* {
    yylval.tokenNum = A_TokenNum(A_Pos(line, col), calc(yytext, yyleng));
    col+=yyleng;
    return NUM;
}

<INITIAL>0 {
    yylval.tokenNum = A_TokenNum(A_Pos(line, col), 0);
    ++col;
    return NUM;
}

<INITIAL>"+" { 
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return ADD; 
}

<INITIAL>"-" { 
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return SUB; 
}

<INITIAL>"*" { 
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return MUL; 
}

<INITIAL>"/" { 
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return DIV; 
}

<INITIAL>";" {
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return SEMICOLON;
}

<INITIAL>"let" {
    yylval.pos = A_Pos(line, col); 
    col += 3; 
    return LET;
}

<INITIAL>":" {
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return COLON;
}

<INITIAL>"=" {
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return ASSIGNMENT;
}

<INITIAL>"fn" {
    yylval.pos = A_Pos(line, col); 
    col += 2; 
    return FN;
}

<INITIAL>"{" {
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return LBRACE;
}

<INITIAL>"}" {
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return RBRACE;
}

<INITIAL>"->" {
    yylval.pos = A_Pos(line, col); 
    col += 2; 
    return RARROW;
}

<INITIAL>"[" {
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return LSQUAREBRACKET;
}

<INITIAL>"]" {
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return RSQUAREBRACKET;
}

<INITIAL>"." {
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return DOT;
}

<INITIAL>"(" {
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return LP;
}

<INITIAL>")" {
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return RP;
}

<INITIAL>"," {
    yylval.pos = A_Pos(line, col); 
    ++col; 
    return COMMA;
}

<INITIAL>"break" {
    yylval.pos = A_Pos(line, col); 
    col += 5; 
    return BREAK;
}

<INITIAL>"continue" {
    yylval.pos = A_Pos(line, col); 
    col += 8; 
    return CONTINUE;
}

<INITIAL>"ret" {
    yylval.pos = A_Pos(line, col); 
    col += 3; 
    return RET;
}

<INITIAL>"if" {
    yylval.pos = A_Pos(line, col); 
    col += 2; 
    return IF;
}

<INITIAL>"else" {
    yylval.pos = A_Pos(line, col); 
    col += 4; 
    return ELSE;
}

<INITIAL>"while" {
    yylval.pos = A_Pos(line, col); 
    col += 5; 
    return WHILE;
}

<INITIAL>"&&" {
    yylval.pos = A_Pos(line, col); 
    col += 2; 
    return AND;
}

<INITIAL>"||" {
    yylval.pos = A_Pos(line, col); 
    col += 2; 
    return OR;
}

<INITIAL>"!" {
    yylval.pos = A_Pos(line, col); 
    col += 1; 
    return NOT;
}

<INITIAL>"==" {
    yylval.pos = A_Pos(line, col); 
    col += 2; 
    return EQ;
}

<INITIAL>"!=" {
    yylval.pos = A_Pos(line, col); 
    col += 2; 
    return NE;
}

<INITIAL>"<" {
    yylval.pos = A_Pos(line, col); 
    col += 1; 
    return LT;
}

<INITIAL>">" {
    yylval.pos = A_Pos(line, col); 
    col += 1; 
    return GT;
}

<INITIAL>">=" {
    yylval.pos = A_Pos(line, col); 
    col += 2; 
    return GE;
}

<INITIAL>"<=" {
    yylval.pos = A_Pos(line, col); 
    col += 2; 
    return LE;
}

<INITIAL>"struct" {
    yylval.pos = A_Pos(line, col); 
    col += 6; 
    return STRUCT;
}

<INITIAL>"int" {
    yylval.pos = A_Pos(line, col); 
    col += 3; 
    return INT;
}

<INITIAL>[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.tokenId = A_TokenId(A_Pos(line, col), strdup(yytext));
    col += yyleng;
    return ID;
}

<INITIAL>" " { 
    ++col; 
}

<INITIAL>"\n" { 
    ++line; 
    col = 1; 
}

<COMMENT1>"\n" { 
    ++line; 
    col = 1; 
    BEGIN INITIAL; 
}

<COMMENT2>"\n" { 
    ++line; 
    col = 1; 
}

<INITIAL>"//" { 
    col += 2; 
    BEGIN COMMENT1; 
}

<INITIAL>"/\*" { 
    col += 2; 
    BEGIN COMMENT2;
}

<COMMENT2>"\*/" { 
    col += 2; 
    BEGIN INITIAL; 
}

<COMMENT1>. { 
    ++col; 
}

<COMMENT2>. { 
    ++col; 
}

<INITIAL>. {
}

%%

// This function takes a string of digits and its length as input, and returns the integer value of the string.
int calc(const char *s, int len) {
    int ret = 0;
    for(int i = 0; i < len; i++)
        ret = ret * 10 + (s[i] - '0');
    return ret;
}