#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives 
    and the prefix you want to use (e.g path-row). Usage:"
    echo "    $0 <directory> <prefix>"
    exit 1
fi

here=$1
WRS=$2

cd $here

output=./${WRS}_submit.txt

# This prevents incorrect lines being considered when
# there is more than one file for the same sensor in
# the folder

for lsrfile in $(find ./ -name 'LSR_LANDSAT_*.txt'); do
    cat $lsrfile | awk -F ',' 'NR > 1 { print $2 }' >> $output

done

n=$(cat ./${WRS}_submit.txt | wc -l)

echo "You have $n Landsat images in your text file"
