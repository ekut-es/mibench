all: search

search: ${FILE2} Makefile
	 $(CC) bmhasrch.c  bmhisrch.c  bmhsrch.c  pbmsrch.c -O3 $(CFLAGS) -o search

clean:
	rm -rf search output*
