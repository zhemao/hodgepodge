#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "saferead.h"

int main(int argc, char *argv[]){
	FILE * infile, * outfile;
	int start;
	int end;
	char line[1024] = {0};
	int lineno = 1;

	if(argc < 3){
		fprintf(stderr, "Usage: %s start end [infile] [outfile]\n", argv[0]);
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


	while(fgets(line, 1024, infile)){
		if(lineno > end) break;
		if(lineno >= start)
			fprintf(outfile, "%s", line);
		lineno++;
	}

	fclose(infile);
	fclose(outfile);

	return 0;
}
