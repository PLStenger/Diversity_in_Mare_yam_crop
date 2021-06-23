#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4/

METADATA_ITS2=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/ITS2/
METADATA_V4=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/V4/

# Aim: perform diversity metrics and rarefaction

# https://chmi-sops.github.io/mydoc_qiime2.html#step-8-calculate-and-explore-diversity-metrics
# https://docs.qiime2.org/2018.2/tutorials/moving-pictures/#alpha-rarefaction-plotting
# https://forum.qiime2.org/t/how-to-decide-p-sampling-depth-value/3296/6

# Use QIIME2’s diversity core-metrics-phylogenetic function to calculate a whole bunch of diversity metrics all at once. 
# Note that you should input a sample-depth value based on the alpha-rarefaction analysis that you ran before.

# sample-depth value choice : 
# We are ideally looking for a sequencing depth at the point where these rarefaction curves begin to level off (indicating that most of the relevant diversity has been captured).
# This helps inform tough decisions that we need to make when some samples have lower sequence counts and we need to balance the priorities that you want to choose 
# a value high enough that you capture the diversity present in samples with high counts, but low enough that you don’t get rid of a ton of your samples.

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
       --i-phylogeny tree/rooted-tree.qza \
       --i-table core/Table.qza \
       --p-sampling-depth 16708 \
       --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
       --o-rarefied-table core/RarTable.qza \
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
        --i-data core/ConRepSeq.qza \
        --i-table core/RarTable.qza \
        --o-filtered-data core/RarRepSeq.qza

# summarize_sequence:
#####################

qiime feature-table tabulate-seqs \
       --i-data core/RarRepSeq.qza \
       --o-visualization core/RarRepSeq.qzv

# summarize_table :
##################

# Aim: Generate visual and tabular summaries of a feature table
# Use: qiime feature-table summarize [OPTIONS]

qiime feature-table summarize \
       --i-table core/RarTable.qza \
       --m-sample-metadata-file $METADATA_ITS2/sample-metadata.tsv \
       --o-visualization core/RarTable.qzv


# Aim: compute user-specified diversity metrics and pcoa with emperor plot :
############################################################################

# alpha_diversity; Aim: Compute a user-specified alpha diversity metric, for all samples in a feature table
############################################################################################################

# Simpson's index: Measures the relative abundance of the different species making up the sample richness.
qiime diversity alpha --i-table core/RarTable.qza \
        --p-metric simpson \
        --o-alpha-diversity core/Vector-simpson.qza

# Simpson evenness measure E: Diversity that account for the number of organisms and number of species.
qiime diversity alpha --i-table core/RarTable.qza \
        --p-metric simpson_e \
        --o-alpha-diversity core/Vector-simpson_e.qza

# Fisher's index: Relationship between the number of species and the abundance of each species.
qiime diversity alpha --i-table core/RarTable.qza \
        --p-metric fisher_alpha \
        --o-alpha-diversity core/Vector-fisher_alpha.qza
        
# Pielou's evenness: Measure of relative evenness of species richness.
qiime diversity alpha --i-table core/RarTable.qza \
        --p-metric pielou_e \
        --o-alpha-diversity core/Vector-pielou_e.qza        

# Chao1's index: Estimates diversity from abundant data and number of rare taxa missed from under sampling.
qiime diversity alpha --i-table core/RarTable.qza \
        --p-metric chao1 \
        --o-alpha-diversity core/Vector-chao1.qza   

# Chao1 confidence interval: Confidence interval for richness estimator chao1.
qiime diversity alpha --i-table core/RarTable.qza \
        --p-metric chao1_ci \
        --o-alpha-diversity core/Vector-chao1_ci.qza   

# beta_diversity; Aim: Compute a user-specified beta diversity metric, for all pairs of samples in a feature table
##################################################################################################################

#         --p-n-jobs {params.jobs} \

# Jaccard similarity index: Fraction of unique features, regardless of abundance.
qiime diversity beta --i-table core/RarTable.qza \
        --p-metric jaccard \
        --o-distance-matrix core/Matrix-jaccard.qza

qiime diversity pcoa --i-distance-matrix core/Matrix-jaccard.qza \
        --o-pcoa pcoa/PCoA-jaccard.qza
        
