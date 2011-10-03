/*
 * Pipes binary data from standard input to the default libao driver
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ao/ao.h>

#define BUFFER_SIZE 1024

int play_file(ao_device * dev, FILE * f){
	short data[BUFFER_SIZE];
	int nb;

	while((nb = fread(data, sizeof(short), BUFFER_SIZE, f)) > 0){
		ao_play(dev, (char*)data, nb * sizeof(short));
	}
}

int main(int argc, char *argv[]){
	ao_device * dev;
	ao_sample_format fmt;
	int driver;
	FILE * f;

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
	
	if(argc <= 1)
		play_file(dev, stdin);
	else {
		int i;
		for(i=1; i<argc; i++){
			f = fopen(argv[i], "r");
			if(f == NULL){
				fprintf(stderr, "Could not open %s\n", argv[i]);
				continue;
			}
			play_file(dev, f);
			fclose(f);
		}
	}

	ao_close(dev);
	ao_shutdown();
	
	return 0;
}
