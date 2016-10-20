#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N stack_L8
#$ -j y
#$ -m e

module load gdal/1.10.0
module load batch_landsat

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

sr="*sr*2.tif *sr*3.tif *sr*4.tif *sr*5.tif *sr*6.tif *sr*7.tif *toa*10.tif"
fmask="*cfmask.tif"

landsat_stack.py -q -p -d "LC*" --files "$sr $fmask" \
    --ndv "-9999; -9999; -9999; -9999; -9999; -9999; -9999; 255" \
    -o "_stack" \
    --format "ENVI" --co "INTERLEAVE=BIP" --max_extent ./
    
    
    