qiime emperor plot --i-pcoa pcoa/PCoA-jaccard.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/Emperor-jaccard.qzv
        
        
# Bray-Curtis dissimilarity: Fraction of overabundant counts.
qiime diversity beta --i-table core/RarTable.qza \
        --p-metric braycurtis \
        --o-distance-matrix core/Matrix-braycurtis.qza

qiime diversity pcoa --i-distance-matrix core/Matrix-braycurtis.qza \
        --o-pcoa pcoa/PCoA-braycurtis.qza

qiime emperor plot --i-pcoa pcoa/PCoA-braycurtis.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/Emperor-braycurtis.qzv

### SIGNIFIANCE
  
# Now test for relationships between alpha diversity and study metadata   
  
qiime diversity alpha-group-significance \
  --i-alpha-diversity core/faith_pd_vector.qza \
  --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
  --o-visualization core/faith-pd-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity core/evenness_vector.qza \
  --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
  --o-visualization core/evenness-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity core/shannon_vector.qza \
  --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
  --o-visualization core/shannon_group-significance.qzv  
  
# Aim: statistically compare groups of alpha/beta diversity values
# Aim: Visually and statistically compare groups of alpha diversity values

qiime diversity alpha-group-significance --i-alpha-diversity core/Vector-simpson.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-simpson.qzv

qiime diversity alpha-group-significance --i-alpha-diversity core/Vector-simpson_e.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-simpson_e.qzv
            
qiime diversity alpha-group-significance --i-alpha-diversity core/Vector-chao1_ci.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-chao1_ci.qzv

qiime diversity alpha-group-significance --i-alpha-diversity core/Vector-chao1.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-chao1.qzv

qiime diversity alpha-group-significance --i-alpha-diversity core/Vector-pielou_e.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-pielou_e.qzv
        
qiime diversity alpha-group-significance --i-alpha-diversity core/Vector-fisher_alpha.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-fisher_alpha.qzv

# Aim: Determine whether numeric sample metadata category is correlated with alpha diversity

qiime diversity alpha-correlation --i-alpha-diversity core/Vector-simpson.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-simpson.qzv

qiime diversity alpha-correlation --i-alpha-diversity core/Vector-simpson_e.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-simpson_e.qzv

qiime diversity alpha-correlation --i-alpha-diversity core/Vector-chao1_ci.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-chao1_ci.qzv

qiime diversity alpha-correlation --i-alpha-diversity core/Vector-chao1.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-chao1.qzv      
        
qiime diversity alpha-correlation --i-alpha-diversity core/Vector-pielou_e.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-pielou_e.qzv        
        
 qiime diversity alpha-correlation --i-alpha-diversity core/Vector-fisher_alpha.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-fisher_alpha.qzv        
  
# Now test for relationships between beta diversity and study metadata 

qiime diversity beta-group-significance \
  --i-distance-matrix core/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
  --m-metadata-column Acronyme \
  --o-visualization core/unweighted-unifrac-Acronyme-significance.qzv \
  --p-pairwise

qiime diversity beta-group-significance \
  --i-distance-matrix core/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
  --m-metadata-column SampleID \
  --o-visualization core/unweighted-unifrac-SampleID-group-significance.qzv \
  --p-pairwise
  
qiime diversity beta-group-significance --i-distance-matrix core/Matrix-jaccard.qza  \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv  \
        --m-metadata-column Acronyme \
        --o-visualization visual/BetaSignification-jaccard-Acronyme.qzv  \
        --p-method permanova  \
        --p-pairwise  \
        --p-permutations 9999
  
qiime diversity beta-group-significance --i-distance-matrix core/Matrix-braycurtis.qza  \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv  \
        --m-metadata-column Acronyme \
        --o-visualization visual/BetaSignification-braycurtis-Acronyme.qzv  \
        --p-method permanova  \
        --p-pairwise  \
        --p-permutations 9999  
  
  
  
# Create a PCoA plot to explore beta diversity metric. 
# To do this you can use Emperor, a powerful tool for interactively exploring scatter plots. You do not need to install Emperor.

#first, use the unweighted unifrac data as input
qiime emperor plot \
  --i-pcoa core/unweighted_unifrac_pcoa_results.qza \
  --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
  --p-custom-axes Acronyme \
  --o-visualization core/unweighted-unifrac-emperor-Acronyme.qzv

