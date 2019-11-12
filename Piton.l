%option noyywrap
%option yylineno
/* Analizador para un lenguaje al estilo de Piton */

%{
/* se necesita esto para la llamada a atof() mas abajo */
#include <math.h>
int contError= 0;
%}


DIGITO   [0-9]
LETRAS   [a-zA-Z]
ID       [a-zA-Z]({LETRAS}|{DIGITO}|"_")*

%%

-?{DIGITO}+   { fprintf(yyout,  "Un entero: %s (%d)\n", yytext, atoi( yytext ) );}

-?{DIGITO}+","{DIGITO}*      {  fprintf(yyout, "Un real: %s (%g)\n", yytext, atof( yytext ) );}

"Iniciar"|"iniciar"      {  fprintf(yyout, "Una palabra reservada para inicio : %s\n", yytext );}

"Terminar"|"terminar"  {  fprintf(yyout, "Una palabra reservada para  fin de programa : %s\n", yytext ); return 0;}

"Entero"|"entero" {  fprintf(yyout, "Una palabra reservada para definir tipo variable Entero : %s\n", yytext );}

"Cadena"|"cadena" {  fprintf(yyout, "Una palabra reservada para definir tipo variable Cadena : %s\n", yytext );}

"Booleano"|"booleano" {  fprintf(yyout, "Una palabra reservada para definir tipo variable Booleano : %s\n", yytext );}

"Lista"|"lista" {  fprintf(yyout, "Una palabra reservada para definir tipo variable Lista : %s\n", yytext );}

"Tupla"|"tupla" {  fprintf(yyout, "Una palabra reservada para definir tipo variable Tupla : %s\n", yytext );}

"Diccionario"|"diccionario" {  fprintf(yyout, "Una palabra reservada para definir tipo variable Lista : %s\n", yytext );}

"Leer"|"leer"  {  fprintf(yyout, "Una palabra reservada de entrada : %s\n", yytext );}

"Escribir"|"escribir"|"Imprimir"|"imprimir" {  fprintf(yyout, "Una palabra reservada de salida : %s\n", yytext );}

"Si"|"Sino"|"Fin Si"|"Segun"|"Caso"|"Fin Segun" {  fprintf(yyout, "Una palabra reservada para de decisión o condicionales : %s\n", yytext );}

"Para"|"Mientras"|"Fin Mientras"|"Fin Para"|"Hasta Que"|"Desde"|"Repetir" {  fprintf(yyout, "Una palabra reservada para ciclos: %s\n", yytext );}

"And"|"and"|"Or"|"or"|"Not"|"not"  { fprintf(yyout, "Un operador logico: %s\n", yytext ); }

{ID}       { fprintf(yyout, "Un identificador: %s\n", yytext ); }

"+"|"-"|"*"|"/"|"//"|"**"|"%"  { fprintf(yyout, "Un operador : %s\n", yytext ); }

"=="|"!="|"<"|">"|"<="|">=" { fprintf(yyout, "Una asignacion : %s\n", yytext ); }

"#" { fprintf(yyout, "Un comentario : %s\n", yytext ); }

"("|")"|"["|"]"|"{"|","|":"|"."|"`"|"="|";"|"+="|"-="|"*="|"/="|"//="|"%="|"&="|"^="|">>="|"<<="|"**="   { fprintf(yyout, "Es un delimitador de programa %s\n", yytext ); }

";" { fprintf(yyout, "Un separador : %s\n", yytext ); }

"/*"|"*/" { fprintf(yyout, "Inicia un comentario : %s\n", yytext ); }

"*/" { fprintf(yyout, "Termina un comentario : %s\n", yytext ); }

"{"[^}\n]*"}"     /* se come una linea de comentarios */

[ \t\n]+          /* se come los espacios en blanco */

.                 { fprintf(yyout,  "Caracter no reconocido: %s\n", yytext ); }

%%

main( )
    {
    printf("Analizador para algunos elementos de un lenguaje al estilo de Piton en castellano\n\n");
    yyin = fopen( "prog.pas", "r" );
    yylex();
    printf("Presiones una tecla para terminar...");
    getchar();
 }
