#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define HEX 16
#define OCT 8
#define BIN 2

void print_binary(int num){
	unsigned int i;
	i = 1 << (sizeof(num) * 8 - 1);
	int started = 0;
	
	while(i > 0){
		if(num & i) {
			putchar('1');
			started = 1;
		}
		else if(started) putchar('0');
		i >>= 1;
	} 
	
	putchar('\n');
}

void usage(char * name){
	fprintf(stderr, "Usage: %s [format] [number]\n", name);
	exit(EXIT_FAILURE);
}

int main(int argc, char *argv[]){
	char str[1024];
	int num;
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
	
	num = atoi(str);
	
	switch(format){
	case HEX: printf("%x\n", num);
		break;
	case OCT: printf("%o\n", num);
		break;
	case BIN: print_binary(num);
		break;
	}

	return 0;
}
