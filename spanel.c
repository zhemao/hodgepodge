#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <X11/Xlib.h>

Display *display;
Window window;
GC gc;
int x, y;
int width, height;

void clearStatus(){
	XClearArea(display, window, x, y-10, width, 13, 0);
}

void cleanup(int sig){
	clearStatus();
	XFlush(display);
	XFreeGC(display, gc);
	XCloseDisplay(display);
	exit(EXIT_SUCCESS);
}

int main(int argc, char *argv[]){
	char status[256];
	XTextItem textItem;
	int whiteColor, blackColor, color;
	char opt;
	int refresh = 1;

	textItem.delta = 0;
	textItem.font = None;

	display = XOpenDisplay(NULL);
	
	if(display == NULL){
		fprintf(stderr, "Failed to open display.\n");
		exit(EXIT_FAILURE);
	}

	width = DisplayWidth(display, DefaultScreen(display));
	height = DisplayHeight(display, DefaultScreen(display));

	whiteColor = WhitePixel(display, DefaultScreen(display));
	blackColor = BlackPixel(display, DefaultScreen(display));
	color = whiteColor;

	x = 0;
	y = height - 3;

	while((opt = getopt(argc, argv, "hlwbt:")) != -1){
		switch(opt){
		case 'h':
			y = 12;
			break;
		case 'l':
			y = height-3;
			break;
		case 'w':
			color = whiteColor;
			break;
		case 'b':
			color = blackColor;
			break;
		case 't':
			refresh = atoi(optarg);
			break;
		default:
			fprintf(stderr, "Unrecognized option: %c", opt);
			XCloseDisplay(display);
			exit(EXIT_FAILURE);
		}
	}

	if(optind >= argc){
		fprintf(stderr, "Usage: %s [options] command\n", argv[0]);
		XCloseDisplay(display);
		exit(EXIT_FAILURE);
	}

	window = DefaultRootWindow(display);

	signal(SIGINT, cleanup);
	
	gc = XCreateGC(display, window, 0, NULL);
	
	XSetForeground(display, gc, color);

	for(;;){ 
		clearStatus();
		
		FILE * pipe = popen(argv[optind], "r");
		
		if(fgets(status, 256, pipe)){
			textItem.chars = status;
			textItem.nchars = strlen(status)-1;
			XDrawText(display, window, gc, x, y, &textItem, 1);
		}

		pclose(pipe);		
		XFlush(display);
		sleep(refresh); 
	}

	cleanup(SIGINT);

	return 0;
}
