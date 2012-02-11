#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[]){
	int num;

	if(argc < 2){
		fprintf(stderr, "Usage: %s args...\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	srandom(time(0));
	num = random() % (argc-1);

	printf("%s\n", argv[num+1]);

	return 0;
}
