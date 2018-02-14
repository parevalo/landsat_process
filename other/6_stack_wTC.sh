#!/bin/bash -l
#$ -l h_rt=24:00:00
#$ -V
#$ -N landsat_stack_wTC
#$ -j y

module load batch_landsat

scn=006059

rootdir=/projectnb/landsat/projects/Colombia/images
cd $rootdir/$scn/images

stack="L*stack"
TC="L*BGW.tif"

landsat_stack.py -v -q -p --files "$stack; $TC; $stack" \
    -b "1 2 3 4 5 6 7; 1 2 3 4 5 6; 8" \
    -n "-9999 -9999 -9999 -9999 -9999 -9999 -9999; -9999 -9999 -9999 -9999 -9999 -9999; 255" \
    -o "*_all" \
--format "ENVI" --co "INTERLEAVE=BIP" --max_extent ./

