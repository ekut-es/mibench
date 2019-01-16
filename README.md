# MiBench
Source Code from: [http://vhosts.eecs.umich.edu/mibench/source.html](http://vhosts.eecs.umich.edu/mibench/source.html)

## Not Ported
`consumer/tiff*` Needs system wide installation
`office/ghostscript` Not compatible with `stdlib.h`
`office/ispell` input file has wrong format 
`office/sphinx` Not compatible with `stdlib.h`
`security/rijndael` Not compatible with `stdlib.h/stdio.h` 
`security/pgp` No compatible system provided by Makefile 

## Results
### User vs. System Time
Command:
```bash
/usr/bin/time -f "%e\treal\n%U\tuser\n%S\tsystem" [benchmark]
```

## Build
* set `TARGET`, `CC` and `CFLAGS`
* run `make`
* after successful compilation all binaries can be found in `bin`

### Not Included
`consumer/mad` uses configure
`office/rsynth` uses configure

## Input Generation
### `automotive`
* `basicmath` has no input
* `bitcount` input number in `runme_variable.sh` can be adjusted by `export BITCOUNT_INPUT=<X>` where as `<X>` is a positive integer (larger `<X>` means longer runtime)
* `qsort_small` run `python generate_qsort_small_input.py [NUMBER_OF_WORDS]` which generates the file `input_data/qsort_small_input.txt`
* `qsort_large` run `python generate_qsort_large_input.py [NUMBER_OF_VECTORS]` which generates the file `input_data/qsort_large_input.txt`