#now repeat with bray curtis
qiime emperor plot \
  --i-pcoa core/bray_curtis_pcoa_results.qza \
  --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
  --p-custom-axes Acronyme \
  --o-visualization core/bray-curtis-emperor-Acronyme.qzv

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

qiime diversity core-metrics-phylogenetic \
       --i-phylogeny tree/rooted-tree.qza \
       --i-table core/Table.qza \
       --p-sampling-depth 2634 \
       --m-metadata-file $METADATA_V4/sample-metadata.tsv \
       --o-rarefied-table core/RarTable.qza \
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
        --i-data core/ConRepSeq.qza \
        --i-table core/RarTable.qza \
        --o-filtered-data core/RarRepSeq.qza

# summarize_sequence:
#####################

qiime feature-table tabulate-seqs \
       --i-data core/RarRepSeq.qza \
       --o-visualization core/RarRepSeq.qzv

# summarize_table :
##################

# Aim: Generate visual and tabular summaries of a feature table
# Use: qiime feature-table summarize [OPTIONS]

qiime feature-table summarize \
       --i-table core/RarTable.qza \
       --m-sample-metadata-file $METADATA_V4/sample-metadata.tsv \
       --o-visualization core/RarTable.qzv


# Aim: compute user-specified diversity metrics and pcoa with emperor plot :
############################################################################

# alpha_diversity; Aim: Compute a user-specified alpha diversity metric, for all samples in a feature table
############################################################################################################

# Simpson's index: Measures the relative abundance of the different species making up the sample richness.
qiime diversity alpha --i-table core/RarTable.qza \
        --p-metric simpson \
        --o-alpha-diversity core/Vector-simpson.qza

# Simpson evenness measure E: Diversity that account for the number of organisms and number of species.
qiime diversity alpha --i-table core/RarTable.qza \
        --p-metric simpson_e \
        --o-alpha-diversity core/Vector-simpson_e.qza

# Fisher's index: Relationship between the number of species and the abundance of each species.
qiime diversity alpha --i-table core/RarTable.qza \
        --p-metric fisher_alpha \
        --o-alpha-diversity core/Vector-fisher_alpha.qza
        
# Pielou's evenness: Measure of relative evenness of species richness.
qiime diversity alpha --i-table core/RarTable.qza \
        --p-metric pielou_e \
        --o-alpha-diversity core/Vector-pielou_e.qza        

# Chao1's index: Estimates diversity from abundant data and number of rare taxa missed from under sampling.
qiime diversity alpha --i-table core/RarTable.qza \
        --p-metric chao1 \
        --o-alpha-diversity core/Vector-chao1.qza   

# Chao1 confidence interval: Confidence interval for richness estimator chao1.
qiime diversity alpha --i-table core/RarTable.qza \
        --p-metric chao1_ci \
        --o-alpha-diversity core/Vector-chao1_ci.qza   

# beta_diversity; Aim: Compute a user-specified beta diversity metric, for all pairs of samples in a feature table
##################################################################################################################

#         --p-n-jobs {params.jobs} \

# Jaccard similarity index: Fraction of unique features, regardless of abundance.
qiime diversity beta --i-table core/RarTable.qza \
        --p-metric jaccard \
        --o-distance-matrix core/Matrix-jaccard.qza

qiime diversity pcoa --i-distance-matrix core/Matrix-jaccard.qza \
        --o-pcoa pcoa/PCoA-jaccard.qza
        
qiime emperor plot --i-pcoa pcoa/PCoA-jaccard.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/Emperor-jaccard.qzv
        
        
# Bray-Curtis dissimilarity: Fraction of overabundant counts.
qiime diversity beta --i-table core/RarTable.qza \
        --p-metric braycurtis \
        --o-distance-matrix core/Matrix-braycurtis.qza

qiime diversity pcoa --i-distance-matrix core/Matrix-braycurtis.qza \
        --o-pcoa pcoa/PCoA-braycurtis.qza

qiime emperor plot --i-pcoa pcoa/PCoA-braycurtis.qza \
        --m-metadata-file $METADATA_V4//sample-metadata.tsv \
        --o-visualization visual/Emperor-braycurtis.qzv

### SIGNIFIANCE
  
# Now test for relationships between alpha diversity and study metadata   
  
