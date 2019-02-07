import sys
import os
import string
import random

def usage():
    print("python " + __file__ + " [NUMBER_OF_VECTORS]")

if len(sys.argv) != 2 :
    print("ERROR: wrong number of parameters!")
    usage()
    sys.exit(1)

random.seed(42)

number_of_words = int(sys.argv[1])
min_vector_element = 1
max_vector_element = 10000000

f_path = str(os.path.dirname(os.path.realpath(__file__))) + str("/../input_data/") + str("qsort_large_input.txt")
f = open(f_path, "w")

for i in range(number_of_words):
    f.write((str(random.randint(min_vector_element, max_vector_element)) + str("\t") + str(random.randint(min_vector_element, max_vector_element)) + str("\t") + str(random.randint(min_vector_element, max_vector_element))))
    f.write("\n")
