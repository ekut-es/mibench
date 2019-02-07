import sys
import os
import wave
import random
import struct

def usage():
    print("python " + __file__ + " [SECONDS]")

if len(sys.argv) != 2 :
    print("ERROR: wrong number of parameters!")
    usage()
    sys.exit(1)

random.seed(42)

sample_length = 44100 * int(sys.argv[1]) # 300 seconds of noise, 5 minutes

f_path = str(os.path.dirname(os.path.realpath(__file__))) + str("/../input_data/") + str("lame_input.wav")

f = wave.open(f_path, 'w')
f.setparams((2, 2, 44100, 0, 'NONE', 'not compressed'))

for i in range(0, sample_length):
    value = random.randint(-32767, 32767)
    packed_value = struct.pack('h', value)
    f.writeframes(packed_value)
    f.writeframes(packed_value)

f.close()
