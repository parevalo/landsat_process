#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N download_landsat
#$ -j y
#$ -m e

EMAIL=$1
ORDER=$2
DIR=$3


python ~/Scripts/bash/landsat_process/bulk-downloader/download_espa_order.py -e $EMAIL \
	-o $ORDER -c \
	-d $DIR
