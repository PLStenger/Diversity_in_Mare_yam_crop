#!/usr/bin/env bash

DATA_DIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria
DATA_OUTPUT_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria_02

for FILE in $(ls $DATA_DIRECTORY_V4_bacteria/*.fastq.gz)
do
      cutadapt -a ADAPTER TGGAATTCTCGGGTGCCAAGG -o $DATA_OUTPUT_V4_bacteria/${FILE##*/} $DATA_DIRECTORY_V4_bacteria/${FILE##*/}
done ;
