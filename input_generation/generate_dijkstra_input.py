import sys
import os
import string
import random
import array

def usage():
    print("python " + __file__ + " [NODES]")

if len(sys.argv) != 2 :
    print("ERROR: wrong number of parameters!")
    usage()
    sys.exit(1)

random.seed(42)

f_path = str(os.path.dirname(os.path.realpath(__file__))) + str("/../input_data/") + str("dijkstra_input.dat")
f = open(f_path, "w")

min_dist = 1
max_dist = 100

nodes = int(sys.argv[1])

for y in range(0,nodes):
    for x in range(0,nodes):
        #print(random.randint(min_dist,max_dist))
        num = random.randint(min_dist,max_dist)
        f.write(str(num));
        if x != nodes-1:
            f.write(" ")
    f.write("\n")
