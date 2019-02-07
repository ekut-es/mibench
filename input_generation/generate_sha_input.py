import sys
import os
import random
from lorem.text import TextLorem

def usage():
    print("python " + __file__ + " [CHARS]")

if len(sys.argv) != 2 :
    print("ERROR: wrong number of parameters!")
    usage()
    sys.exit(1)

random.seed(42)

chars = int(sys.argv[1])

f_path = str(os.path.dirname(os.path.realpath(__file__))) + str("/../input_data/") + str("sha_input.asc")

lorem = TextLorem(wsep=' ', srange=(1,1), words="duis dui arcu ornare imperdiet faucibus id faucibus id justo integer mollis nisl et mauris volutpat a lacinia lacus facilisis in sagittis diam ac pretium gravida nisl justo odio sed porta massa eli auctor dolor praesent purus eros fringilla a posuere vitae imperdiet quis donec bibendum fermentum posuere cras eget lectus ipsum donec urna dolor elementum in egestas eleifend dapibus ac justo aenean bibendum justo ut risus venenatis ac vulputate mi vehicula etiam laoreet elit vitae eros fringilla eu pulvinar metus porttitor donec bibendum fermentum posuere etiam nisi ligula ultricies sed molestie id scelerisque quis eros etiam laoreet elit vitae eros fringilla eu pulvinar metus porttitor quisque at augue quis tortor euismo tincidunt nec id magna lorem ipsum dolor sit amet consectetur adipiscing elit sed eu nibh non metus malesuada imperdiet nunc purus dui lacinia at hendrerit eget sodales id erat etiam sapien turpis sempe ut semper sed porttitor non magna vivamus at lacus nisi mauris facilisis urna vitae convallis posuere elit tellus placerat diam a elementum libero ante ac ligula aenean velit nibh condimentum id auctor quis ultricies in turpis pellentesque hendrerit massa at euismod ullamcorper enim tortor tincidunt sapien, nec convallis nisl mauris eu tellus donec laoreet dolor se euismod porttitor neque neque pharetra erat id ultricies massa nisl ac lacus phasellus sapien facilisis sed fringilla at accumsan mollis quam aenean bibendum justo ut risus venenatis ac vulputat mi vehicula mauris varius risus et orci porta eget tempus nulla posuere. vivamus at lacus nisi mauris facilisis urna vitae convallis posuere elit tellus placerat diam a elementum libero ante ac ligula donec laoreet dolor sed euismod porttitor neque neque pharetra erat".split())


char_count = 0
text = str()
prob_paragraph = 1/100

while(char_count < chars):
    sentence = lorem.sentence()[:-1]
    char_count = char_count + len(sentence)
    text = text + sentence
    if(random.uniform(0,1) > 1-prob_paragraph):
        text = text + "\n"

f = open(f_path, "w")
f.write(text)
f.close()
