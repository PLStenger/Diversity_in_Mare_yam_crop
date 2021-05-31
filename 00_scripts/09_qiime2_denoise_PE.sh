#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4/

# https://chmi-sops.github.io/mydoc_qiime2.html

# https://docs.qiime2.org/2021.2/plugins/available/dada2/denoise-single/
# Aim: denoises single-end sequences, dereplicates them, and filters
# chimeras and singletons sequences
# Use: qiime dada2 denoise-single [OPTIONS]

# DADA2 method

###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

# dada2_denoise :
#################

# Aim: denoises paired-end sequences, dereplicates them, and filters
#      chimeras and singletons sequences

# https://github.com/benjjneb/dada2/issues/477

qiime dada2 denoise-paired --i-demultiplexed-seqs demux.qza \
--o-table Table.qza  \
--o-representative-sequences RepSeq.qza \
--p-trim-left-f 6 \
--p-trim-left-r 6 \
--p-trunc-len-f 0 \
--p-trunc-len-r 0 \
--p-n-threads 20   

# sequence_contamination_filter :
#################################

# Aim: aligns feature sequences to a set of reference sequences
#      to identify sequences that hit/miss the reference
#      Use: qiime quality-control exclude-seqs [OPTIONS]

# 0.97 is the default (see https://docs.qiime2.org/2020.2/plugins/available/quality-control/exclude-seqs/)
# Whereas N. Fernandez put 1.00 but didn't work forward (" All features were filtered out of the data." error to the step "qiime feature-table filter-seqs")

# Here --i-reference-sequences correspond to the negative control sample (if you don't have any, like here, take another one from an old project, the one here is from the same sequencing line (but not same project))

qiime quality-control exclude-seqs --i-query-sequences RepSeq.qza \
      					     --i-reference-sequences /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Negative_control/ITS2/RepSeq.qza \
      					     --p-method vsearch \
      					     --p-threads 6 \
      					     --p-perc-identity 1.00 \
      					     --p-perc-query-aligned 1.00 \
      					     --o-sequence-hits HitNegCtrl.qza \
      					     --o-sequence-misses NegRepSeq.qza

# table_contamination_filter :
##############################

# Aim: filter features from table based on frequency and/or metadata
#      Use: qiime feature-table filter-features [OPTIONS]

# --p-exclude-ids: --p-no-exclude-ids If true, the samples selected by `metadata` or `where` parameters will be excluded from the filtered table instead of being retained. [default: False]:

qiime feature-table filter-features --i-table Table.qza \
     					      --m-metadata-file HitNegCtrl.qza \
     					      --o-filtered-table NegTable.qza \
     					      --p-exclude-ids

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
        					       --p-min-frequency 0 \
        					       --o-filtered-table ConTable.qza


# sequence_contingency_filter :
###############################

# Aim: Filter features from sequence based on table and/or metadata
       # Use: qiime feature-table filter-seqs [OPTIONS]

qiime feature-table filter-seqs --i-data NegRepSeq.qza \
      					  --i-table ConTable.qza \
      					  --o-filtered-data ConRepSeq.qza


# sequence_summarize :
######################

# Aim: Generate tabular view of feature identifier to sequence mapping
       # Use: qiime feature-table tabulate-seqs [OPTIONS]

qiime feature-table summarize --i-table Table.qza --o-visualization Table.qzv
qiime feature-table summarize --i-table ConTable.qza --o-visualization ConTable.qzv
qiime feature-table summarize --i-table NegTable.qza --o-visualization NegTable.qzv
qiime feature-table tabulate-seqs --i-data NegRepSeq.qza --o-visualization NegRepSeq.qzv
qiime feature-table tabulate-seqs --i-data RepSeq.qza --o-visualization RepSeq.qzv
qiime feature-table tabulate-seqs --i-data HitNegCtrl.qza --o-visualization HitNegCtrl.qzv

# table_summarize :
###################

qiime feature-table summarize --i-table Table.qza \
        --m-sample-metadata-file sample-metadata.tsv \
        --o-visualization Table.qzv

