#!/bin/bash
./rawcaudio_${PLATFORM} < ../input_data/adpcm_input.pcm > adpcm_output.adpcm
./rawdaudio_${PLATFORM} < adpcm_output.adpcm > adpcm_output.pcm
