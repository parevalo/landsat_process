#!/bin/bash
#$ -l h_rt=48:00:00
#$ -V
#$ -N BGW_transform
#$ -j y


scn=007059 #"008059 006059"

rootdir=/projectnb/landsat/projects/Colombia/images
cd $rootdir/$scn/images 

l_file=`find -L . -name 'L*stack' -type f`
for l in $l_file; do
    id=$(basename $(dirname $l))
    echo "Running on file:"
    echo $id
    echo "Executing code..."
    python /usr3/graduate/parevalo/misc/spectral/transforms.py \
        -v $l ./$id/${id}_BGW.tif brightness greenness wetness evi ndmi nbr
done


