#!/bin/bash -l
#$ -l h_rt=72:00:00
#$ -V
#$ -N dwnl_multi
#$ -j y
#$ -m e
#$ -b y

module load python/2.7.5_nopath

EMAIL=$1
ORDER=$2
DIR=$3
USR=$4
PWD=$5

python ~/Scripts/landsat_process/espa-bulk-downloader/download_espa_order.py -e $EMAIL \
	-o $ORDER -d $DIR -u $USR -p $PWD
