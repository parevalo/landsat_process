#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N dwnl_multi
#$ -j y
#$ -m e

module load python/2.7.5_nopath

EMAIL=$1
ORDER=$2
DIR=$3


python ~/Scripts/landsat_process/bulk-downloader/download_espa_order.py -e $EMAIL \
	-o $ORDER -c \
	-d $DIR
