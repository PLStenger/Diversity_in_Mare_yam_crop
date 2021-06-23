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

# Aim: statistically compare groups of alpha/beta diversity values
# Aim: Visually and statistically compare groups of alpha diversity values

qiime diversity alpha-group-significance --i-alpha-diversity Vector-simpson.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-simpson.qzv

qiime diversity alpha-group-significance --i-alpha-diversity Vector-simpson_e.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-simpson_e.qzv
            
qiime diversity alpha-group-significance --i-alpha-diversity Vector-chao1_ci.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-chao1_ci.qzv

qiime diversity alpha-group-significance --i-alpha-diversity Vector-chao1.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-chao1.qzv

qiime diversity alpha-group-significance --i-alpha-diversity Vector-pielou_e.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-pielou_e.qzv
        
qiime diversity alpha-group-significance --i-alpha-diversity Vector-fisher_alpha.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-fisher_alpha.qzv


# Aim: Determine whether numeric sample metadata category is correlated with alpha diversity

qiime diversity alpha-correlation --i-alpha-diversity Vector-simpson.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-simpson.qzv

qiime diversity alpha-correlation --i-alpha-diversity Vector-simpson_e.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-simpson_e.qzv

qiime diversity alpha-correlation --i-alpha-diversity Vector-chao1_ci.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-chao1_ci.qzv

qiime diversity alpha-correlation --i-alpha-diversity Vector-chao1.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-chao1.qzv      
        
qiime diversity alpha-correlation --i-alpha-diversity Vector-pielou_e.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-pielou_e.qzv        
        
 qiime diversity alpha-correlation --i-alpha-diversity Vector-fisher_alpha.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-fisher_alpha.qzv       

# beta_diversity_group_significance:
    # Aim: Determine whether groups of samples are significantly different
     # from one another using a permutation-based statistical test
        
qiime diversity beta-group-significance --i-distance-matrix Matrix-jaccard.qza  \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv  \
        --m-metadata-column Acronyme \
        --o-visualization visual/BetaSignification-jaccard-Acronyme.qzv  \
        --p-method permanova  \
        --p-pairwise  \
        --p-permutations 9999
  
qiime diversity beta-group-significance --i-distance-matrix Matrix-braycurtis.qza  \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv  \
        --m-metadata-column Acronyme \
        --o-visualization visual/BetaSignification-braycurtis-Acronyme.qzv  \
        --p-method permanova  \
        --p-pairwise  \
        --p-permutations 9999  
  

###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10



# Aim: statistically compare groups of alpha/beta diversity values
# Aim: Visually and statistically compare groups of alpha diversity values

qiime diversity alpha-group-significance --i-alpha-diversity Vector-simpson.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-simpson.qzv

qiime diversity alpha-group-significance --i-alpha-diversity Vector-simpson_e.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-simpson_e.qzv
            
qiime diversity alpha-group-significance --i-alpha-diversity Vector-chao1_ci.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-chao1_ci.qzv

qiime diversity alpha-group-significance --i-alpha-diversity Vector-chao1.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-chao1.qzv

qiime diversity alpha-group-significance --i-alpha-diversity Vector-pielou_e.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-pielou_e.qzv
        
qiime diversity alpha-group-significance --i-alpha-diversity Vector-fisher_alpha.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/AlphaSignification-fisher_alpha.qzv


# Aim: Determine whether numeric sample metadata category is correlated with alpha diversity

qiime diversity alpha-correlation --i-alpha-diversity Vector-simpson.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-simpson.qzv

qiime diversity alpha-correlation --i-alpha-diversity Vector-simpson_e.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-simpson_e.qzv

qiime diversity alpha-correlation --i-alpha-diversity Vector-chao1_ci.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-chao1_ci.qzv

qiime diversity alpha-correlation --i-alpha-diversity Vector-chao1.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-chao1.qzv      
        
qiime diversity alpha-correlation --i-alpha-diversity Vector-pielou_e.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-pielou_e.qzv        
        
 qiime diversity alpha-correlation --i-alpha-diversity Vector-fisher_alpha.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --p-method spearman \
        --o-visualization visual/AlphaCorrelation-fisher_alpha.qzv       

# beta_diversity_group_significance:
    # Aim: Determine whether groups of samples are significantly different
     # from one another using a permutation-based statistical test
        
qiime diversity beta-group-significance --i-distance-matrix Matrix-jaccard.qza  \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv  \
        --m-metadata-column Acronyme \
        --o-visualization visual/BetaSignification-jaccard-Acronyme.qzv  \
        --p-method permanova  \
        --p-pairwise  \
        --p-permutations 9999
  
qiime diversity beta-group-significance --i-distance-matrix Matrix-braycurtis.qza  \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv  \
        --m-metadata-column Acronyme \
        --o-visualization visual/BetaSignification-braycurtis-Acronyme.qzv  \
        --p-method permanova  \
        --p-pairwise  \
        --p-permutations 9999  
  
