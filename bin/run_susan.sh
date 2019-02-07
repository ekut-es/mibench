#!/bin/bash
./susan_${TARGET} ../input_data/susan_input.pgm susan_output.smoothing.pgm -s
./susan_${TARGET} ../input_data/susan_input.pgm susan_output.edges.pgm -e
./susan_${TARGET} ../input_data/susan_input.pgm susan_output.corners.pgm -c