qiime diversity alpha-group-significance \
  --i-alpha-diversity core/faith_pd_vector.qza \
  --m-metadata-file $METADATA_V4/sample-metadata.tsv \
  --o-visualization core/faith-pd-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity core/evenness_vector.qza \
  --m-metadata-file $METADATA_V4/sample-metadata.tsv \
  --o-visualization core/evenness-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity core/shannon_vector.qza \
  --m-metadata-file $METADATA_V4/sample-metadata.tsv \
  --o-visualization core/shannon_group-significance.qzv  
  
# Aim: statistically compare groups of alpha/beta diversity values
# Aim: Visually and statistically compare groups of alpha diversity values

qiime diversity alpha-group-significance --i-alpha-diversity core/Vector-simpson.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-simpson.qzv

qiime diversity alpha-group-significance --i-alpha-diversity core/Vector-simpson_e.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-simpson_e.qzv
            
qiime diversity alpha-group-significance --i-alpha-diversity core/Vector-chao1_ci.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-chao1_ci.qzv

qiime diversity alpha-group-significance --i-alpha-diversity core/Vector-chao1.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-chao1.qzv

qiime diversity alpha-group-significance --i-alpha-diversity core/Vector-pielou_e.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-pielou_e.qzv
        
qiime diversity alpha-group-significance --i-alpha-diversity core/Vector-fisher_alpha.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-fisher_alpha.qzv

# Aim: Determine whether numeric sample metadata category is correlated with alpha diversity

qiime diversity alpha-correlation --i-alpha-diversity core/Vector-simpson.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-simpson.qzv

qiime diversity alpha-correlation --i-alpha-diversity core/Vector-simpson_e.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-simpson_e.qzv

qiime diversity alpha-correlation --i-alpha-diversity core/Vector-chao1_ci.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-chao1_ci.qzv

qiime diversity alpha-correlation --i-alpha-diversity core/Vector-chao1.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-chao1.qzv      
        
qiime diversity alpha-correlation --i-alpha-diversity core/Vector-pielou_e.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-pielou_e.qzv        
        
 qiime diversity alpha-correlation --i-alpha-diversity core/Vector-fisher_alpha.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-fisher_alpha.qzv        
  
# Now test for relationships between beta diversity and study metadata 

qiime diversity beta-group-significance \
  --i-distance-matrix core/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file $METADATA_V4/sample-metadata.tsv \
  --m-metadata-column Acronyme \
  --o-visualization core/unweighted-unifrac-Acronyme-significance.qzv \
  --p-pairwise

qiime diversity beta-group-significance \
  --i-distance-matrix core/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file $METADATA_V4/sample-metadata.tsv \
  --m-metadata-column SampleID \
  --o-visualization core/unweighted-unifrac-SampleID-group-significance.qzv \
  --p-pairwise
  
qiime diversity beta-group-significance --i-distance-matrix core/Matrix-jaccard.qza  \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv  \
        --m-metadata-column Acronyme \
        --o-visualization visual/BetaSignification-jaccard-Acronyme.qzv  \
        --p-method permanova  \
        --p-pairwise  \
        --p-permutations 9999
  
qiime diversity beta-group-significance --i-distance-matrix core/Matrix-braycurtis.qza  \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv  \
        --m-metadata-column Acronyme \
        --o-visualization visual/BetaSignification-braycurtis-Acronyme.qzv  \
        --p-method permanova  \
        --p-pairwise  \
        --p-permutations 9999  
  
  
  
# Create a PCoA plot to explore beta diversity metric. 
# To do this you can use Emperor, a powerful tool for interactively exploring scatter plots. You do not need to install Emperor.

#first, use the unweighted unifrac data as input
qiime emperor plot \
  --i-pcoa core/unweighted_unifrac_pcoa_results.qza \
  --m-metadata-file $METADATA_V4/sample-metadata.tsv \
  --p-custom-axes Acronyme \
  --o-visualization core/unweighted-unifrac-emperor-Acronyme.qzv

#now repeat with bray curtis
qiime emperor plot \
  --i-pcoa core/bray_curtis_pcoa_results.qza \
  --m-metadata-file $METADATA_V4/sample-metadata.tsv \
  --p-custom-axes Acronyme \
  --o-visualization core/bray-curtis-emperor-Acronyme.qzv
