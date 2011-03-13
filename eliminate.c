#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void eliminate(char *fname){
	FILE * in = fopen(fname, "r");
	char pref[100] = "min-";
	fname = strcat(pref, fname);
	FILE * out = fopen(fname, "w");
	char c = fgetc(in);
	while(c!=EOF){
		if(!(c=='\n'||c==' '||c=='\t'))
			fputc((int)c, out);
		c = fgetc(in);
	}
	fclose(in);
	fclose(out);
}

int main(int argc, char *argv[]){
	int x;
	printf("starting\n");
	for(x=1;x<argc;x++){
		char str[100];
		strcpy(str, argv[x]);
		printf("eliminating %s\n", str);
		eliminate(str);
	}
}

