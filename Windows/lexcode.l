%{
#include <stdlib.h>
void yyerror(char *);
#include "helper.h"
#include "yacccode.tab.h"

%}

%%

"nossoIF" 		return IF;
"nossoElse"				return ELSE;
"nossoWhile"			return WHILE;

"lerEntrada"        return READ;
"printSaida"     return PRINT;

"nossoInt"         return VARINTEGER;
"nossoFloat"           return VARFLOAT;

">="                return MAIORIGUAL;
"<="                return MENORIGUAL;
"=?="               return IGUAL;
"=/="               return DIFERENTE;

[a-z]               {yylval.varname = *yytext; return VARIABLE;}

[0-9]+              {yylval.iValue = atoi(yytext); return INTEGER;}
[0-9]+\.[0-9]+      {yylval.fValue = atof(yytext); return FLOAT;}
\".*\"              {yylval.sValue = create_string(yytext, strlen(yytext)); return STRING;}

[-+()=./*><\n]       {return *yytext;}

"["					{return *yytext;}
"]"					{return *yytext;}

[ \t\n]               ; /* ignorar espacos em branco */

%%

int yywrap(void) {
 return 1;
}

char *create_string(char *s, int l) {
	char *out = (char *)malloc(sizeof(char) * l);
    s[l-1]= '\0';
	strcpy(out, s+1);
	return(out);
}