#!/bin/bash

# This script finds all the images' folders for each scene and moves them to the corresponding
# image folder in /colombia/images/<scene>/images/

#cd /projectnb/landsat/projects/Colombia/ESPA
img=/projectnb/landsat/projects/Colombia/images

for folder in $(find . -maxdepth 1 -type d -name 'L*'); do
    # Get folder path and row
    pr=${folder:5:6}
    #echo "$pr"

    # Check if destination folder already exists and move
    if [ -d $img/$pr/images/$(basename $folder) ]; then
        echo "Folder for $(basename $folder) already exists! (nothing was moved)"
    else
        #mv $folder $img/$pr/images
        echo "Moved $(basename $folder) to $pr"
    fi
done
