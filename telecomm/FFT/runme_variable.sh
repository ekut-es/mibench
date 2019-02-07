#!/bin/sh
./fft_${TARGET} ${FFT_WAVES} ${FFT_LENGTH} > output_large.txt
./fft_${TARGET} ${FFT_WAVES} ${FFT_LENGTH} -i > output_large.inv.txt
