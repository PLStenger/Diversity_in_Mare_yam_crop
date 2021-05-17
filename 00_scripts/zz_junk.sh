#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/V4/

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10


# table_contingency_filter :
############################

# Aim: filter features that show up in only one samples, based on
#      the suspicion that these may not represent real biological diversity
#      but rather PCR or sequencing errors (such as PCR chimeras)
#      Use: qiime feature-table filter-features [OPTIONS]

# contingency:
    # min_obs: 2  # Remove features that are present in only a single sample !
    # min_freq: 0 # Remove features with a total abundance (summed across all samples) of less than 0 !


qiime feature-table filter-features  --i-table NegTable.qza \
        					       --p-min-samples 2 \
        					       --o-filtered-table ConTable.qza

qiime feature-table summarize --i-table ConTable.qza --o-visualization ConTable.qzv
qiime feature-table summarize --i-table NegTable.qza --o-visualization NegTable.qzv


# sequence_contingency_filter :
###############################

# Aim: Filter features from sequence based on table and/or metadata
       # Use: qiime feature-table filter-seqs [OPTIONS]

#qiime feature-table filter-seqs --i-data NegRepSeq.qza \
#      					  --i-table ConTable.qza \
#      					  --o-filtered-data ConRepSeq.qza \
#                  --output-dir /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/out

qiime feature-table filter-seqs --i-data NegRepSeq.qza --i-table ConTable.qza --o-filtered-data ConRepSeq.qza

qiime feature-table summarize --i-table ConRepSeq.qza --o-visualization ConRepSeq.qzv

