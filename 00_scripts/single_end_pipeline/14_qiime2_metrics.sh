#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/V4/


###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

# core_metrics_phylogenetic:
############################
    # Aim: Applies a collection of diversity metrics to a feature table
    # Use: qiime diversity core-metrics-phylogenetic [OPTIONS]

    # in qiime diversity core-metrics-phylogenetic :
    #        --p-n-jobs {params.jobs} \

qiime diversity core-metrics-phylogenetic \
       --i-phylogeny rooted-tree.qza \
       --i-table ConTable.qza \
       --p-sampling-depth 21618 \
       --m-metadata-file sample-metadata.tsv \
       --o-rarefied-table RarTable.qza \
       --o-observed-otus-vector Vector-observed_asv.qza \
       --o-shannon-vector Vector-shannon.qza \
       --o-evenness-vector Vector-evenness.qza \
       --o-faith-pd-vector Vector-faith_pd.qza \
       --o-jaccard-distance-matrix Matrix-jaccard.qza \
       --o-bray-curtis-distance-matrix Matrix-braycurtis.qza \
       --o-unweighted-unifrac-distance-matrix Matrix-unweighted_unifrac.qza \
       --o-weighted-unifrac-distance-matrix Matrix-weighted_unifrac.qza \
       --o-jaccard-pcoa-results PCoA-jaccard.qza \
       --o-bray-curtis-pcoa-results PCoA-braycurtis.qza \
       --o-unweighted-unifrac-pcoa-results PCoA-unweighted_unifrac.qza \
       --o-weighted-unifrac-pcoa-results PCoA-weighted_unifrac.qza \
       --o-jaccard-emperor /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/visual/Emperor-jaccard.qzv \        
       --o-bray-curtis-emperor /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/visual/Emperor-braycurtis.qzv \
       --o-unweighted-unifrac-emperor /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/visual/Emperor-unweighted_unifrac.qzv \
       --o-weighted-unifrac-emperor /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/visual/Emperor-weighted_unifrac.qzv

# sequence_rarefaction_filter:
##############################

# Aim: Filter features from sequences based on a feature table or metadata.
# Use: qiime feature-table filter-seqs [OPTIONS]

qiime feature-table filter-seqs \
        --i-data ConRepSeq.qza \
        --i-table RarTable.qza \
        --o-filtered-data RarRepSeq.qza

# summarize_sequence:
#####################

qiime feature-table tabulate-seqs \
       --i-data RarRepSeq.qza \
       --o-visualization RarRepSeq.qzv

# summarize_table :
##################

# Aim: Generate visual and tabular summaries of a feature table
# Use: qiime feature-table summarize [OPTIONS]

qiime feature-table summarize \
       --i-table RarTable.qza \
       --m-sample-metadata-file sample-metadata.tsv \
       --o-visualization RarTable.qzv



###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10


# core_metrics_phylogenetic:
############################
    # Aim: Applies a collection of diversity metrics to a feature table
    # Use: qiime diversity core-metrics-phylogenetic [OPTIONS]

    # in qiime diversity core-metrics-phylogenetic :
    #        --p-n-jobs {params.jobs} \

qiime diversity core-metrics-phylogenetic \
       --i-phylogeny rooted-tree.qza \
       --i-table ConTable.qza \
       --p-sampling-depth 29544 \
       --m-metadata-file sample-metadata.tsv \
       --o-rarefied-table RarTable.qza \
       --o-observed-otus-vector Vector-observed_asv.qza \
       --o-shannon-vector Vector-shannon.qza \
       --o-evenness-vector Vector-evenness.qza \
       --o-faith-pd-vector Vector-faith_pd.qza \
       --o-jaccard-distance-matrix Matrix-jaccard.qza \
       --o-bray-curtis-distance-matrix Matrix-braycurtis.qza \
       --o-unweighted-unifrac-distance-matrix Matrix-unweighted_unifrac.qza \
       --o-weighted-unifrac-distance-matrix Matrix-weighted_unifrac.qza \
       --o-jaccard-pcoa-results PCoA-jaccard.qza \
       --o-bray-curtis-pcoa-results PCoA-braycurtis.qza \
       --o-unweighted-unifrac-pcoa-results PCoA-unweighted_unifrac.qza \
       --o-weighted-unifrac-pcoa-results PCoA-weighted_unifrac.qza \
       --o-jaccard-emperor /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/V4/visual/Emperor-jaccard.qzv \        
       --o-bray-curtis-emperor /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/V4/visual/Emperor-braycurtis.qzv \
       --o-unweighted-unifrac-emperor /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/V4/visual/Emperor-unweighted_unifrac.qzv \
       --o-weighted-unifrac-emperor /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/V4/visual/Emperor-weighted_unifrac.qzv

# sequence_rarefaction_filter:
##############################

# Aim: Filter features from sequences based on a feature table or metadata.
# Use: qiime feature-table filter-seqs [OPTIONS]

qiime feature-table filter-seqs \
        --i-data ConRepSeq.qza \
        --i-table RarTable.qza \
        --o-filtered-data RarRepSeq.qza

# summarize_sequence:
#####################

qiime feature-table tabulate-seqs \
       --i-data RarRepSeq.qza \
       --o-visualization RarRepSeq.qzv

# summarize_table :
##################

# Aim: Generate visual and tabular summaries of a feature table
# Use: qiime feature-table summarize [OPTIONS]

qiime feature-table summarize \
       --i-table RarTable.qza \
       --m-sample-metadata-file sample-metadata.tsv \
       --o-visualization RarTable.qzv







