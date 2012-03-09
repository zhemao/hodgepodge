EXECUTABLES=minify sanitize inserttext todec fromdec lrange timestamp \
			echorandom spanel

CC=gcc
OPTS=-O2 -Wall

all: $(EXECUTABLES)

install: all
	./install.sh

spanel: spanel.c
	$(CC) $(OPTS) spanel.c -lX11 -o spanel

lrange: lrange.c saferead.o
	$(CC) $(OPTS) saferead.o lrange.c -o lrange

minify: minify.c saferead.o
	$(CC) $(OPTS) saferead.o minify.c -o minify
	
sanitize: sanitize.c
	$(CC) $(OPTS) saferead.o sanitize.c -o sanitize
	
inserttext: inserttext.c saferead.o
	$(CC) $(OPTS) saferead.o inserttext.c -o inserttext

todec: todec.c
	$(CC) $(OPTS) todec.c -o todec
	
fromdec: fromdec.c
	$(CC) $(OPTS) fromdec.c -o fromdec

timestamp: timestamp.c
	$(CC) $(OPTS) timestamp.c -o timestamp

saferead.o: saferead.h saferead.c
	$(CC) $(OPTS) -c saferead.c

echorandom: echorandom.c
	$(CC) $(OPTS) echorandom.c -o echorandom

clean:
	rm -f $(EXECUTABLES) *.o 
	
