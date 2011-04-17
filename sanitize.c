#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "saferead.h"

int isascii(int c){
	if(c>127) return 0;
	if(c=='\n'||c=='\t'||c=='\r')
		return 1;
	return c>31;
	
}

int main(int argc, char *argv[]){
	FILE *f;
	int c;
	int x=0;
	char * buf;
	if(argc<2)
		f = stdin;
	else f = fopen(argv[1], "r");
	buf = saferead(f);
	if(argc<3)
		f = stdout;
	else f = fopen(argv[2], "w");
	while((c=buf[x])!=0){
		if(isascii(c))
			fputc((int)c, f);
		x++;
	}
	fclose(f);
	free(buf);
	return 0;
}

