#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/V4/

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

# sequence_contamination_filter :
#################################

# Aim: aligns feature sequences to a set of reference sequences
#      to identify sequences that hit/miss the reference
#      Use: qiime quality-control exclude-seqs [OPTIONS]

# 0.97 is the default (see https://docs.qiime2.org/2020.2/plugins/available/quality-control/exclude-seqs/)
# Whereas N. Fernandez put 1.00 but didn't work forward (" All features were filtered out of the data." error to the step "qiime feature-table filter-seqs")

qiime quality-control exclude-seqs --i-query-sequences RepSeq.qza \
      					     --i-reference-sequences RepSeq.qza \
      					     --p-method vsearch \
      					     --p-threads 6 \
      					     --p-perc-identity 0.97 \
      					     --p-perc-query-aligned 0.97 \
      					     --o-sequence-hits HitNegCtrl.qza \
      					     --o-sequence-misses NegRepSeq.qza


# table_contamination_filter :
##############################

# Aim: filter features from table based on frequency and/or metadata
#      Use: qiime feature-table filter-features [OPTIONS]

# --p-exclude-ids: --p-no-exclude-ids If true, the samples selected by `metadata` or `where` parameters will be excluded from the filtered table instead of being retained. [default: False]:

qiime feature-table filter-features --i-table Table.qza \
     					      --m-metadata-file HitNegCtrl.qza \
     					      --o-filtered-table NegTable.qza


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
qiime feature-table tabulate-seqs --i-data NegRepSeq.qza --o-visualization NegRepSeq.qzv
qiime feature-table tabulate-seqs --i-data RepSeq.qza --o-visualization RepSeq.qzv
qiime feature-table tabulate-seqs --i-data HitNegCtrl.qza --o-visualization HitNegCtrl.qzv



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

