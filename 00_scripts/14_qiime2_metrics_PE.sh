#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4/

METADATA_ITS2=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/ITS2/
METADATA_V4=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/V4/


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


qiime diversity core-metrics-phylogenetic \
       --i-phylogeny rooted-tree.qza \
       --i-table ConTable.qza \
       --p-sampling-depth 16708 \
       --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
       --o-rarefied-table RarTable.qza \
       --o-observed-otus-vector core/Vector-observed_asv.qza \
       --o-shannon-vector core/Vector-shannon.qza \
       --o-evenness-vector core/Vector-evenness.qza \
       --o-faith-pd-vector core/Vector-faith_pd.qza \
       --o-jaccard-distance-matrix core/Matrix-jaccard.qza \
       --o-bray-curtis-distance-matrix core/Matrix-braycurtis.qza \
       --o-unweighted-unifrac-distance-matrix core/Matrix-unweighted_unifrac.qza \
       --o-weighted-unifrac-distance-matrix core/Matrix-weighted_unifrac.qza \
       --o-jaccard-pcoa-results pcoa/PCoA-jaccard.qza \
       --o-bray-curtis-pcoa-results pcoa/PCoA-braycurtis.qza \
       --o-unweighted-unifrac-pcoa-results pcoa/PCoA-unweighted_unifrac.qza \
       --o-weighted-unifrac-pcoa-results pcoa/PCoA-weighted_unifrac.qza \
       --o-jaccard-emperor visual/Emperor-jaccard.qzv \
       --o-bray-curtis-emperor visual/Emperor-braycurtis.qzv \
       --o-unweighted-unifrac-emperor visual/Emperor-unweighted_unifrac.qzv \
       --o-weighted-unifrac-emperor visual/Emperor-weighted_unifrac.qzv


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
       --m-sample-metadata-file $METADATA_ITS2/sample-metadata.tsv \
       --o-visualization RarTable.qzv


# Aim: compute user-specified diversity metrics and pcoa with emperor plot :
############################################################################

# alpha_diversity; Aim: Compute a user-specified alpha diversity metric, for all samples in a feature table
############################################################################################################

# Simpson's index: Measures the relative abundance of the different species making up the sample richness.
qiime diversity alpha --i-table RarTable.qza \
        --p-metric simpson \
        --o-alpha-diversity Vector-simpson.qza

# Simpson evenness measure E: Diversity that account for the number of organisms and number of species.
qiime diversity alpha --i-table RarTable.qza \
        --p-metric simpson_e \
        --o-alpha-diversity Vector-simpson_e.qza

# Fisher's index: Relationship between the number of species and the abundance of each species.
qiime diversity alpha --i-table RarTable.qza \
        --p-metric fisher_alpha \
        --o-alpha-diversity Vector-fisher_alpha.qza
        
# Pielou's evenness: Measure of relative evenness of species richness.
qiime diversity alpha --i-table RarTable.qza \
        --p-metric pielou_e \
        --o-alpha-diversity Vector-pielou_e.qza        

# Chao1's index: Estimates diversity from abundant data and number of rare taxa missed from under sampling.
qiime diversity alpha --i-table RarTable.qza \
        --p-metric chao1 \
        --o-alpha-diversity Vector-chao1.qza   

# Chao1 confidence interval: Confidence interval for richness estimator chao1.
qiime diversity alpha --i-table RarTable.qza \
        --p-metric chao1_ci \
        --o-alpha-diversity Vector-chao1_ci.qza   

# beta_diversity; Aim: Compute a user-specified beta diversity metric, for all pairs of samples in a feature table
##################################################################################################################

#         --p-n-jobs {params.jobs} \

# Jaccard similarity index: Fraction of unique features, regardless of abundance.
qiime diversity beta --i-table RarTable.qza \
        --p-metric jaccard \
        --o-distance-matrix Matrix-jaccard.qza

qiime diversity pcoa --i-distance-matrix Matrix-jaccard.qza \
        --o-pcoa pcoa/PCoA-jaccard.qza
        
qiime emperor plot --i-pcoa pcoa/PCoA-jaccard.qza \
        --m-metadata-file sample-metadata.tsv \
        --o-visualization visual/Emperor-jaccard.qzv
        
        
# Bray-Curtis dissimilarity: Fraction of overabundant counts.
qiime diversity beta --i-table RarTable.qza \
        --p-metric braycurtis \
        --o-distance-matrix Matrix-braycurtis.qza

qiime diversity pcoa --i-distance-matrix Matrix-braycurtis.qza \
        --o-pcoa pcoa/PCoA-braycurtis.qza

