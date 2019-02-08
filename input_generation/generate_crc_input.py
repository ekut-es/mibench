import sys
import os
import random
import struct

def usage():
    print("python " + __file__ + " [BYTES]")

if len(sys.argv) != 2 :
    print("ERROR: wrong number of parameters!")
    usage()
    sys.exit(1)

random.seed(42)

bytes = int(sys.argv[1])

f_path = str(os.path.dirname(os.path.realpath(__file__))) + str("/../input_data/") + str("crc_input.pcm")

f = open(f_path, "wb")

for i in range(0,bytes):
    f.write(struct.pack('B', random.randint(0,255)))

f.close()
