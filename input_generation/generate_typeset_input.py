import sys
import os
import random
from lorem.text import TextLorem

def usage():
    print("python " + __file__ + " [WORDS]")

if len(sys.argv) != 2 :
    print("ERROR: wrong number of parameters!")
    usage()
    sys.exit(1)

random.seed(42)

words = int(sys.argv[1])

f_path = str(os.path.dirname(os.path.realpath(__file__))) + str("/../input_data/") + str("typeset_input.lout")

lorem = TextLorem(wsep=' ', srange=(5,15), words="duis dui arcu ornare imperdiet faucibus id faucibus id justo integer mollis nisl et mauris volutpat a lacinia lacus facilisis in sagittis diam ac pretium gravida nisl justo odio sed porta massa eli auctor dolor praesent purus eros fringilla a posuere vitae imperdiet quis donec bibendum fermentum posuere cras eget lectus ipsum donec urna dolor elementum in egestas eleifend dapibus ac justo aenean bibendum justo ut risus venenatis ac vulputate mi vehicula etiam laoreet elit vitae eros fringilla eu pulvinar metus porttitor donec bibendum fermentum posuere etiam nisi ligula ultricies sed molestie id scelerisque quis eros etiam laoreet elit vitae eros fringilla eu pulvinar metus porttitor quisque at augue quis tortor euismo tincidunt nec id magna lorem ipsum dolor sit amet consectetur adipiscing elit sed eu nibh non metus malesuada imperdiet nunc purus dui lacinia at hendrerit eget sodales id erat etiam sapien turpis sempe ut semper sed porttitor non magna vivamus at lacus nisi mauris facilisis urna vitae convallis posuere elit tellus placerat diam a elementum libero ante ac ligula aenean velit nibh condimentum id auctor quis ultricies in turpis pellentesque hendrerit massa at euismod ullamcorper enim tortor tincidunt sapien, nec convallis nisl mauris eu tellus donec laoreet dolor se euismod porttitor neque neque pharetra erat id ultricies massa nisl ac lacus phasellus sapien facilisis sed fringilla at accumsan mollis quam aenean bibendum justo ut risus venenatis ac vulputat mi vehicula mauris varius risus et orci porta eget tempus nulla posuere. vivamus at lacus nisi mauris facilisis urna vitae convallis posuere elit tellus placerat diam a elementum libero ante ac ligula donec laoreet dolor sed euismod porttitor neque neque pharetra erat".split())

prob_paragraph = 0.1
prob_section = 0.7
prob_formatting = 0.4

word_count = 0

# header
text = "\
@SysInclude { tbl }\n\
@SysInclude { doc }\n\
def @HeaderA right x { @CD +8p @Font { x } }\n\
def @HeaderB right x { @CD +6p @Font { x } }\n\
def @HeaderC right x { @CD +4p @Font { x } }\n\
def @HeaderD right x { @CD +2p @Font { x } }\n\
def @HeaderE right x { @CD -1p @Font { x } }\n\
def @HeaderF right x { @CD -2p @Font { x } }\n\
# Created by HTML::LoutParser.pm on 2001/06/28 from GNUgcc.htm.\n\
@Doc @Text @Begin\n\
#DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\n\
\n\
# saved from url=(0044)http://www.gnu.org/press/2001-06-18-GCC.html\n\
\n\
#start html\n\
#start head\n"

# title
sentence = lorem.sentence()
word_count = word_count + len(sentence)
title = sentence

text += "#start title\n\
@CentredDisplay { +10p } @Font {" + title + "}\n\
#end title\n\n" 

while(word_count < words):
    sentence = lorem.sentence()
    word_count = word_count + len(sentence)

    # insert paragraph
    if(random.uniform(0,1) > 1-prob_paragraph):
        text += "\n@PP\n"
        
        if(random.uniform(0,1) > 1-prob_paragraph):
            header_type = random.uniform(0,1)

            text += "\n"

            if(header_type < 0.1):
                text += "@HeaderA"
            elif(header_type < 0.2):
                text += "@HeaderB"
            elif(header_type < 0.4):
                text += "@HeaderC"
            elif(header_type < 0.6):
                text += "@HeaderC"
            elif(header_type < 0.8):
                text += "@HeaderD"
            elif(header_type < 0.9):
                text += "@HeaderE"
            else:
                text += "@HeaderF"

            text += " {" + sentence + "}\n"
            text += "@LLP\n"
            word_count = word_count + len(sentence)

    if(random.uniform(0,1) > 1-prob_formatting):
        formatting_type = random.uniform(0,1)

        if(formatting_type < 0.33):
            text += "{}@B {"
        elif(formatting_type < 0.66):
            text += "{}@Underline {"
        else:
            text += "{}@I {" 

        text += sentence + "}\n"
    else:
        text += sentence + " \n"

# footer
text += "\n\n@End @Text\n"

f = open(f_path, "w")
f.write(text)
f.close()
