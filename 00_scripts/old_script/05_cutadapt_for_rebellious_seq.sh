#!/usr/bin/env bash

#DATA_DIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria
#DATA_OUTPUT_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria_02

DATA_DIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/00_raw_data/V4_bacteria
DATA_OUTPUT_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria

#for FILE in $(ls $DATA_DIRECTORY_V4_bacteria/*.fastq.gz)
#do
#      cutadapt -a TGGAATTCTCGGGTGCCAAGG -o $DATA_OUTPUT_V4_bacteria/${FILE##*/} $DATA_DIRECTORY_V4_bacteria/${FILE##*/}
#done ;

cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/F1-B_S244_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/F1-B_S244_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F1-B_S244_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F1-B_S244_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/F1_S243_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/F1_S243_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F1_S243_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F1_S243_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/F2-B_S246_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/F2-B_S246_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F2-B_S246_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F2-B_S246_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/F2_S245_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/F2_S245_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F2_S245_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F2_S245_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/F3-B_S248_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/F3-B_S248_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F3-B_S248_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F3-B_S248_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/F3_S247_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/F3_S247_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F3_S247_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F3_S247_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/F4-B_S250_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/F4-B_S250_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F4-B_S250_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F4-B_S250_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/F4_S249_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/F4_S249_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F4_S249_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F4_S249_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/F5-B_S252_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/F5-B_S252_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F5-B_S252_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F5-B_S252_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/F5_S251_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/F5_S251_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F5_S251_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/F5_S251_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JC1-B_S254_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JC1-B_S254_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC1-B_S254_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC1-B_S254_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JC1_S253_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JC1_S253_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC1_S253_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC1_S253_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JC2-B_S256_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JC2-B_S256_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC2-B_S256_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC2-B_S256_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JC2_S255_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JC2_S255_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC2_S255_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC2_S255_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JC3-B_S274_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JC3-B_S274_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC3-B_S274_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC3-B_S274_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JC3_S273_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JC3_S273_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC3_S273_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC3_S273_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JC4-B_S276_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JC4-B_S276_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC4-B_S276_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC4-B_S276_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JC4_S275_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JC4_S275_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC4_S275_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC4_S275_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JC5-B_S278_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JC5-B_S278_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC5-B_S278_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC5-B_S278_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JC5_S277_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JC5_S277_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC5_S277_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JC5_S277_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JL1-B_S280_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JL1-B_S280_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL1-B_S280_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL1-B_S280_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JL1_S279_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JL1_S279_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL1_S279_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL1_S279_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JL2-B_S282_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JL2-B_S282_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL2-B_S282_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL2-B_S282_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JL2_S281_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JL2_S281_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL2_S281_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL2_S281_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JL3-B_S284_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JL3-B_S284_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL3-B_S284_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL3-B_S284_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JL3_S283_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JL3_S283_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL3_S283_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL3_S283_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JL4-B_S286_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JL4-B_S286_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL4-B_S286_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL4-B_S286_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JL4_S285_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JL4_S285_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL4_S285_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL4_S285_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JL5-B_S288_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JL5-B_S288_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL5-B_S288_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL5-B_S288_L001_R2_001.fastq.gz
cutadapt -A AGATCGGAAGAGC -A CTGTCTCTTATACACATC -A TGGAATTCTCGGGTGCCAAGG -A AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -A AGATCGGAAGAGCACACGTCTGAAC -A AGATCGGAAGAGCGTCGTGTAGGGA -A AGATCGGAAGAGCACACGTCT -o $DATA_OUTPUT_V4_bacteria/JL5_S287_L001_R1_001.fastq.gz -p $DATA_OUTPUT_V4_bacteria/JL5_S287_L001_R2_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL5_S287_L001_R1_001.fastq.gz $DATA_DIRECTORY_V4_bacteria/JL5_S287_L001_R2_001.fastq.gz