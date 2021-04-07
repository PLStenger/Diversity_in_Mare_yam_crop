#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_ITS2_fungi
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria

# For fungi
cd $DATADIRECTORY_ITS2_fungi

fastq-join F1_S243_R1.paired.fastq.gz F1_S243_R2.paired.fastq.gz -o F1_S243_joined.fastq.gz
fastq-join F2_S245_R1.paired.fastq.gz F2_S245_R2.paired.fastq.gz -o F2_S245_joined.fastq.gz
fastq-join F3_S247_R1.paired.fastq.gz F3_S247_R2.paired.fastq.gz -o F3_S247_joined.fastq.gz
fastq-join F4_S249_R1.paired.fastq.gz F4_S249_R2.paired.fastq.gz -o F4_S249_joined.fastq.gz
fastq-join F5_S251_R1.paired.fastq.gz F5_S251_R2.paired.fastq.gz -o F5_S251_joined.fastq.gz
fastq-join JC1_S253_R1.paired.fastq.gz JC1_S253_R2.paired.fastq.gz -o JC1_S253_joined.fastq.gz
fastq-join JC2_S255_R1.paired.fastq.gz JC2_S255_R2.paired.fastq.gz -o JC2_S255_joined.fastq.gz
fastq-join JC3_S273_R1.paired.fastq.gz JC3_S273_R2.paired.fastq.gz -o JC3_S273_joined.fastq.gz
fastq-join JC4_S275_R1.paired.fastq.gz JC4_S275_R2.paired.fastq.gz -o JC4_S275_joined.fastq.gz
fastq-join JC5_S277_R1.paired.fastq.gz JC5_S277_R2.paired.fastq.gz -o JC5_S277_joined.fastq.gz
fastq-join JL1_S279_R1.paired.fastq.gz JL1_S279_R2.paired.fastq.gz -o JL1_S279_joined.fastq.gz
fastq-join JL2_S281_R1.paired.fastq.gz JL2_S281_R2.paired.fastq.gz -o JL2_S281_joined.fastq.gz
fastq-join JL3_S283_R1.paired.fastq.gz JL3_S283_R2.paired.fastq.gz -o JL3_S283_joined.fastq.gz
fastq-join JL4_S285_R1.paired.fastq.gz JL4_S285_R2.paired.fastq.gz -o JL4_S285_joined.fastq.gz
fastq-join JL5_S287_R1.paired.fastq.gz JL5_S287_R2.paired.fastq.gz -o JL5_S287_joined.fastq.gz

# For bacteria 
cd $DATADIRECTORY_V4_bacteria

fastq-join F1_S243_R1.paired.fastq.gz F1_S243_R2.paired.fastq.gz -o F1_S243_joined.fastq.gz
fastq-join F2_S245_R1.paired.fastq.gz F2_S245_R2.paired.fastq.gz -o F2_S245_joined.fastq.gz
fastq-join F3_S247_R1.paired.fastq.gz F3_S247_R2.paired.fastq.gz -o F3_S247_joined.fastq.gz
fastq-join F4_S249_R1.paired.fastq.gz F4_S249_R2.paired.fastq.gz -o F4_S249_joined.fastq.gz
fastq-join F5_S251_R1.paired.fastq.gz F5_S251_R2.paired.fastq.gz -o F5_S251_joined.fastq.gz
fastq-join JC1_S253_R1.paired.fastq.gz JC1_S253_R2.paired.fastq.gz -o JC1_S253_joined.fastq.gz
fastq-join JC2_S255_R1.paired.fastq.gz JC2_S255_R2.paired.fastq.gz -o JC2_S255_joined.fastq.gz
fastq-join JC3_S273_R1.paired.fastq.gz JC3_S273_R2.paired.fastq.gz -o JC3_S273_joined.fastq.gz
fastq-join JC4_S275_R1.paired.fastq.gz JC4_S275_R2.paired.fastq.gz -o JC4_S275_joined.fastq.gz
fastq-join JC5_S277_R1.paired.fastq.gz JC5_S277_R2.paired.fastq.gz -o JC5_S277_joined.fastq.gz
fastq-join JL1_S279_R1.paired.fastq.gz JL1_S279_R2.paired.fastq.gz -o JL1_S279_joined.fastq.gz
fastq-join JL2_S281_R1.paired.fastq.gz JL2_S281_R2.paired.fastq.gz -o JL2_S281_joined.fastq.gz
fastq-join JL3_S283_R1.paired.fastq.gz JL3_S283_R2.paired.fastq.gz -o JL3_S283_joined.fastq.gz
fastq-join JL4_S285_R1.paired.fastq.gz JL4_S285_R2.paired.fastq.gz -o JL4_S285_joined.fastq.gz
fastq-join JL5_S287_R1.paired.fastq.gz JL5_S287_R2.paired.fastq.gz -o JL5_S287_joined.fastq.gz


