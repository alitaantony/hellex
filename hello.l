%{
int li = 0;
int ch = 0;
int w = 0;
%}

%%
[a-zA-Z0-9] {ch++;}
" " {w++;}
"\n" {li++; w++;}
%%

int main()
{
yyin = fopen("input.txt","r");
yylex();
printf("The no of lines : %d, words : %d, characters : %d",li,w,ch);
return 0;
}

int yywrap()
{
return 1;
}
