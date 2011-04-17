#include "saferead.h"
#include "stdlib.h"
#include "string.h"

char * saferead(FILE * f){
	int incr = 1024;
	int size = incr;
	int len = 0;
	char * buf = (char*)malloc(size*sizeof(char));
	memset(buf, 0, size);
	fread(buf, sizeof(char), (size-1)*sizeof(char), f);
	while(!feof(f)){
		size += incr;
		buf = realloc(buf, size*sizeof(char));
		len = strlen(buf);
		fread(buf+len, sizeof(char), (size-len-1)*sizeof(char), f);
	}
	fclose(f);
	return buf;
}
