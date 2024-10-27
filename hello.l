%{
int li = 0; // Line counter
int ch = 0; // Character counter
int w = 0;  // Word counter
%}

%%
[a-zA-Z0-9] { ch++; }          // Count each alphanumeric character
" "        { w++; }            // Count each space as a word delimiter
"\n"       { li++; w++; }      // Count each newline as a new line and word delimiter
%%

int main() {
    yyin = fopen("input.txt", "r");  // Open input file
    yylex();                         // Run the lexical analyzer
    printf("The number of characters: %d, number of words: %d, number of lines: %d\n", ch, w, li);
    return 0;
}

int yywrap() {
    return 1;  // Indicates end of input
}

