import sys
import os
import string
import random
import array

def usage():
    print("python " + __file__ + " [WIDTH] [HEIGHT]")

if len(sys.argv) != 3 :
    print("ERROR: wrong number of parameters!")
    usage()
    sys.exit(1)

random.seed(42)

height = int(sys.argv[1])
width  = int(sys.argv[2])

f_path = str(os.path.dirname(os.path.realpath(__file__))) + str("/../input_data/") + str("jpeg_input.ppm")
f = open(f_path, "w")

f.write('P6\n')
f.write('# CREATOR: Konstantin Luebeck (University of Tuebingen, Embedded Systems)\n')
f.write(str(width) + ' ' + str(height) + '\n')
f.write('255\n')

f.close()

buffer = array.array('B', [0, 0, 0] * width * height)

for y in range(height):
    for x in range(width):
        index = 3 * (y * width + x) 
        buffer[index] = random.randint(0,255)
        buffer[index + 1] = random.randint(0,255)
        buffer[index + 2] = random.randint(0,255)

f = open(f_path, "ab")
buffer.tofile(f)
