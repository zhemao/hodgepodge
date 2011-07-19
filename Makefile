all: minify sanitize

minify: minify.c saferead.o
	gcc saferead.o minify.c -o minify
	
sanitize: sanitize.c
	gcc saferead.o sanitize.c -o sanitize
	
saferead.o: saferead.h saferead.c
	gcc -c saferead.c
	
inserttext: inserttext.c saferead.o
	gcc saferead.o inserttext.c -o inserttext

clean:
	rm -f eliminate sanitize *.o *.gch
	
