%{
#include <stdio.h>

int li = 0; // Line count
int ch = 0; // Character count
int w = 0;  // Word count
%}

%%

[a-zA-Z0-9]+ { ch += yyleng; }    // Match alphanumeric strings and count their length as characters
[ \t]+       { /* Ignore spaces and tabs, handled in word counting */ }
\n           { li++; w++; ch++; }  // Newline increments line count and counts the end of a word
.            { ch++; }             // Count any other character

%%

int main() {
    yyin = fopen("input.txt", "r");  // Open the file for reading
    if (!yyin) {
        perror("Failed to open file");
        return 1;
    }
    yylex();  // Run the lexer to process the file

    printf("Number of characters: %d\n", ch);
    printf("Number of words: %d\n", w);
    printf("Number of lines: %d\n", li);

    fclose(yyin);  // Close the file after processing
    return 0;
}

int yywrap() {
    return 1;
}

