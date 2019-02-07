#!/bin/bash
./fft_${PLATFORM} ${FFT_WAVES} ${FFT_LENGTH} > fft_output.txt
./fft_${PLATFORM} ${FFT_WAVES} ${FFT_LENGTH} -i > fft_output.inv.txt
