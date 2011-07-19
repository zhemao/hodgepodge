#include "saferead.h"
#include "stdlib.h"
#include "string.h"

char * saferead(FILE * f){
	int len;
	char * buf;
	fseek(f, 0, SEEK_END);
	len = ftell(f);
	fseek(f, 0, SEEK_SET);
	buf = (char*)malloc(sizeof(char)*(len+1));
	fread(buf, sizeof(char), len, f);
	buf[len] = '\0';
	return buf;
}