TIME=/usr/bin/time
TIME_FORMAT="%Es\telapsed\n%Us\tuser\n%Ss\tsystem\n%MkB\n"

ADPCM_INPUT=300000000
BASICMATH_RUNS=20
BITCOUNT_INPUT=140000000
BLOWFISH_INPUT=120000000
CRC_INPUT=1200000000
DIJKSTRA_INPUT=2000
FFT_WAVES=2048
FFT_LENGTH=32768
GSM_INPUT=51000000
JPEG_INPUT=6500 6500
LAME_INPUT=700
PATRICIA_INPUT=2000 5500
QSORT_LARGE_INPUT=10000000
QSORT_SMALL_INPUT=9500000
SHA_INPUT=1100000000
STRINGSEARCH_RUNS=5500
SUSAN_INPUT=2500 2500
TYPESET_INPUT=7000000

.PHONY: clean clean_$(PLATFORM)

all: basicmath_$(PLATFORM) bitcount_$(PLATFORM) qsort_small_$(PLATFORM) qsort_large_$(PLATFORM) susan_$(PLATFORM) cjpeg_$(PLATFORM) djpeg_$(PLATFORM) lame_$(PLATFORM) typeset_$(PLATFORM) dijkstra_$(PLATFORM) patricia_$(PLATFORM) stringsearch_$(PLATFORM) blowfish_$(PLATFORM) sha_$(PLATFORM) crc_$(PLATFORM) fft_$(PLATFORM) rawcaudio_$(PLATFORM) rawdaudio_$(PLATFORM) toast_$(PLATFORM) untoast_$(PLATFORM)

bin: 
	mkdir bin

automotive_basicmath:
	$(MAKE) -C automotive/basicmath

basicmath_$(PLATFORM): bin automotive_basicmath
	mv automotive/basicmath/basicmath bin/basicmath_$(PLATFORM)


automotive_bitcount:
	$(MAKE) -C automotive/bitcount

bitcount_$(PLATFORM): bin automotive_bitcount
	mv automotive/bitcount/bitcnts bin/bitcount_$(PLATFORM)


automotive_qsort:
	$(MAKE) -C automotive/qsort

qsort_small_$(PLATFORM): bin automotive_qsort
	mv automotive/qsort/qsort_small bin/qsort_small_$(PLATFORM)

qsort_large_$(PLATFORM):
	mv automotive/qsort/qsort_large bin/qsort_large_$(PLATFORM)


automotive_susan:
	$(MAKE) -C automotive/susan

susan_$(PLATFORM): bin automotive_susan
	mv automotive/susan/susan bin/susan_$(PLATFORM)


consumer_jpeg:
	$(MAKE) -C consumer/jpeg/jpeg-6a

cjpeg_$(PLATFORM): bin consumer_jpeg
	mv consumer/jpeg/jpeg-6a/cjpeg bin/cjpeg_$(PLATFORM)

djpeg_$(PLATFORM): bin consumer_jpeg
	mv consumer/jpeg/jpeg-6a/djpeg bin/djpeg_$(PLATFORM)


consumer_lame:
	$(MAKE) -C consumer/lame/lame3.70

lame_$(PLATFORM): bin consumer_lame
	mv consumer/lame/lame3.70/lame bin/lame_$(PLATFORM)


consumer_typeset:
	$(MAKE) -C consumer/typeset/lout-3.24

typeset_$(PLATFORM): bin consumer_typeset
	mv consumer/typeset/lout-3.24/lout bin/lout_$(PLATFORM)


network_dijkstra:
	$(MAKE) -C network/dijkstra

dijkstra_$(PLATFORM): bin network_dijkstra
	mv network/dijkstra/dijkstra bin/dijkstra_$(PLATFORM)	


network_patricia:
	$(MAKE) -C network/patricia

patricia_$(PLATFORM): bin network_patricia
	mv network/patricia/patricia bin/patricia_$(PLATFORM)


office_stringsearch:
	$(MAKE) -C office/stringsearch

stringsearch_$(PLATFORM): bin office_stringsearch
	mv office/stringsearch/search bin/stringsearch_$(PLATFORM)


security_blowfish:
	$(MAKE) -C security/blowfish

blowfish_$(PLATFORM): bin security_blowfish
	mv security/blowfish/bf bin/blowfish_$(PLATFORM)


security_sha:
	$(MAKE) -C security/sha

sha_$(PLATFORM): bin security_sha
	mv security/sha/sha bin/sha_$(PLATFORM)


telecomm_CRC32:
	$(MAKE) -C telecomm/CRC32

crc_$(PLATFORM): bin telecomm_CRC32
	mv telecomm/CRC32/crc bin/crc_$(PLATFORM)


telecomm_FFT:
	$(MAKE) -C telecomm/FFT

fft_$(PLATFORM): bin telecomm_FFT
	mv telecomm/FFT/fft bin/fft_$(PLATFORM)	


telecomm_adpcm:
	$(MAKE) -C telecomm/adpcm/src

rawcaudio_$(PLATFORM): bin telecomm_adpcm
	mv telecomm/adpcm/bin/rawcaudio bin/rawcaudio_$(PLATFORM)

