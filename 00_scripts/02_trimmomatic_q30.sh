#!/usr/bin/env bash

# trimmomatic version 0.39
# trimmomatic manual : http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf

# pathways in cluster:
DATADIRECTORY_ITS2_fungi=/home/fungi/Diversity_in_Mare_yam_crop/01_pooled/ITS2_fungi
DATADIRECTORY_V4_bacteria=/home/fungi/Diversity_in_Mare_yam_crop/01_pooled/V4_bacteria
DATAOUTPUT_ITS2_fungi=/home/fungi/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_ITS2_fungi
DATAOUTPUT_V4_bacteria=/home/fungi/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria

# pathways in local:
#DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/01_pooled/ITS2_fungi
#DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/01_pooled/V4_bacteria
#DATAOUTPUT_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_ITS2_fungi
#DATAOUTPUT_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria

conda activate trimmomatic

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

cd $DATADIRECTORY_ITS2_fungi

trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F1_S243_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/F1_S243_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/F1_S243_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F1_S243_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F1_S243_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F1_S243_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F2_S245_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/F2_S245_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/F2_S245_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F2_S245_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F2_S245_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F2_S245_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F3_S247_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/F3_S247_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/F3_S247_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F3_S247_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F3_S247_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F3_S247_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F4_S249_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/F4_S249_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/F4_S249_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F4_S249_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F4_S249_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F4_S249_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/F5_S251_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/F5_S251_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/F5_S251_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F5_S251_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/F5_S251_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/F5_S251_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC1_S253_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/JC1_S253_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/JC1_S253_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC1_S253_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC1_S253_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC1_S253_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC2_S255_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/JC2_S255_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/JC2_S255_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC2_S255_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC2_S255_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC2_S255_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC3_S273_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/JC3_S273_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/JC3_S273_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC3_S273_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC3_S273_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC3_S273_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC4_S275_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/JC4_S275_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/JC4_S275_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC4_S275_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC4_S275_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC4_S275_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JC5_S277_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/JC5_S277_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/JC5_S277_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC5_S277_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JC5_S277_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JC5_S277_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL1_S279_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/JL1_S279_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/JL1_S279_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL1_S279_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL1_S279_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL1_S279_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL2_S281_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/JL2_S281_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/JL2_S281_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL2_S281_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL2_S281_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL2_S281_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL3_S283_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/JL3_S283_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/JL3_S283_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL3_S283_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL3_S283_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL3_S283_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL4_S285_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/JL4_S285_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/JL4_S285_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL4_S285_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL4_S285_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL4_S285_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS2_fungi/JL5_S287_R1.fastq.gz $DATADIRECTORY_ITS2_fungi/JL5_S287_R2.fastq.gz $DATAOUTPUT_ITS2_fungi/JL5_S287_R1.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL5_S287_R1.single.fastq.gz $DATAOUTPUT_ITS2_fungi/JL5_S287_R2.paired.fastq.gz $DATAOUTPUT_ITS2_fungi/JL5_S287_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150


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



# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F1_S243_R1.fastq.gz $DATADIRECTORY_V4_bacteria/F1_S243_R2.fastq.gz $DATAOUTPUT_V4_bacteria/F1_S243_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F1_S243_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F1_S243_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F1_S243_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F2_S245_R1.fastq.gz $DATADIRECTORY_V4_bacteria/F2_S245_R2.fastq.gz $DATAOUTPUT_V4_bacteria/F2_S245_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F2_S245_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F2_S245_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F2_S245_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F3_S247_R1.fastq.gz $DATADIRECTORY_V4_bacteria/F3_S247_R2.fastq.gz $DATAOUTPUT_V4_bacteria/F3_S247_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F3_S247_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F3_S247_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F3_S247_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F4_S249_R1.fastq.gz $DATADIRECTORY_V4_bacteria/F4_S249_R2.fastq.gz $DATAOUTPUT_V4_bacteria/F4_S249_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F4_S249_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F4_S249_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F4_S249_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/F5_S251_R1.fastq.gz $DATADIRECTORY_V4_bacteria/F5_S251_R2.fastq.gz $DATAOUTPUT_V4_bacteria/F5_S251_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F5_S251_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/F5_S251_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/F5_S251_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC1_S253_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JC1_S253_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JC1_S253_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC1_S253_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC1_S253_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC1_S253_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC2_S255_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JC2_S255_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JC2_S255_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC2_S255_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC2_S255_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC2_S255_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC3_S273_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JC3_S273_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JC3_S273_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC3_S273_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC3_S273_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC3_S273_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC4_S275_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JC4_S275_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JC4_S275_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC4_S275_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC4_S275_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC4_S275_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JC5_S277_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JC5_S277_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JC5_S277_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC5_S277_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JC5_S277_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JC5_S277_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL1_S279_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JL1_S279_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JL1_S279_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL1_S279_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL1_S279_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL1_S279_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL2_S281_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JL2_S281_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JL2_S281_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL2_S281_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL2_S281_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL2_S281_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL3_S283_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JL3_S283_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JL3_S283_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL3_S283_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL3_S283_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL3_S283_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL4_S285_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JL4_S285_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JL4_S285_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL4_S285_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL4_S285_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL4_S285_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
# trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_V4_bacteria/JL5_S287_R1.fastq.gz $DATADIRECTORY_V4_bacteria/JL5_S287_R2.fastq.gz $DATAOUTPUT_V4_bacteria/JL5_S287_R1.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL5_S287_R1.single.fastq.gz $DATAOUTPUT_V4_bacteria/JL5_S287_R2.paired.fastq.gz $DATAOUTPUT_V4_bacteria/JL5_S287_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150


