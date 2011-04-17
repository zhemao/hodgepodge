eliminate: eliminate.c saferead.o
	gcc saferead.o eliminate.c -o eliminate
	
sanitize: sanitize.c
	gcc saferead.o sanitize.c -o sanitize
	
saferead.o: saferead.h saferead.c
	gcc -c saferead.h saferead.c

clean:
	rm -f eliminate sanitize *.o *.gch
