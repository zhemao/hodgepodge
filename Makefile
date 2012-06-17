EXECUTABLES=minify sanitize inserttext todec fromdec lrange timestamp \
			echorandom spanel xbanner

CC=gcc
CFLAGS=-O2 -Wall

all: $(EXECUTABLES)

install: all
	./install.sh

spanel: spanel.c
	$(CC) $(CFLAGS) spanel.c -lX11 -o spanel

xbanner: xbanner.c
	$(CC) $(CFLAGS) xbanner.c -lX11 -o xbanner

lrange: lrange.c saferead.o
	$(CC) $(CFLAGS) saferead.o lrange.c -o lrange

minify: minify.c saferead.o
	$(CC) $(CFLAGS) saferead.o minify.c -o minify
	
sanitize: sanitize.c
	$(CC) $(CFLAGS) saferead.o sanitize.c -o sanitize
	
inserttext: inserttext.c saferead.o
	$(CC) $(CFLAGS) saferead.o inserttext.c -o inserttext

todec: todec.c
	$(CC) $(OPTS) todec.c -o todec
	
saferead.o: saferead.h saferead.c
	$(CC) $(OPTS) -c saferead.c

%: %.c

clean:
	rm -f $(EXECUTABLES) *.o 
	
