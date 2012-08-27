#include <stdio.h>
#include <stdlib.h>

int main(void){
    int c;
    int counter = 0;
    FILE *urandom;

    urandom = fopen("/dev/urandom", "r");

    while((c = fgetc(urandom)) != EOF){
        printf("%d", c % 10);
        counter += 1;

        if(counter % 80 == 0)
            putchar('\n');
    }

    return 0;
}
