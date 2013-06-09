#!/bin/bash

q=""
i=0
for var in "$@"
do
    if [ "$i" -eq "0" ]; then
        q+=$var
    else
        q+="+"$var
    fi
    i+=1
done

curl -A Mozilla http://www.google.com/search?q=$q | html2text -width 80 | more
