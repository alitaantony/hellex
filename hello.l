%{
#include <stdio.h>

int li = 0; // Line counter
int ch = 0; // Character counter
int w = 0;  // Word counter
%}

%%
[a-zA-Z0-9]+ { ch += yyleng; w++; }  // Count alphanumeric characters and words
[ \t]+      { /* Ignore whitespace */ } // Ignore spaces and tabs
\n          { li++; }                  // Count each newline
.           { ch++; }                  // Count any other character
%% 

int main() {
    FILE *yyin = fopen("input.txt", "r"); // Open input file
    if (!yyin) {
        perror("Error opening file");
        return 1;
    }
    
    yylex(); // Run the lexical analyzer
    printf("The number of characters: %d, number of words: %d, number of lines: %d\n", ch, w, li);
    fclose(yyin); // Close the file
    return 0;
}

int yywrap() {
    return 1; // Indicates end of input
}

