#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <X11/Xlib.h>

Display *display;
Window window;

void cleanup(int sig){
	XCloseDisplay(display);
	exit(EXIT_SUCCESS);
}

int main(int argc, char *argv[]){
	char status[256];

	if(argc < 2){
		fprintf(stderr, "Usage: %s text\n", argv[0]);
		exit(EXIT_SUCCESS);
	}

	display = XOpenDisplay(NULL);
	
	if(display == NULL){
		fprintf(stderr, "Failed to open display.\n");
		exit(EXIT_FAILURE);
	}

	int height = DisplayHeight(display, DefaultScreen(display));

	int blackColor = BlackPixel(display, DefaultScreen(display));
	int whiteColor = WhitePixel(display, DefaultScreen(display));

	/*Window window = XCreateSimpleWindow(display, DefaultRootWindow(display), 
						0, 0, width, height, 0, blackColor, whiteColor);*/

	Window window = DefaultRootWindow(display);

	signal(SIGINT, cleanup);
	
	XMapWindow(display, window);

	GC gc = XCreateGC(display, window, 0, NULL);

	for(;;){ 
		XSetBackground(display, gc, blackColor);
		XSetForeground(display, gc, whiteColor);

		FILE * pipe = popen(argv[1], "r");
		
		if(fgets(status, 256, pipe)){
			XDrawImageString(display, window, gc, 
					0, height-5, status, strlen(status)-1);
		}

		pclose(pipe);		
		XFlush(display);
		sleep(1); 
	}

	cleanup(SIGINT);

	return 0;
}
