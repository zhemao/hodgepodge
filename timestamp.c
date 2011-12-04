#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void){
	char message[1024];
	char timestamp[1024];
	time_t now;
	struct tm * nowtm;
	
	while(fgets(message, 1024, stdin)){
		if(message[0] != '\0' && message[0] != '\n'){
			now = time(0);
			nowtm = localtime(&now);
			strftime(timestamp, 1024, "[%F %r]", nowtm);
			printf("%s %s", timestamp, message);
		}
	}

	return 0;
}
