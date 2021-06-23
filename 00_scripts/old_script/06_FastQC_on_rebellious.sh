#!/usr/bin/env bash

# installing FastQC from https://www.bioinformatics.babraham.ac.uk/projects/download.html
# FastQC v0.11.9 (Mac DMG image)

# Correct tool citation : Andrews, S. (2010). FastQC: a quality control tool for high throughput sequence data.

DATA_DIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria_02
OUT_PUT_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/03_cleaned_data_quality_check/DATA_OUTPUT_V4_bacteria_02

# For V4_bacteria
for FILE in $(ls $DATA_DIRECTORY_V4_bacteria/*.fastq.gz)
do
      fastqc $FILE -o $OUT_PUT_V4_bacteria
done ;
