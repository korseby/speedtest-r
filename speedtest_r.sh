#!/bin/bash

# get values
IFS="
"
DATE=($(cat speedtest.log | grep ^20))
DOWN=($(cat speedtest.log | grep Download | perl -pe 's/.*\: //' | perl -pe 's/\ M.*//'))
UP=($(cat speedtest.log | grep Upload | perl -pe 's/.*\: //' | perl -pe 's/\ M.*//'))

# create csv
echo "Datum, Download, Upload" > speedtest.csv
for ((c=1;c<=${#DATE[@]};c++)); do
	echo "${DATE[$c]}, ${DOWN[$c]}, ${UP[$c]}" >> speedtest.csv
done

Rscript speedtest.r
