#!/bin/bash

p1=/projectnb/landsat/projects/Colombia/images/007059/images
p2=/projectnb/landsat/projects/Colombia/images/007058/images

outpath=/projectnb/landsat/projects/Colombia/ts_subset

#coords for 1000x1000 subset, scene 759
xmin=624075
xmax=654075
ymax=247035
ymin=217035


# Neiher gdalwarp nor gdal_merge or gdal_translate assign nodata values correctly
# when converted to GTiff, so will leave it in ENVI format

#for img in $(find $p2 -mindepth 2 -name 'L*_stack'); do
#   fname=$(basename $img)
#   gdal_translate -of ENVI  -stats \
#    -projwin $xmin $ymax $xmax $ymin $img $outpath/007058/$fname
#done

# Copy metadata file too
for mtl in $(find $p1 -mindepth 2 -name 'L*_MTL.txt'); do
   mname=$(basename $mtl)
   cp $mtl $outpath/007059/$mname
done

