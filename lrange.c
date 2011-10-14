#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "saferead.h"

int main(int argc, char *argv[]){
	FILE * infile, * outfile;
	int start;
	int end;
	char * text, * line;
	int lineno = 1;

	if(argc < 3){
		printf("Usage: %s pos1 pos2 [infile] [outfile]\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	start = atoi(argv[1]);
	end = atoi(argv[2]);

	if(argc > 3){
		infile = fopen(argv[3], "r");
		if(infile == NULL){
			fprintf(stderr, "Could not open %s\n", argv[3]);
			exit(EXIT_FAILURE);
		}
	} else infile = stdin;

	if(argc > 4){
		outfile = fopen(argv[4], "w");
		if(outfile == NULL){
			fprintf(stderr, "Could not open %s\n", argv[4]);
			exit(EXIT_FAILURE);
		}
	} else outfile = stdout;

	text = saferead(infile);
	line = strtok(text, "\n");

	while(line){
		if(lineno > end) break;
		if(lineno >= start)
			fprintf(outfile, "%s\n", line);
		line = strtok(NULL, "\n");
		lineno++;
	}

	fclose(infile);
	fclose(outfile);
	free(text);

	return 0;
}
