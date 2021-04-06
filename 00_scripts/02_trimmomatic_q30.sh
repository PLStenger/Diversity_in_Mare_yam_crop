#!/usr/bin/env bash

# trimmomatic version 0.39
# trimmomatic manual : http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/00_raw_data/ITS2_fungi
#DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/00_raw_data/V4_bacteria
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/01_pooled/V4_bacteria/
DATAOUTPUT_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_ITS2_fungi
DATAOUTPUT_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria

ADAPTERFILE=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/99_softwares/adapters_sequences.fasta
# cat $ADAPTERFILE
#>Illumina_TruSeq_LT_R1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC
#>Illumina_TruSeq_LT_R2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT
#>truseq AGATCGGAAGAGC
#>nextera CTGTCTCTTATACACATC
#>small TGGAATTCTCGGGTGCCAAGG
#>ScriptSeqR1 AGATCGGAAGAGCACACGTCTGAAC
#>ScriptSeqR2 AGATCGGAAGAGCGTCGTGTAGGGA
#>TruSeqRibo AGATCGGAAGAGCACACGTCT

# Arguments :
# ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150

## For fungi :
#cd $DATADIRECTORY_ITS2_fungi
#
##ls *_001.fastq.gz > list.txt
##sed 's/_R1_001.fastq.gz//g' list.txt > list_02.txt
##sed 's/_R2_001.fastq.gz//g' list_02.txt > list_03.txt
##sort -u list_03.txt > list_04.txt # keep unnique values
#
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F1-B_S244_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/F1-B_S244_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/F1-B_S244_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F1-B_S244_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F1-B_S244_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F1-B_S244_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F1_S243_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/F1_S243_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/F1_S243_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F1_S243_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F1_S243_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F1_S243_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F2-B_S246_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/F2-B_S246_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/F2-B_S246_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F2-B_S246_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F2-B_S246_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F2-B_S246_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F2_S245_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/F2_S245_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/F2_S245_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F2_S245_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F2_S245_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F2_S245_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F3-B_S248_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/F3-B_S248_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/F3-B_S248_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F3-B_S248_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F3-B_S248_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F3-B_S248_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F3_S247_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/F3_S247_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/F3_S247_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F3_S247_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F3_S247_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F3_S247_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F4-B_S250_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/F4-B_S250_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/F4-B_S250_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F4-B_S250_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F4-B_S250_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F4-B_S250_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F4_S249_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/F4_S249_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/F4_S249_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F4_S249_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F4_S249_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F4_S249_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F5-B_S252_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/F5-B_S252_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/F5-B_S252_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F5-B_S252_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F5-B_S252_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F5-B_S252_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F5_S251_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/F5_S251_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/F5_S251_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F5_S251_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F5_S251_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F5_S251_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC1-B_S254_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JC1-B_S254_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JC1-B_S254_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC1-B_S254_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC1-B_S254_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC1-B_S254_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC1_S253_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JC1_S253_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JC1_S253_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC1_S253_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC1_S253_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC1_S253_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC2-B_S256_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JC2-B_S256_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JC2-B_S256_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC2-B_S256_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC2-B_S256_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC2-B_S256_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC2_S255_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JC2_S255_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JC2_S255_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC2_S255_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC2_S255_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC2_S255_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC3-B_S274_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JC3-B_S274_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JC3-B_S274_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC3-B_S274_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC3-B_S274_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC3-B_S274_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC3_S273_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JC3_S273_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JC3_S273_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC3_S273_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC3_S273_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC3_S273_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC4-B_S276_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JC4-B_S276_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JC4-B_S276_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC4-B_S276_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC4-B_S276_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC4-B_S276_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC4_S275_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JC4_S275_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JC4_S275_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC4_S275_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC4_S275_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC4_S275_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC5-B_S278_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JC5-B_S278_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JC5-B_S278_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC5-B_S278_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC5-B_S278_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC5-B_S278_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC5_S277_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JC5_S277_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JC5_S277_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC5_S277_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC5_S277_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC5_S277_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL1-B_S280_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JL1-B_S280_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JL1-B_S280_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL1-B_S280_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL1-B_S280_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL1-B_S280_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL1_S279_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JL1_S279_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JL1_S279_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL1_S279_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL1_S279_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL1_S279_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL2-B_S282_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JL2-B_S282_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JL2-B_S282_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL2-B_S282_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL2-B_S282_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL2-B_S282_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL2_S281_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JL2_S281_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JL2_S281_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL2_S281_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL2_S281_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL2_S281_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL3-B_S284_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JL3-B_S284_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JL3-B_S284_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL3-B_S284_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL3-B_S284_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL3-B_S284_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL3_S283_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JL3_S283_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JL3_S283_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL3_S283_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL3_S283_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL3_S283_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL4-B_S286_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JL4-B_S286_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JL4-B_S286_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL4-B_S286_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL4-B_S286_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL4-B_S286_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL4_S285_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JL4_S285_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JL4_S285_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL4_S285_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL4_S285_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL4_S285_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL5-B_S288_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JL5-B_S288_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JL5-B_S288_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL5-B_S288_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL5-B_S288_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL5-B_S288_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL5_S287_L001_R1_001.fastq.gz $DATADIRECTORY_ITS2_fungi/JL5_S287_L001_R2_001.fastq.gz $DATAOUTPUT_ITS2_fungi/JL5_S287_L001_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL5_S287_L001_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL5_S287_L001_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL5_S287_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150


