#!/usr/bin/env bash

DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/00_raw_data/V4_bacteria
OUTPUT_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/01_pooled/V4_bacteria/


cd $DATADIRECTORY_V4_bacteria

cat F1-B_S244_L001_R2_001.fastq.gz F1_S243_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/F1_S243_R2.fastq.gz
cat F2-B_S246_L001_R2_001.fastq.gz F2_S245_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/F2_S245_R2.fastq.gz
cat F3-B_S248_L001_R2_001.fastq.gz F3_S247_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/F3_S247_R2.fastq.gz
cat F4-B_S250_L001_R2_001.fastq.gz F4_S249_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/F4_S249_R2.fastq.gz
cat F5-B_S252_L001_R2_001.fastq.gz F5_S251_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/F5_S251_R2.fastq.gz
cat JC1-B_S254_L001_R2_001.fastq.gz JC1_S253_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/JC1_S253_R2.fastq.gz
cat JC2-B_S256_L001_R2_001.fastq.gz JC2_S255_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/JC2_S255_R2.fastq.gz
cat JC3-B_S274_L001_R2_001.fastq.gz JC3_S273_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/JC3_S273_R2.fastq.gz
cat JC4-B_S276_L001_R2_001.fastq.gz JC4_S275_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/JC4_S275_R2.fastq.gz
cat JC5-B_S278_L001_R2_001.fastq.gz JC5_S277_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/JC5_S277_R2.fastq.gz
cat JL1-B_S280_L001_R2_001.fastq.gz JL1_S279_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/JL1_S279_R2.fastq.gz
cat JL2-B_S282_L001_R2_001.fastq.gz JL2_S281_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/JL2_S281_R2.fastq.gz
cat JL3-B_S284_L001_R2_001.fastq.gz JL3_S283_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/JL3_S283_R2.fastq.gz
cat JL4-B_S286_L001_R2_001.fastq.gz JL4_S285_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/JL4_S285_R2.fastq.gz
cat JL5-B_S288_L001_R2_001.fastq.gz JL5_S287_L001_R2_001.fastq.gz > OUTPUT_V4_bacteria/JL5_S287_R2.fastq.gz

