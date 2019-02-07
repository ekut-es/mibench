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

f_path = str(os.path.dirname(os.path.realpath(__file__))) + str("/../input_data/") + str("gsm_input.au")

byte_string = []

for i in range(0,bytes):
    byte_string.append(random.randint(0,255))

f = open(f_path, "wb")
header_string = [ 
    0x2e, 0x73, 0x6e, 0x64, 
    0x00, 0x00, 0x00, 0x20, 
    0xff, 0xff, 0xff, 0xff, 
    0x00, 0x00, 0x00, 0x01, 

    0x00, 0x00, 0x1f, 0x40,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00
]
f.write(struct.pack('32B', *header_string))
format_string = str(len(byte_string)) + 'B'
f.write(struct.pack(format_string, *byte_string))
f.close()
