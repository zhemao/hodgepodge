#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "saferead.h"

int main(int argc, char *argv[]){
	FILE *f;
	char c;
	char * buf;
	int x=0;
	if(argc<2)
		f = stdin;
	else f = fopen(argv[1], "r");
	buf = saferead(f);
	if(argc<3)
		f = stdout;
	else f = fopen(argv[2], "w");
	while((c=buf[x])!=0){
		if(!(c=='\n'||c==' '||c=='\t'))
			fputc((int)c, f);
		x++;
	}
	fclose(f);
	free(buf);
	return 0;
}

