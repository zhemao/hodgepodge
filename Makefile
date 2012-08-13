EXECUTABLES=minify sanitize inserttext todec fromdec lrange timestamp \
			echorandom spanel xmarquee

CC=gcc
CFLAGS=-O2 -Wall

all: $(EXECUTABLES)

install: all
	./install.sh

spanel: spanel.c
	$(CC) $(CFLAGS) spanel.c -lX11 -o spanel

xmarquee: xmarquee.c
	$(CC) $(CFLAGS) xmarquee.c -lX11 -o xmarquee

lrange: lrange.c saferead.o
	$(CC) $(CFLAGS) saferead.o lrange.c -o lrange

minify: minify.c saferead.o
	$(CC) $(CFLAGS) saferead.o minify.c -o minify
	
sanitize: sanitize.c
	$(CC) $(CFLAGS) saferead.o sanitize.c -o sanitize
	
inserttext: inserttext.c saferead.o
	$(CC) $(CFLAGS) saferead.o inserttext.c -o inserttext

saferead.o: saferead.h saferead.c
	$(CC) $(CFLAGS) -c saferead.c

%: %.c

clean:
	rm -f $(EXECUTABLES) *.o 
	
