TIME=/usr/bin/time
TIME_FORMAT="%Es\telapsed\n%Us\tuser\n%Ss\tsystem\n%MkB\n"

all: basicmath_small_$(PLATFORM) basicmath_large_$(PLATFORM) bitcount_$(PLATFORM) qsort_small_$(PLATFORM) qsort_large_$(PLATFORM) susan_$(PLATFORM) cjpeg_$(PLATFORM) djpeg_$(PLATFORM) lame_$(PLATFORM) typeset_$(PLATFORM) dijkstra_$(PLATFORM) patricia_$(PLATFORM) stringsearch_small_$(PLATFORM) stringsearch_large_$(PLATFORM) blowfish_$(PLATFORM) sha_$(PLATFORM) crc_$(PLATFORM) fft_$(PLATFORM) rawcaudio_$(PLATFORM) rawdaudio_$(PLATFORM) toast_$(PLATFORM) untoast_$(PLATFORM)

bin: 
	mkdir bin

automotive_basicmath:
	$(MAKE) -C automotive/basicmath

basicmath_small_$(PLATFORM): bin automotive_basicmath
	mv automotive/basicmath/basicmath_small bin/basicmath_small_$(PLATFORM)

basicmath_large_$(PLATFORM): bin automotive_basicmath
	mv automotive/basicmath/basicmath_large bin/basicmath_large_$(PLATFORM)
 

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

stringsearch_small_$(PLATFORM): bin office_stringsearch
	mv office/stringsearch/search_small bin/stringsearch_small_$(PLATFORM)

stringsearch_large_$(PLATFORM): bin office_stringsearch
	mv office/stringsearch/search_large bin/stringsearch_large_$(PLATFORM)


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
    

run:
	@echo adpcm
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_adpcm.sh
	@echo basicmath_large
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_basicmath_large.sh
	@echo basicmath_small
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_basicmath_small.sh
	@echo bitcount
	cd bin; export BITCOUNT_INPUT=140000000; $(TIME) -f $(TIME_FORMAT) ./run_bitcount.sh
	@echo blowfish
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_blowfish.sh
	@echo crc
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_crc.sh
	@echo dijkstra
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_dijkstra.sh
	@echo fft
	cd bin; export FFT_WAVES=2048; export FFT_LENGTH=32768; $(TIME) -f $(TIME_FORMAT) ./run_fft.sh
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
	@echo stringsearch_large
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_stringsearch_large.sh
	@echo stringsearch_small
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_stringsearch_small.sh
	@echo susan
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_susan.sh
	@echo typeset
	cd bin; $(TIME) -f $(TIME_FORMAT) ./run_typeset.sh

.PHONY clean:
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
	-rm -rf bin/basicmath_large_*
	-rm -rf bin/basicmath_small_*
	-rm -rf bin/bitcount_*
	-rm -rf bin/blowfish_*
	-rm -rf bin/cjpeg_*
	-rm -rf bin/crc_*
	-rm -rf bin/dijkstra_*
	-rm -rf bin/djpeg_*
	-rm -rf bin/fft_*
	-rm -rf bin/lame_*
	-rm -rf bin/lout_*
	-rm -rf bin/patricia_*
	-rm -rf bin/qsort_large_*
	-rm -rf bin/qsort_small_*
	-rm -rf bin/rawcaudio_*
	-rm -rf bin/rawdaudio_*
	-rm -rf bin/sha_*
	-rm -rf bin/stringsearch_large_*
	-rm -rf bin/stringsearch_small_*
	-rm -rf bin/susan_*
	-rm -rf bin/toast_*
	-rm -rf bin/untoast_*
	-rm -rf bin/*output*
	-rm -rf bin/lout.li
