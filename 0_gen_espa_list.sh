#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives 
    and the short path-row number you want to use. Usage:"
    echo "    $0 <directory> <ptrw>"
    exit 1
fi

here=$1
WRS=$2

cd $here

output=./${WRS}_submit.txt

cat ./LSR_LANDSAT_ETM_COMBINED_*.txt | awk -F ',' 'NR > 1 { print $2 }' > $output
cat ./LSR_LANDSAT_TM_*.txt | awk -F ',' 'NR > 1 { print $2 }' >> $output
cat ./LSR_LANDSAT_8_*.txt | awk -F ',' 'NR > 1 { print $2 }' >> $output

n=$(cat ./${WRS}_submit.txt | wc -l)

echo "You have $n Landsat images in your text file"
