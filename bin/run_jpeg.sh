#!/bin/bash
./cjpeg_${TARGET} -dct int -progressive -opt -outfile jpeg_output.jpeg ../input_data/jpeg_input.ppm
./djpeg_${TARGET} -dct int -ppm -outfile jpeg_output.ppm jpeg_output.jpeg
