%{
#include<stdio.h> 
#include<math.h>
extern FILE *yyin;
#define PI 3.14
#define CONST 1.33
#define CONST1 0.33
%} 
%union{
int integer;
float real;
}
%token <integer> NUMBER <real>	FLOAT
%token Enter to find area volume of circle square sphere radius length height breadth and  rectangle
%type <real> A B C D E F 
%%
//ResultExpression:A{printf("Your Answer is %f",$$);};
A: Enter B{$$=$2;};
B: radius of C 			{$$=$3;}
   |length of D             {$$=$3;}
   |length and E          {$$=$3;}
   |length F			  {$$=$2;}
   ;
C: circle to find area NUMBER   {$$=PI*$5*$5;printf("Area of circle having radius %d is %f\n",$5,$$);}
  |sphere to find volume NUMBER  {$$=CONST*PI*$5*$5*$5;printf("Volume of sphere having radius %d is %f\n",$5,$$);}
  ;
D: square to find area NUMBER   {$$=$5*$5;printf("Area of square having length %d is %f\n",$5,$$);}
  |square to find volume NUMBER {$$=$5*$5*$5;printf("Volume of square having length %d is %f\n",$5,$$);}      
   ;
E: breadth of rectangle to find volume NUMBER NUMBER NUMBER  {$$=$7*$8*$9; printf("Volume of rectangle having radius %d and height %d  %d is %f\n",$7,$8,$9,$$);}
   | breadth of rectangle to find area NUMBER NUMBER	{$$=$7*$8; printf("Area of rectangle having radius %d and height %d is %f\n",$7,$8,$$);}

F: height and E {$$=$3;}
																	
%%
void yyerror(char *s){}
int main(int argc, char *argv[]) 
{
yyin=fopen(argv[1],"r");
int i;
for(i=1;i<=6;i++){
yyparse();
}
fclose(yyin);
return 0;
}