#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <X11/Xlib.h>

Display *display;
Window window;
int width, height;

void cleanup(int sig){
	XClearArea(display, window, 0, height-25, width, height, 0);
	XFlush(display);
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

	width = DisplayWidth(display, DefaultScreen(display));
	height = DisplayHeight(display, DefaultScreen(display));

	int blackColor = BlackPixel(display, DefaultScreen(display));
	int whiteColor = WhitePixel(display, DefaultScreen(display));

	window = DefaultRootWindow(display);

	signal(SIGINT, cleanup);
	
	XMapWindow(display, window);

	GC gc = XCreateGC(display, window, 0, NULL);

	for(;;){ 
		XSetBackground(display, gc, blackColor);
		XSetForeground(display, gc, whiteColor);

		XClearArea(display, window, 0, height-25, width, height, 0);

		FILE * pipe = popen(argv[1], "r");
		
		if(fgets(status, 256, pipe)){
			XDrawImageString(display, window, gc, 
					0, height-3, status, strlen(status)-1);
		}

		pclose(pipe);		
		XFlush(display);
		sleep(1); 
	}

	cleanup(SIGINT);

	return 0;
}
