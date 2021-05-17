#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/V4/

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10


# sequence_contingency_filter :
###############################

# Aim: Filter features from sequence based on table and/or metadata
       # Use: qiime feature-table filter-seqs [OPTIONS]

#qiime feature-table filter-seqs --i-data NegRepSeq.qza \
#      					  --i-table ConTable.qza \
#      					  --o-filtered-data ConRepSeq.qza \
#                  --output-dir /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/out

qiime feature-table filter-seqs --i-data NegRepSeq.qza --i-table ConTable.qza --o-filtered-data ConRepSeq.qza


