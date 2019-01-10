# MiBench
Source Code from: [http://vhosts.eecs.umich.edu/mibench/source.html](http://vhosts.eecs.umich.edu/mibench/source.html)

## Not Ported:
`consumer/tiff*`Needs system wide installation
`office/ghostscript` Not compatible with `stdlib.h`
`office/ispell` input file has wrong format 
`office/sphinx` Not compatible with `stdlib.h`
`security/rijndael` Not compatible with `stdlib.h/stdio.h` 

## Results
### User vs. System Time
Command:
```bash
/usr/bin/time -f "%e\treal\n%U\tuser\n%S\tsystem" [benchmark]
```
