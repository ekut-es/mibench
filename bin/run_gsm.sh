#!/bin/bash
./toast_${TARGET} -fps -c ../input_data/gsm_input.au > gsm_output.encode.gsm
./untoast_${TARGET} -fps -c gsm_output.encode.gsm > gsm_output.decode.gsm