# For bacteria :

cd $DATADIRECTORY_V4_bacteria

trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F1_S243_R1.fastq.gz $DATADIRECTORY_V4_bacteria/F1_S243_R2.fastq.gz $DATAOUTPUT_V4_bacteria/F1_S243_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F1_S243_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F1_S243_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F1_S243_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F2_S245_R1.fastq.gz $DATADIRECTORY_V4_bacteria/F2_S245_R2.fastq.gz $DATAOUTPUT_V4_bacteria/F2_S245_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F2_S245_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F2_S245_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F2_S245_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F3_S247_R1.fastq.gz $DATADIRECTORY_V4_bacteria/F3_S247_R2.fastq.gz $DATAOUTPUT_V4_bacteria/F3_S247_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F3_S247_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F3_S247_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F3_S247_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F4_S249_R1.fastq.gz $DATADIRECTORY_V4_bacteria/F4_S249_R2.fastq.gz $DATAOUTPUT_V4_bacteria/F4_S249_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F4_S249_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F4_S249_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F4_S249_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F5_S251_R1.fastq.gz $DATADIRECTORY_V4_bacteria/F5_S251_R2.fastq.gz $DATAOUTPUT_V4_bacteria/F5_S251_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F5_S251_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F5_S251_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F5_S251_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC1_S253_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JC1_S253_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JC1_S253_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC1_S253_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC1_S253_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC1_S253_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC2_S255_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JC2_S255_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JC2_S255_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC2_S255_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC2_S255_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC2_S255_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC3_S273_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JC3_S273_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JC3_S273_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC3_S273_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC3_S273_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC3_S273_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC4_S275_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JC4_S275_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JC4_S275_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC4_S275_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC4_S275_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC4_S275_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC5_S277_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JC5_S277_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JC5_S277_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC5_S277_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC5_S277_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC5_S277_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL1_S279_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JL1_S279_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JL1_S279_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL1_S279_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL1_S279_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL1_S279_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL2_S281_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JL2_S281_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JL2_S281_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL2_S281_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL2_S281_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL2_S281_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL3_S283_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JL3_S283_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JL3_S283_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL3_S283_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL3_S283_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL3_S283_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL4_S285_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JL4_S285_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JL4_S285_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL4_S285_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL4_S285_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL4_S285_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL5_S287_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JL5_S287_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JL5_S287_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL5_S287_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL5_S287_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL5_S287_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150



