EXECUTABLES=minify sanitize inserttext todec fromdec

all: $(EXECUTABLES)

install: all
	./install.sh

minify: minify.c saferead.o
	gcc saferead.o minify.c -o minify
	
sanitize: sanitize.c
	gcc saferead.o sanitize.c -o sanitize
	
inserttext: inserttext.c saferead.o
	gcc saferead.o inserttext.c -o inserttext

todec: todec.c
	gcc todec.c -o todec
	
fromdec: fromdec.c
	gcc fromdec.c -o fromdec

saferead.o: saferead.h saferead.c
	gcc -c saferead.c

clean:
	rm -f $(EXECUTABLES) *.o 
	
