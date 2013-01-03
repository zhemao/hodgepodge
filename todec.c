#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define HEX 16
#define OCT 8
#define BIN 2

int hexdigit(char digit){
	if(digit>=48 && digit<58)
		return digit - 48;
	if(digit>64 && digit<=70)
		return digit - 55;
	if(digit>96 && digit<=102)
		return digit - 87;
	return -1;
}

int htoi(char * hex){
	int res = 0;
	int digit;
	int i;

	for(i=0; hex[i]; i++){
		res = res << 4;
		digit = hexdigit(hex[i]);
		if(digit == -1) return -1;
		res |= digit;
	}

	return res;
}

int otoi(char * oct){
	int res = 0;
	int i, digit;
	
	for(i=0; oct[i]; i++){
		res = res << 3;
		digit = hexdigit(oct[i]);
		if(digit == -1 || digit > 7) return -1;
		res |= digit;
	}
	
	return res;
}

int btoi(char * bin){
	int res = 0;
	int i, digit;
	
	for(i=0; bin[i]; i++){
		res = res << 1;
		digit = hexdigit(bin[i]);
		if(digit == -1 || digit > 1) return -1;
		res |= digit;
	}
	
	return res;
}

void usage(char * name){
	fprintf(stderr, "Usage: %s [format] [number]\n", name);
	exit(EXIT_FAILURE);
}

int main(int argc, char *argv[]){
	char str[1024];
	int num = 0;
	int format = HEX;
	char opt;
	
	memset(str, 0, 1024);

	while((opt=getopt(argc, argv, "oxb")) != -1){
		switch(opt){
		case 'o': format = OCT;
			break;
		case 'x': format = HEX;
			break;
		case 'b': format = BIN;
			break;
		default: usage(argv[0]);
		}
	}
	
	if(optind >= argc){
		scanf("%s", str);
	} else {
		strcpy(str, argv[optind]);
	}
	
	switch(format){
	case HEX: num = htoi(str);
		break;
	case OCT: num = otoi(str);
		break;
	case BIN: num = btoi(str);
		break;
	}
	
	if(num == -1){
		fprintf(stderr, "Error: incorrectly formatted string %s\n", str);
		return EXIT_FAILURE;
	}
	
	printf("%d\n", num);

	return 0;
}
