/*
 * Pipes binary data from standard input to the default libao driver
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ao/ao.h>

#define BUFFER_SIZE 1024

int main(int argc, char *argv[]){
	ao_device * dev;
	ao_sample_format fmt;
	int driver;
	short data[BUFFER_SIZE];
	int nb;

	memset(&fmt, 0, sizeof(fmt));
	fmt.bits = sizeof(short)*8;
	fmt.channels = 2;
	fmt.rate = 44100;
	fmt.byte_format = AO_FMT_NATIVE;

	ao_initialize();

	driver = ao_default_driver_id();
	if(driver == -1){
		fprintf(stderr, "No default driver.\n");
		exit(EXIT_FAILURE);
	}
	
	dev = ao_open_live(driver, &fmt, NULL);
	if(dev == NULL){
		fprintf(stderr, "Could not open device.\n");
		exit(EXIT_FAILURE);
	}
	
	while((nb = fread(data, sizeof(short), BUFFER_SIZE, stdin)) > 0){
		ao_play(dev, (char*)data, nb * sizeof(short));
	}

	ao_close(dev);
	ao_shutdown();
	
	return 0;
}
