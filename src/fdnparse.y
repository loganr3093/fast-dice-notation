%{
#include <iostream>
#include "lex.h"

%}

%locations

%union
{
}

%{
    int yyerror(const char *msg);
%}

%start  program

%token JUNK_TOKEN

%%

program:                { }

%%

// Function to format error messages
int yyerror(const char *msg)
{
    std::cerr << "ERROR: " << msg << " at symbol "
        << yytext << " on line " << yylineno << "\n";

    return 0;
}
