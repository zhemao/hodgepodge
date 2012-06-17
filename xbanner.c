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

void clearScreen(){
	XClearArea(display, window, 0, 0, width, height, 0);
}

void cleanup(int sig){
	clearScreen();
	XFlush(display);
	XFreeGC(display, gc);
	XCloseDisplay(display);
	exit(EXIT_SUCCESS);
}

int main(int argc, char *argv[]){
	XTextItem textItem;
	int whiteColor, blackColor, color;
	int speed = 5;
	char opt;

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

	while((opt = getopt(argc, argv, "wbs:")) != -1){
		switch(opt){
		case 'w':
			color = whiteColor;
			break;
		case 'b':
			color = blackColor;
			break;
		case 's':
			speed = atoi(optarg);
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

	x = 0;
	y = height / 2;

	for(;;){ 
		clearScreen();
		
		textItem.chars = argv[optind];
		textItem.nchars = strlen(argv[optind]);
		XDrawText(display, window, gc, x, y, &textItem, 1);

		x += speed;

		if(x > width) x = 0;
		
		XFlush(display);
		usleep(10000); 
	}

	cleanup(SIGINT);

	return 0;
}
