%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+  {
		yylval.integer=atoi(yytext);
		return NUMBER;
		}
[0-9]*\.[0-9]+ {
		yylval.real=(float)atof(yytext); 
		return FLOAT;
		}
Enter   {return Enter;}
to { return to;}
find   {return find;}

of   {return of;}
area		{return area;}
circle		{return circle;}
square	{return square;}
rectangle {return rectangle;}
sphere    {return sphere;}

radius		{return radius;}
length      {return length;}


and			{return and;}
height	    {return height;}
volume      {return volume;}

breadth { return breadth;}
length	{return length;}
[\n]	{return yytext;}
[/t]	;
%%
int yywrap(){return 1;}	