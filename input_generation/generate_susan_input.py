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

f_path = str(os.path.dirname(os.path.realpath(__file__))) + str("/../input_data/") + str("susan_input.pgm")
f = open(f_path, "w")

pgm_header = 'P5' + '\n' + str(width) + '  ' + str(height) + '  ' + str(255) + '\n'

f.write('P5\n')
f.write('# CREATOR: Konstantin Luebeck (University of Tuebingen, Embedded Systems)\n')
f.write(str(width) + ' ' + str(height) + '\n')
f.write('255\n')

f.close()
f = open(f_path, "ab")

buffer = array.array('B')

for y in range(height):
    for x in range(width):
        buffer.append(random.randint(0,255))

buffer.tofile(f)
