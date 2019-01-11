#all: automotive_basicmath automotive_bitcount automotive_qsort automotive_susan consumer_jpeg consumer_lame consumer_typeset network_dijkstra network_patricia office_stringsearch security_blowfish security_sha telecomm_CRC32 telecomm_FFT telecomm_adpcm

all: automotive_basicmath_small_$(TARGET) automotive_basicmath_large_$(TARGET) automotive_bitcount_$(TARGET) automotive_qsort_small_$(TARGET) automotive_qsort_large_$(TARGET) automotive_susan_$(TARGET) consumer_jpeg_$(TARGET)


automotive_basicmath:
	$(MAKE) -C automotive/basicmath

automotive_basicmath_small_$(TARGET): automotive_basicmath
	mv automotive/basicmath/basicmath_small basicmath_small_$(TARGET)

automotive_basicmath_large_$(TARGET): automotive_basicmath
	mv automotive/basicmath/basicmath_large basicmath_large_$(TARGET)
 

automotive_bitcount:
	$(MAKE) -C automotive/bitcount

automotive_bitcount_$(TARGET): automotive_bitcount
	mv automotive/bitcount/bitcnts bitcnts_$(TARGET)


automotive_qsort:
	$(MAKE) -C automotive/qsort

automotive_qsort_small_$(TARGET): automotive_qsort
	mv automotive/qsort/qsort_small qsort_small_$(TARGET)

automotive_qsort_large_$(TARGET):
	mv automotive/qsort/qsort_large qsort_large_$(TARGET)


automotive_susan:
	$(MAKE) -C automotive/susan

automotive_susan_$(TARGET): automotive_susan
	mv automotive/susan/susan susan_$(TARGET)


consumer_jpeg:
	$(MAKE) -C consumer/jpeg/jpeg-6a

consumer_jpeg_$(TARGET): consumer_jpeg
	mv consumer/jpeg/jpeg-6a/cjpeg cjpeg_$(TARGET)
	mv consumer/jpeg/jpeg-6a/djpeg djpeg_$(TARGET)


consumer_lame:
	$(MAKE) -C consumer/lame/lame3.70

consumer_typeset:
	$(MAKE) -C consumer/typeset/lout-3.24

network_dijkstra:
	$(MAKE) -C network/dijkstra

network_patricia:
	$(MAKE) -C network/patricia

office_stringsearch:
	$(MAKE) -C office/stringsearch

security_blowfish:
	$(MAKE) -C security/blowfish

security_sha:
	$(MAKE) -C security/sha

telecomm_CRC32:
	$(MAKE) -C telecomm/CRC32

telecomm_FFT:
	$(MAKE) -C telecomm/FFT

telecomm_adpcm:
	$(MAKE) -C telecomm/adpcm/src

telecomm_gsm:
	$(MAKE) -C telecomm/gsm


.PHONY clean:
	$(MAKE) -C automotive/basicmath clean
	-rm basicmath_small_*
	-rm basicmath_large_*
	$(MAKE) -C automotive/bitcount clean
	-rm bitcnts_*
	$(MAKE) -C automotive/qsort clean
	-rm qsort_small_*
	-rm qsort_large_*
	$(MAKE) -C automotive/susan clean
	-rm susan_*
	$(MAKE) -C consumer/jpeg/jpeg-6a clean
	-rm cjpeg_*
	-rm djpeg_*
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
