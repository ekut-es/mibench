#!/bin/bash
./blowfish_${TARGET} e ../input_data/blowfish_input.asc blowfish_output.enc 1234567890abcdeffedcba0987654321
./blowfish_${TARGET} d blowfish_output.enc blowfish_output.asc 1234567890abcdeffedcba0987654321