rawdaudio_$(PLATFORM): bin telecomm_adpcm
	mv telecomm/adpcm/bin/rawdaudio bin/rawdaudio_$(PLATFORM)
	

telecomm_gsm:
	$(MAKE) -C telecomm/gsm

toast_$(PLATFORM): bin telecomm_gsm
	mv telecomm/gsm/bin/toast bin/toast_$(PLATFORM)

untoast_$(PLATFORM): bin telecomm_gsm
	mv telecomm/gsm/bin/untoast bin/untoast_$(PLATFORM)

generate_input: 
	python input_generation/generate_adpcm_input.py $(ADPCM_INPUT)
	python input_generation/generate_blowfish_input.py $(BLOWFISH_INPUT) 
	python input_generation/generate_crc_input.py $(CRC_INPUT) 
	python input_generation/generate_dijkstra_input.py $(DIJKSTRA_INPUT) 
	python input_generation/generate_gsm_input.py $(GSM_INPUT) 
	python input_generation/generate_jpeg_input.py $(JPEG_INPUT) 
	python input_generation/generate_lame_input.py $(LAME_INPUT)
	python input_generation/generate_patricia_input.py $(PATRICIA_INPUT) 
	python input_generation/generate_qsort_large_input.py $(QSORT_LARGE_INPUT) 
	python input_generation/generate_qsort_small_input.py $(QSORT_SMALL_INPUT) 
	python input_generation/generate_sha_input.py $(SHA_INPUT) 
	python input_generation/generate_susan_input.py $(SUSAN_INPUT) 
	python input_generation/generate_typeset_input.py $(TYPESET_INPUT) 

run:
	@echo adpcm
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_adpcm.sh
	@echo basicmath
	cd bin; export BASICMATH_RUNS=$(BASICMATH_RUNS); $(TIME) -f $(TIME_FORMAT) ./run_basicmath.sh
	@echo bitcount
	cd bin; export BITCOUNT_INPUT=$(BITCOUNT_INPUT); $(TIME) -f $(TIME_FORMAT) ./run_bitcount.sh
	@echo blowfish
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_blowfish.sh
	@echo crc
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_crc.sh
	@echo dijkstra
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_dijkstra.sh
	@echo fft
	cd bin; export FFT_WAVES=$(FFT_WAVES); export FFT_LENGTH=$(FFT_LENGTH); $(TIME) -f $(TIME_FORMAT) ./run_fft.sh
	@echo gsm
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_gsm.sh
	@echo jpeg
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_jpeg.sh
	@echo lame
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_lame.sh
	@echo patricia
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_patricia.sh
	@echo qsort_large
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_qsort_large.sh
	@echo qsort_small
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_qsort_small.sh
	@echo sha
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_sha.sh
	@echo stringsearch
	cd bin; export STRINGSEARCH_RUNS=$(STRINGSEARCH_RUNS); $(TIME) -f $(TIME_FORMAT) ./run_stringsearch.sh
	@echo susan
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_susan.sh
	@echo typeset
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_typeset.sh

.PHONY clean_$(PLATFORM):
	-rm -rf bin/basicmath_$(PLATFORM)
	-rm -rf bin/bitcount_$(PLATFORM)
	-rm -rf bin/blowfish_$(PLATFORM)
	-rm -rf bin/cjpeg_$(PLATFORM)
	-rm -rf bin/crc_$(PLATFORM)
	-rm -rf bin/dijkstra_$(PLATFORM)
	-rm -rf bin/djpeg_$(PLATFORM)
	-rm -rf bin/fft_$(PLATFORM)
	-rm -rf bin/lame_$(PLATFORM)
	-rm -rf bin/lout_$(PLATFORM)
	-rm -rf bin/patricia_$(PLATFORM)
	-rm -rf bin/qsort_large_$(PLATFORM)
	-rm -rf bin/qsort_small_$(PLATFORM)
	-rm -rf bin/rawcaudio_$(PLATFORM)
	-rm -rf bin/rawdaudio_$(PLATFORM)
	-rm -rf bin/sha_$(PLATFORM)
	-rm -rf bin/stringsearch_$(PLATFORM)
	-rm -rf bin/susan_$(PLATFORM)
	-rm -rf bin/toast_$(PLATFORM)
	-rm -rf bin/untoast_$(PLATFORM)
	-rm -rf bin/lout.li

clean:
	-rm -rf bin/*output*
	$(MAKE) -C automotive/basicmath clean
	$(MAKE) -C automotive/bitcount clean
	$(MAKE) -C automotive/qsort clean
	$(MAKE) -C automotive/susan clean
	$(MAKE) -C consumer/jpeg/jpeg-6a clean
	$(MAKE) -C consumer/lame/lame3.70 clean
	$(MAKE) -C consumer/typeset/lout-3.24 clean
	$(MAKE) -C network/dijkstra clean
	$(MAKE) -C network/patricia clean
	$(MAKE) -C office/stringsearch clean
	$(MAKE) -C security/blowfish clean
	$(MAKE) -C security/sha clean
	$(MAKE) -C telecomm/CRC32 clean
	$(MAKE) -C telecomm/FFT clean
	$(MAKE) -C telecomm/adpcm/src clean 
	$(MAKE) -C telecomm/gsm clean 
