#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]){
  FILE *in, *out;
  char c;
  if(argc>1){
    in = fopen(argv[1], "r");
    if(argc>2){
      out = fopen(argv[2], "w");
    }
    else{
      out = stdout;
    }
  }
  else{
    in = stdin;
    out = stdout;
  }
  c = fgetc(in);
  while(c!=EOF){
    if(!(c=='\n'||c==' '||c=='\t'))
      fputc((int)c, out);
    c = fgetc(in);
  }
}

