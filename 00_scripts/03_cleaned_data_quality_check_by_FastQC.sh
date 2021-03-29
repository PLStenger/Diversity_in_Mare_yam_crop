#!/usr/bin/env bash

# installing FastQC from https://www.bioinformatics.babraham.ac.uk/projects/download.html
# FastQC v0.11.9 (Mac DMG image)

# Correct tool citation : Andrews, S. (2010). FastQC: a quality control tool for high throughput sequence data.

WORKING_DIRECTORY=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop
DATA_DIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_ITS2_fungi
DATA_DIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria
OUT_PUT_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/03_cleaned_data_quality_check/OUT_PUT_ITS2_fungi/
OUT_PUT_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/03_cleaned_data_quality_check/OUT_PUT_V4_bacteria/

cd $WORKING_DIRECTORY

# For ITS2_fungi
for FILE in $(ls $DATA_DIRECTORY_ITS2_fungi/*.fastq.gz)
do
      fastqc $FILE -o $OUT_PUT_ITS2_fungi
done ;

# For V4_bacteria
for FILE in $(ls $DATA_DIRECTORY_V4_bacteria/*.fastq.gz)
do
      fastqc $FILE -o $OUT_PUT_V4_bacteria
done ;
