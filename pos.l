%{
int ne = 0;
int po = 0;
%}
%%
[-][0-9]+ { ne++; printf("negative number = %s\n", yytext); }
[0-9]+ { po++; printf("the positive number = %s\n", yytext); }
end { printf("number of positive numbers = %d, number of negative numbers = %d\n", po, ne); }
%%
int main() {
    printf("enter the number");
    yylex();
    return 0;
}
int yywrap() {
    return 0;
}
