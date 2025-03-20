%{
#include "lex.h"
#include "fdnparse.h"

#define DO_RETURN(a) { return (a); }
//#define DO_RETURN(a) { return Return(a); }

int Return(int val);

%}

%option interactive
%option noyywrap
%option noinput
%option nounput
%option yylineno

%%
[\t\n ]+                    ;
"//".*"\n"                  ;

.                           DO_RETURN(JUNK_TOKEN);
%%

// This function allows us to do extra processing on each token
// It is used to generate lexer debug info
int Return(int val)
{
    printf("Scanned '%s': %d\n", yytext, val);
    return val;
}
