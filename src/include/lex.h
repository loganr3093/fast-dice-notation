#pragma once
//*************************************
// lex.h
//
// Defines global symbols used the the flex generated lexer 
//
// Author: Logan Rivera
//
// Date: Mar. 10, 2025
//

int yyparse();                          // parsing function
int yylex();                            // scanning function
extern char* yytext;                    // text of current token
extern int yylineno;                    // line number of input file
extern int yynerrs;                     // Num of compile errors
