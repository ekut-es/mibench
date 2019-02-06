import sys
import os
import random
import struct
from lorem.text import TextLorem

def usage():
    print("python " + __file__ + " [BYTES]")

if len(sys.argv) != 2 :
    print("ERROR: wrong number of parameters!")
    usage()
    sys.exit(1)

random.seed(42)

bytes = int(sys.argv[1])

f_path = str(os.path.dirname(os.path.realpath(__file__))) + str("/../input_data/") + str("adpcm_input.pcm")

byte_string = []

for i in range(0,bytes):
    byte_string.append(random.randint(0,255))

f = open(f_path, "wb")
format_string = str(len(byte_string)) + 'B'
f.write(struct.pack(format_string, *byte_string))
f.close()
