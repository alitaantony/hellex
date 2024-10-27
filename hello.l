%{
int li = 0;
int ch = 0;
int w = 0;
%}
%%
[a-zA-Z0-9]+ { ch += yyleng; w++; } // Count alphanumeric characters and words
\n { li++; }
%% 
int main() {
    FILE *yyin = fopen("input.txt", "r");
    yylex(); 
    printf("The number of characters: %d, words: %d, lines: %d\n", ch, w, li);
    fclose(yyin);
    return 0;
}
int yywrap() {
    return 1;
}

