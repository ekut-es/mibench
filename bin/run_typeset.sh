#!/bin/bash
./lout_${TARGET} -I ../consumer/typeset/lout-3.24/include -D ../consumer/typeset/lout-3.24/data -F ../consumer/typeset/lout-3.24/font -C ../consumer/typeset/lout-3.24/maps -H ../consumer/typeset/lout-3.24/hyph ../input_data/typeset_input.lout > typeset_output.ps