qiime emperor plot --i-pcoa pcoa/PCoA-braycurtis.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/Emperor-braycurtis.qzv


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
       --p-sampling-depth 2634 \
       --m-metadata-file $METADATA_V4/sample-metadata.tsv \
       --o-rarefied-table RarTable.qza \
       --o-observed-otus-vector core/Vector-observed_asv.qza \
       --o-shannon-vector core/Vector-shannon.qza \
       --o-evenness-vector core/Vector-evenness.qza \
       --o-faith-pd-vector core/Vector-faith_pd.qza \
       --o-jaccard-distance-matrix core/Matrix-jaccard.qza \
       --o-bray-curtis-distance-matrix core/Matrix-braycurtis.qza \
       --o-unweighted-unifrac-distance-matrix core/Matrix-unweighted_unifrac.qza \
       --o-weighted-unifrac-distance-matrix core/Matrix-weighted_unifrac.qza \
       --o-jaccard-pcoa-results pcoa/PCoA-jaccard.qza \
       --o-bray-curtis-pcoa-results pcoa/PCoA-braycurtis.qza \
       --o-unweighted-unifrac-pcoa-results pcoa/PCoA-unweighted_unifrac.qza \
       --o-weighted-unifrac-pcoa-results pcoa/PCoA-weighted_unifrac.qza \
       --o-jaccard-emperor visual/Emperor-jaccard.qzv \
       --o-bray-curtis-emperor visual/Emperor-braycurtis.qzv \
       --o-unweighted-unifrac-emperor visual/Emperor-unweighted_unifrac.qzv \
       --o-weighted-unifrac-emperor visual/Emperor-weighted_unifrac.qzv

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
       --m-sample-metadata-file $METADATA_V4/sample-metadata.tsv \
       --o-visualization RarTable.qzv


# Aim: compute user-specified diversity metrics and pcoa with emperor plot :
############################################################################

# alpha_diversity; Aim: Compute a user-specified alpha diversity metric, for all samples in a feature table
############################################################################################################

# Simpson's index: Measures the relative abundance of the different species making up the sample richness.
qiime diversity alpha --i-table RarTable.qza \
        --p-metric simpson \
        --o-alpha-diversity Vector-simpson.qza

# Simpson evenness measure E: Diversity that account for the number of organisms and number of species.
qiime diversity alpha --i-table RarTable.qza \
        --p-metric simpson_e \
        --o-alpha-diversity Vector-simpson_e.qza

# Fisher's index: Relationship between the number of species and the abundance of each species.
qiime diversity alpha --i-table RarTable.qza \
        --p-metric fisher_alpha \
        --o-alpha-diversity Vector-fisher_alpha.qza
        
# Pielou's evenness: Measure of relative evenness of species richness.
qiime diversity alpha --i-table RarTable.qza \
        --p-metric pielou_e \
        --o-alpha-diversity Vector-pielou_e.qza        

# Chao1's index: Estimates diversity from abundant data and number of rare taxa missed from under sampling.
qiime diversity alpha --i-table RarTable.qza \
        --p-metric chao1 \
        --o-alpha-diversity Vector-chao1.qza   

# Chao1 confidence interval: Confidence interval for richness estimator chao1.
qiime diversity alpha --i-table RarTable.qza \
        --p-metric chao1_ci \
        --o-alpha-diversity Vector-chao1_ci.qza   

# beta_diversity; Aim: Compute a user-specified beta diversity metric, for all pairs of samples in a feature table
##################################################################################################################

#         --p-n-jobs {params.jobs} \

# Jaccard similarity index: Fraction of unique features, regardless of abundance.
qiime diversity beta --i-table RarTable.qza \
        --p-metric jaccard \
        --o-distance-matrix Matrix-jaccard.qza

qiime diversity pcoa --i-distance-matrix Matrix-jaccard.qza \
        --o-pcoa pcoa/PCoA-jaccard.qza
        
qiime emperor plot --i-pcoa pcoa/PCoA-jaccard.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/Emperor-jaccard.qzv
        
        
# Bray-Curtis dissimilarity: Fraction of overabundant counts.
qiime diversity beta --i-table RarTable.qza \
        --p-metric braycurtis \
        --o-distance-matrix Matrix-braycurtis.qza

qiime diversity pcoa --i-distance-matrix Matrix-braycurtis.qza \
        --o-pcoa pcoa/PCoA-braycurtis.qza

qiime emperor plot --i-pcoa pcoa/PCoA-braycurtis.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/Emperor-braycurtis.qzv
