#!/usr/bin/env bash

# trimmomatic version 0.39
# trimmomatic manual : http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/00_raw_data/ITS2_fungi
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/00_raw_data/V4_bacteria
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

#SCRIPT=$0
#HEADER=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/99_softwares/header.txt
#TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
#LOG_FOLDER=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_log_files/
#NAME=$(basename $0)

# For fungi :
cd $DATADIRECTORY_ITS2_fungi

ls *_001.fastq.gz > list.txt
sed 's/_R1_001.fastq.gz//g' list.txt > list_02.txt
sed 's/_R2_001.fastq.gz//g' list_02.txt > list_03.txt
sort -u list_03.txt > list_04.txt # keep unnique values

#for FILE in $(ls $DATADIRECTORY_ITS2_fungi/*.fastq.gz)
#for FILE in $($DATADIRECTORY_ITS2_fungi/list_04.txt)
while IFS='' read -r LINE || [ -n "${LINE}" ];
do

trimmomatic PE -Xmx60G \
        -threads 8 \
        -phred33 \
        $DATADIRECTORY_ITS2_fungi/"${LINE}"_R1_001.fastq.gz \ 
        $DATADIRECTORY_ITS2_fungi/"${LINE}"_R2_001.fastq.gz \
        $DATAOUTPUT_ITS2_fungi/"${LINE}"_R1.paired.fastq.gz \
        $DATAOUTPUT_ITS2_fungi/"${LINE}"_R1.single.fastq.gz \
        $DATAOUTPUT_ITS2_fungi/"${LINE}"_R2.paired.fastq.gz \
        $DATAOUTPUT_ITS2_fungi/"${LINE}"_R2.single.fastq.gz \
        ILLUMINACLIP:"$ADAPTERFILE":2:30:10 \
        LEADING:30 \
        TRAILING:30 \
        SLIDINGWINDOW:26:30 \
        MINLEN:150
        
done < list_04.txt

# For bacteria :
#
#ls *_001.fastq.gz > list.txt
#sed 's/_R1_001.fastq.gz//g' list.txt > list_02.txt
#sed 's/_R2_001.fastq.gz//g' list_02.txt > list_03.txt
#sort -u list_03.txt > list_04.txt # keep unnique values
#
#cd $DATADIRECTORY_V4_bacteria
#
#for FILE in $($DATADIRECTORY_V4_bacteria/list_04.txt)
#do
#
#trimmomatic PE -Xmx60G \
#        -threads 8 \
#        -phred33 \
#        $DATADIRECTORY_V4_bacteria/"$FILE"_R1_001.fastq.gz \ 
#        $DATADIRECTORY_V4_bacteria/"$FILE"_R2_001.fastq.gz \
#        $DATAOUTPUT_V4_bacteria/"$FILE"_R1.paired.fastq.gz \
#        $DATAOUTPUT_V4_bacteria/"$FILE"_R1.single.fastq.gz \
#        $DATAOUTPUT_V4_bacteria/"$FILE"_R2.paired.fastq.gz \
#        $DATAOUTPUT_V4_bacteria/"$FILE"_R2.single.fastq.gz \
#        ILLUMINACLIP:"$ADAPTERFILE":2:30:10 \ #Cut adapter and other illumina-specific sequences from the read.
#        LEADING:30 \ # Cut FILEs off the start of a read, if below a threshold quality
#        TRAILING:30 \ # Cut FILEs off the end of a read, if below a threshold quality
#        SLIDINGWINDOW:26:30 \ # Performs a sliding window trimming approach. It starts scanning at the 5‟ end and clips the read once the average quality within the window falls below a threshold.
#        MINLEN:150  # Drop the read if it is below a specified length
#        
#done



