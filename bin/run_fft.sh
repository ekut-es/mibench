#!/bin/bash
./fft_${TARGET} ${FFT_WAVES} ${FFT_LENGTH} > fft_output.txt
./fft_${TARGET} ${FFT_WAVES} ${FFT_LENGTH} -i > fft_output.inv.txt