qiime feature-table summarize --i-table ConTable.qza \
        --m-sample-metadata-file sample-metadata.tsv \
        --o-visualization ConTable.qzv

qiime feature-table summarize --i-table NegTable.qza \
        --m-sample-metadata-file sample-metadata.tsv \
        --o-visualization NegTable.qzv


###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

# dada2_denoise :
#################

# Aim: denoises single-end sequences, dereplicates them, and filters
#      chimeras and singletons sequences
#      Use: qiime dada2 denoise-single [OPTIONS]

# ICI C'EST "#"é CAR DEJA FAIT ET CA PREND DU TEMPS À RUNNER; donc penser à dé-"#"ser si nouveau run complet
#qiime dada2 denoise-single --i-demultiplexed-seqs demux.qza \
#                           --p-n-threads 6 \
#                           --p-chimera-method 'consensus' \
#                           --p-trunc-len 0 \
#                           --p-trunc-q 0 \
#                           --o-representative-sequences RepSeq.qza \
#                           --o-table Table.qza \
#                           --o-denoising-stats Stats.qza

# sequence_contamination_filter :
#################################

# Aim: aligns feature sequences to a set of reference sequences
#      to identify sequences that hit/miss the reference
#      Use: qiime quality-control exclude-seqs [OPTIONS]

# Here --i-reference-sequences correspond to the negative control sample (if you don't have any, like here, take another one from an old project, the one here is from the same sequencing line (but not same project))

qiime quality-control exclude-seqs --i-query-sequences RepSeq.qza \
      					     --i-reference-sequences /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Negative_control/V4/RepSeq.qza \
      					     --p-method vsearch \
      					     --p-threads 6 \
      					     --p-perc-identity 1.00 \
      					     --p-perc-query-aligned 1.00 \
      					     --o-sequence-hits HitNegCtrl.qza \
      					     --o-sequence-misses NegRepSeq.qza

# table_contamination_filter :
##############################

# Aim: filter features from table based on frequency and/or metadata
#      Use: qiime feature-table filter-features [OPTIONS]

qiime feature-table filter-features --i-table Table.qza \
     					      --m-metadata-file HitNegCtrl.qza \
     					      --o-filtered-table NegTable.qza \
     					      --p-exclude-ids

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
        					       --p-min-frequency 0 \
        					       --o-filtered-table ConTable.qza


# sequence_contingency_filter :
###############################

# Aim: Filter features from sequence based on table and/or metadata
       # Use: qiime feature-table filter-seqs [OPTIONS]

qiime feature-table filter-seqs --i-data NegRepSeq.qza \
      					  --i-table ConTable.qza \
      					  --o-filtered-data ConRepSeq.qza


# sequence_summarize :
######################

# Aim: Generate tabular view of feature identifier to sequence mapping
       # Use: qiime feature-table tabulate-seqs [OPTIONS]

qiime feature-table summarize --i-table Table.qza --o-visualization Table.qzv
qiime feature-table summarize --i-table ConTable.qza --o-visualization ConTable.qzv
qiime feature-table summarize --i-table NegTable.qza --o-visualization NegTable.qzv
qiime feature-table tabulate-seqs --i-data NegRepSeq.qza --o-visualization NegRepSeq.qzv
qiime feature-table tabulate-seqs --i-data RepSeq.qza --o-visualization RepSeq.qzv
qiime feature-table tabulate-seqs --i-data HitNegCtrl.qza --o-visualization HitNegCtrl.qzv

# table_summarize :
###################

qiime feature-table summarize --i-table Table.qza \
        --m-sample-metadata-file sample-metadata.tsv \
        --o-visualization Table.qzv

qiime feature-table summarize --i-table ConTable.qza \
        --m-sample-metadata-file sample-metadata.tsv \
        --o-visualization ConTable.qzv

qiime feature-table summarize --i-table NegTable.qza \
        --m-sample-metadata-file sample-metadata.tsv \
        --o-visualization NegTable.qzv
