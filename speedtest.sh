#!/bin/bash

IFS="
"

while true; do
	echo "$(date +%Y-%m-%d-%H\:%M)" | tee speedtest.tmp
	speedtest --bytes --share --simple | tee -a speedtest.tmp
	echo "" | tee -a speedtest.tmp

	cat speedtest.tmp | grep http | perl -pe 's/.*http/http/' | xargs wget -qO speedtest-$(date +%Y-%m-%d-%H%M).png

	cat speedtest.tmp >> speedtest.log

	DATE=($(cat speedtest.log | grep ^20))
	DOWN=($(cat speedtest.log | grep Download | perl -pe 's/.*\: //' | perl -pe 's/\ M.*//'))
	UP=($(cat speedtest.log | grep Upload | perl -pe 's/.*\: //' | perl -pe 's/\ M.*//'))

	echo "Datum, Download, Upload" > speedtest.csv
	for ((c=1;c<=${#DATE[@]};c++)); do
		echo "${DATE[$c]}, ${DOWN[$c]}, ${UP[$c]}" >> speedtest.csv
	done

	Rscript speedtest.r 2>&1 > /dev/null
	
	sleep 3600
done

