all: basicmath

basicmath: basicmath.c rad2deg.c cubic.c isqrt.c Makefile
	$(CC) $(CFLAGS) -O3 basicmath.c rad2deg.c cubic.c isqrt.c -o basicmath -lm


clean:
	rm -rf basicmath output*
