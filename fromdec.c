#define HEX 16
#define OCT 8
#define BIN 2

char hexchar(int digit){
	if(digit < 10)
		return digit + 48;
	if(digit < 16)
		return digit + 87;
	return -1;
}

void itoh(int num, char * str){
	
}
