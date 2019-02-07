#!/bin/bash
./rawcaudio_${TARGET} < ../input_data/adpcm_input.pcm > adpcm_output.adpcm
./rawdaudio_${TARGET} < adpcm_output.adpcm > adpcm_output.pcm
