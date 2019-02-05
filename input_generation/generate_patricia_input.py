import sys
import os
import string
import random
import array

def usage():
    print("python " + __file__ + " [DURATION] [EVENTS]")

if len(sys.argv) != 3 :
    print("ERROR: wrong number of parameters!")
    usage()
    sys.exit(1)

random.seed(42)

f_path = str(os.path.dirname(os.path.realpath(__file__))) + str("/../input_data/") + str("patricia_input.udp")
f = open(f_path, "w")

duration = int(sys.argv[1])
events = int(sys.argv[2])

period_mean = duration/events
period_variance = period_mean/2

ip_byte_0_range = (1,20)
ip_byte_1_range = (1,20)
ip_byte_2_range = (1,20)
ip_byte_3_range = (1,254)

time = 0

while time < duration:
    time = time + period_mean*random.uniform(0,1)+period_variance
    ip_string = str(random.randint(ip_byte_0_range[0], ip_byte_0_range[1])) + " " + str(random.randint(ip_byte_1_range[0], ip_byte_1_range[1])) + " " + str(random.randint(ip_byte_2_range[0], ip_byte_2_range[1])) + " " + str(random.randint(ip_byte_3_range[0], ip_byte_3_range[1]))
    f.write(str(time) + " " + ip_string + "\n")

f.close()
