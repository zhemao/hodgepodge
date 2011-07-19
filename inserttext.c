#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "saferead.h"

int main(int argc, char *argv[]){
	FILE * f1, * f2;
	char * str1, * str2, * tok;
	int line = 1;
	int target;
	if(argc < 3){
		printf("Usage: %s dest lineno [src]\n", argv[0]);
		exit(1);
	}
	f1 = fopen(argv[1], "r");
	target = atoi(argv[2]);
	if(argc > 3)
		f2 = fopen(argv[3], "r");
	else f2 = stdin;
	str1 = saferead(f1);
	str2 = saferead(f2);
	fclose(f1);
	f1 = fopen(argv[1], "w");
	
	tok = strtok(str1, "\n");
	while(tok){
		if(line==target){
			fwrite(str2, sizeof(char), strlen(str2), f1);
		}
		fprintf(f1, "%s\n", tok);
		line++;
		tok = strtok(NULL, "\n");
	}
	free(str1);
	free(str2);
	fclose(f1);
	if(f2!=stdin)
		fclose(f2);
	return 0;
}
