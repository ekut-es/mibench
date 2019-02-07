#!/bin/bash
./susan_${PLATFORM} ../input_data/susan_input.pgm susan_output.smoothing.pgm -s
./susan_${PLATFORM} ../input_data/susan_input.pgm susan_output.edges.pgm -e
./susan_${PLATFORM} ../input_data/susan_input.pgm susan_output.corners.pgm -c
