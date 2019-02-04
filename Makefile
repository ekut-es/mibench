#all: automotive_basicmath automotive_bitcount automotive_qsort automotive_susan consumer_jpeg consumer_lame consumer_typeset network_dijkstra network_patricia office_stringsearch security_blowfish security_sha telecomm_CRC32 telecomm_FFT telecomm_adpcm

all: basicmath_small_$(TARGET) basicmath_large_$(TARGET) bitcount_$(TARGET) qsort_small_$(TARGET) qsort_large_$(TARGET) susan_$(TARGET) cjpeg_$(TARGET) djpeg_$(TARGET) lame_$(TARGET) typeset_$(TARGET) dijkstra_$(TARGET) patricia_$(TARGET) stringsearch_small_$(TARGET) stringsearch_large_$(TARGET) blowfish_$(TARGET) sha_$(TARGET) crc_$(TARGET) fft_$(TARGET) rawcaudio_$(TARGET) rawdaudio_$(TARGET) toast_$(TARGET) untoast_$(TARGET)

bin: 
	mkdir bin

automotive_basicmath:
	$(MAKE) -C automotive/basicmath

basicmath_small_$(TARGET): bin automotive_basicmath
	mv automotive/basicmath/basicmath_small bin/basicmath_small_$(TARGET)

basicmath_large_$(TARGET): bin automotive_basicmath
	mv automotive/basicmath/basicmath_large bin/basicmath_large_$(TARGET)
 

automotive_bitcount:
	$(MAKE) -C automotive/bitcount

bitcount_$(TARGET): bin automotive_bitcount
	mv automotive/bitcount/bitcnts bin/bitcnts_$(TARGET)


automotive_qsort:
	$(MAKE) -C automotive/qsort

qsort_small_$(TARGET): bin automotive_qsort
	mv automotive/qsort/qsort_small bin/qsort_small_$(TARGET)

qsort_large_$(TARGET):
	mv automotive/qsort/qsort_large bin/qsort_large_$(TARGET)


automotive_susan:
	$(MAKE) -C automotive/susan

susan_$(TARGET): bin automotive_susan
	mv automotive/susan/susan bin/susan_$(TARGET)


consumer_jpeg:
	$(MAKE) -C consumer/jpeg/jpeg-6a

cjpeg_$(TARGET): bin consumer_jpeg
	mv consumer/jpeg/jpeg-6a/cjpeg bin/cjpeg_$(TARGET)

djpeg_$(TARGET): bin consumer_jpeg
	mv consumer/jpeg/jpeg-6a/djpeg bin/djpeg_$(TARGET)


consumer_lame:
	$(MAKE) -C consumer/lame/lame3.70

lame_$(TARGET): bin consumer_lame
	mv consumer/lame/lame3.70/lame bin/lame_$(TARGET)


consumer_typeset:
	$(MAKE) -C consumer/typeset/lout-3.24

typeset_$(TARGET): bin consumer_typeset
	mv consumer/typeset/lout-3.24/lout bin/lout_$(TARGET)


network_dijkstra:
	$(MAKE) -C network/dijkstra

dijkstra_$(TARGET): bin network_dijkstra
	mv network/dijkstra/dijkstra bin/dijkstra_$(TARGET)	


network_patricia:
	$(MAKE) -C network/patricia

patricia_$(TARGET): bin network_patricia
	mv network/patricia/patricia bin/patricia_$(TARGET)


office_stringsearch:
	$(MAKE) -C office/stringsearch

stringsearch_small_$(TARGET): bin office_stringsearch
	mv office/stringsearch/search_small bin/stringsearch_small_$(TARGET)

stringsearch_large_$(TARGET): bin office_stringsearch
	mv office/stringsearch/search_large bin/stringsearch_large_$(TARGET)


security_blowfish:
	$(MAKE) -C security/blowfish

blowfish_$(TARGET): bin security_blowfish
	mv security/blowfish/bf bin/blowfish_$(TARGET)


security_sha:
	$(MAKE) -C security/sha

sha_$(TARGET): bin security_sha
	mv security/sha/sha bin/sha_$(TARGET)


telecomm_CRC32:
	$(MAKE) -C telecomm/CRC32

crc_$(TARGET): bin telecomm_CRC32
	mv telecomm/CRC32/crc bin/crc_$(TARGET)


telecomm_FFT:
	$(MAKE) -C telecomm/FFT

fft_$(TARGET): bin telecomm_FFT
	mv telecomm/FFT/fft bin/fft_$(TARGET)	


telecomm_adpcm:
	$(MAKE) -C telecomm/adpcm/src

rawcaudio_$(TARGET): bin telecomm_adpcm
	mv telecomm/adpcm/bin/rawcaudio bin/rawcaudio_$(TARGET)

rawdaudio_$(TARGET): bin telecomm_adpcm
	mv telecomm/adpcm/bin/rawdaudio bin/rawdaudio_$(TARGET)
	

telecomm_gsm:
	$(MAKE) -C telecomm/gsm

toast_$(TARGET): bin telecomm_gsm
	mv telecomm/gsm/bin/toast bin/toast_$(TARGET)

untoast_$(TARGET): bin telecomm_gsm
	mv telecomm/gsm/bin/untoast bin/untoast_$(TARGET)


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
	-rm -rf bin
