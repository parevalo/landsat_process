#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N stack_L7_multi
#$ -j y
#$ -m e

#module load gdal/1.10.0
#module load batch_landsat

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

# Name patterns for file stacking
sr="*sr*1.tif *sr*2.tif *sr*3.tif *sr*4.tif *sr*5.tif *sr*7.tif *toa*6.tif"
fmask="*cfmask.tif"

# Variables to do the stacking by scene
scn_list="004057 004058 004061 004062 005057 005058 005059 005060 \
          005061 006058 006059 006060 006061 007058 007059 007060 \
          008058 008059 008060 009059"

rootdir=/projectnb/landsat/projects/Colombia/images

for s in $scn_list; do
    # Find example image so that the new files have exactly the same extent
    img=$(find $rootdir/$s/images -maxdepth 1 -type d -name "*LE7*" | head -1 ) 
    example_img=$(basename $img)
    img_path=$rootdir/$s/images/$example_img/$example_img"_stack"

    # Do the stacking
    landsat_stack.py -v -q -p -d "LE7$s*" --files "$sr $fmask" \
        --ndv "-9999; -9999; -9999; -9999; -9999; -9999; -9999; 255" \
        -o "_stack" \
        --format "ENVI" --co "INTERLEAVE=BIP" --image="$img_path" ./ 
done 
    
    
