%{
int li = 0;
int ch = 0;
int w = 0;
%}

%%

[a-zA-Z0-9] { ch++; }
" " { w++; }
"\n" { li++; w++; }

%%

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    printf("The number of characters: %d, number of words: %d, number of lines: %d\n", ch, w, li);
    return 0;
}

int yywrap() {
    return 1;
}
