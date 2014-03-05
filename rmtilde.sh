#!/bin/bash 

#Nicolas R
# Le 22 octobre 2013

find . -type f -name '[^~]*~' -exec rm -i {} \;
