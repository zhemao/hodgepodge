EXECUTABLES=minify sanitize inserttext todec fromdec lrange timestamp \
			echorandom
OPTS=-O2

all: $(EXECUTABLES)

install: all
	./install.sh

lrange: lrange.c saferead.o
	gcc $(OPTS) saferead.o lrange.c -o lrange

minify: minify.c saferead.o
	gcc $(OPTS) saferead.o minify.c -o minify
	
sanitize: sanitize.c
	gcc $(OPTS) saferead.o sanitize.c -o sanitize
	
inserttext: inserttext.c saferead.o
	gcc $(OPTS) saferead.o inserttext.c -o inserttext

todec: todec.c
	gcc $(OPTS) todec.c -o todec
	
fromdec: fromdec.c
	gcc $(OPTS) fromdec.c -o fromdec

timestamp: timestamp.c
	gcc $(OPTS) timestamp.c -o timestamp

saferead.o: saferead.h saferead.c
	gcc $(OPTS) -c saferead.c

echorandom: echorandom.c
	gcc $(OPTS) echorandom.c -o echorandom

clean:
	rm -f $(EXECUTABLES) *.o 
	
