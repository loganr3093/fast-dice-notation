#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include "lex.h"
#include "fdnparse.h"

int main()
{
    int result = yyparse();

    return result;
}
