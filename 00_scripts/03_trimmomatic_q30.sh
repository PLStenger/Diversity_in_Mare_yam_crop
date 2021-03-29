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

SCRIPT=$0
HEADER=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/99_softwares/header.txt
TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
LOG_FOLDER=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_log_files/
NAME=$(basename $0)

#cd $PBS_O_WORKDIR
cd $DATADIRECTORY

base=__BASE__
cp $SCRIPT $LOG_FOLDER/"$TIMESTAMP"_"$NAME"


# For fungi :
#for base in $(ls $DATADIRECTORY_ITS2_fungi/*.fastq.gz)
#do

trimmomatic PE -Xmx60G \
        -threads 8 \
        -phred33 \
        $DATADIRECTORY_ITS2_fungi/"$base"_R1_001.fastq.gz \ 
        $DATADIRECTORY_ITS2_fungi/"$base"_R2_001.fastq.gz \
        $DATAOUTPUT_ITS2_fungi/"$base"_R1.paired.fastq.gz \
        $DATAOUTPUT_ITS2_fungi/"$base"_R1.single.fastq.gz \
        $DATAOUTPUT_ITS2_fungi/"$base"_R2.paired.fastq.gz \
        $DATAOUTPUT_ITS2_fungi/"$base"_R2.single.fastq.gz \
        ILLUMINACLIP:"$ADAPTERbase":2:30:10 \ #Cut adapter and other illumina-specific sequences from the read.
        LEADING:30 \ # Cut bases off the start of a read, if below a threshold quality
        TRAILING:30 \ # Cut bases off the end of a read, if below a threshold quality
        SLIDINGWINDOW:26:30 \ # Performs a sliding window trimming approach. It starts scanning at the 5‟ end and clips the read once the average quality within the window falls below a threshold.
        MINLEN:150  # Drop the read if it is below a specified length
        
#done

# For bacteria :
#for base in $(ls $DATADIRECTORY_V4_bacteria/*.fastq.gz)
#do

trimmomatic PE -Xmx60G \
        -threads 8 \
        -phred33 \
        $DATADIRECTORY_V4_bacteria/"$base"_R1_001.fastq.gz \ 
        $DATADIRECTORY_V4_bacteria/"$base"_R2_001.fastq.gz \
        $DATAOUTPUT_V4_bacteria/"$base"_R1.paired.fastq.gz \
        $DATAOUTPUT_V4_bacteria/"$base"_R1.single.fastq.gz \
        $DATAOUTPUT_V4_bacteria/"$base"_R2.paired.fastq.gz \
        $DATAOUTPUT_V4_bacteria/"$base"_R2.single.fastq.gz \
        ILLUMINACLIP:"$ADAPTERbase":2:30:10 \ #Cut adapter and other illumina-specific sequences from the read.
        LEADING:30 \ # Cut bases off the start of a read, if below a threshold quality
        TRAILING:30 \ # Cut bases off the end of a read, if below a threshold quality
        SLIDINGWINDOW:26:30 \ # Performs a sliding window trimming approach. It starts scanning at the 5‟ end and clips the read once the average quality within the window falls below a threshold.
        MINLEN:150  # Drop the read if it is below a specified length
        
#done