#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F1-B_S244_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/F1-B_S244_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/F1-B_S244_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F1-B_S244_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F1-B_S244_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F1-B_S244_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F1_S243_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/F1_S243_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/F1_S243_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F1_S243_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F1_S243_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F1_S243_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F2-B_S246_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/F2-B_S246_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/F2-B_S246_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F2-B_S246_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F2-B_S246_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F2-B_S246_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F2_S245_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/F2_S245_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/F2_S245_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F2_S245_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F2_S245_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F2_S245_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F3-B_S248_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/F3-B_S248_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/F3-B_S248_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F3-B_S248_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F3-B_S248_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F3-B_S248_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F3_S247_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/F3_S247_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/F3_S247_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F3_S247_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F3_S247_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F3_S247_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F4-B_S250_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/F4-B_S250_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/F4-B_S250_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F4-B_S250_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F4-B_S250_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F4-B_S250_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F4_S249_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/F4_S249_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/F4_S249_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F4_S249_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F4_S249_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F4_S249_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F5-B_S252_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/F5-B_S252_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/F5-B_S252_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F5-B_S252_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F5-B_S252_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F5-B_S252_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F5_S251_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/F5_S251_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/F5_S251_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F5_S251_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F5_S251_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F5_S251_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC1-B_S254_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JC1-B_S254_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JC1-B_S254_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC1-B_S254_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC1-B_S254_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC1-B_S254_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC1_S253_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JC1_S253_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JC1_S253_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC1_S253_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC1_S253_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC1_S253_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC2-B_S256_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JC2-B_S256_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JC2-B_S256_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC2-B_S256_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC2-B_S256_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC2-B_S256_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC2_S255_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JC2_S255_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JC2_S255_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC2_S255_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC2_S255_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC2_S255_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC3-B_S274_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JC3-B_S274_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JC3-B_S274_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC3-B_S274_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC3-B_S274_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC3-B_S274_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC3_S273_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JC3_S273_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JC3_S273_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC3_S273_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC3_S273_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC3_S273_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC4-B_S276_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JC4-B_S276_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JC4-B_S276_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC4-B_S276_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC4-B_S276_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC4-B_S276_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC4_S275_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JC4_S275_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JC4_S275_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC4_S275_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC4_S275_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC4_S275_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC5-B_S278_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JC5-B_S278_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JC5-B_S278_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC5-B_S278_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC5-B_S278_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC5-B_S278_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC5_S277_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JC5_S277_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JC5_S277_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC5_S277_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC5_S277_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC5_S277_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL1-B_S280_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JL1-B_S280_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JL1-B_S280_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL1-B_S280_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL1-B_S280_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL1-B_S280_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL1_S279_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JL1_S279_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JL1_S279_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL1_S279_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL1_S279_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL1_S279_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL2-B_S282_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JL2-B_S282_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JL2-B_S282_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL2-B_S282_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL2-B_S282_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL2-B_S282_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL2_S281_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JL2_S281_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JL2_S281_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL2_S281_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL2_S281_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL2_S281_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL3-B_S284_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JL3-B_S284_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JL3-B_S284_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL3-B_S284_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL3-B_S284_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL3-B_S284_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL3_S283_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JL3_S283_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JL3_S283_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL3_S283_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL3_S283_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL3_S283_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL4-B_S286_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JL4-B_S286_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JL4-B_S286_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL4-B_S286_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL4-B_S286_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL4-B_S286_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL4_S285_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JL4_S285_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JL4_S285_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL4_S285_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL4_S285_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL4_S285_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL5-B_S288_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JL5-B_S288_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JL5-B_S288_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL5-B_S288_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL5-B_S288_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL5-B_S288_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL5_S287_L001_R1_001.fastq.gz $DATADIRECTORY_V4_bacteria/JL5_S287_L001_R2_001.fastq.gz $DATAOUTPUT_V4_bacteria/JL5_S287_L001_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL5_S287_L001_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL5_S287_L001_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL5_S287_L001_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150


# Old test

#while IFS='' read -r LINE || [ -n "${LINE}" ];
#do
#
#trimmomatic PE -Xmx60G \
#        -threads 8 \
#        -phred33 \
#        $DATADIRECTORY_ITS2_fungi/"${LINE}"_R1_001.fastq.gz \ 
#        $DATADIRECTORY_ITS2_fungi/"${LINE}"_R2_001.fastq.gz \
#        $DATAOUTPUT_ITS2_fungi/"${LINE}"_R1.paired.fastq.gz \
#        $DATAOUTPUT_ITS2_fungi/"${LINE}"_R1.single.fastq.gz \
#        $DATAOUTPUT_ITS2_fungi/"${LINE}"_R2.paired.fastq.gz \
#        $DATAOUTPUT_ITS2_fungi/"${LINE}"_R2.single.fastq.gz \
#        ILLUMINACLIP:"$ADAPTERFILE":2:30:10 \
#        LEADING:30 \
#        TRAILING:30 \
#        SLIDINGWINDOW:26:30 \
#        MINLEN:150
#        
#done < list_04.txt


