#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4/


METADATA_ITS2=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/ITS2/
METADATA_V4=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/V4/


# Aim: identify features that are differentially abundant across groups


###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

##########################################################################
# Aim: Build bifurcating tree representing features hierarchical clustering

qiime gneiss correlation-clustering \
        --i-table core/RarTable.qza \
        --o-clustering gneiss/CorrHierarchy.qza

##########################################################################
# Aim: Build bifurcating tree representing features hierarchical clustering

# Notes:
# An important consideration for downstream analyses is  overfitting.
# When using gradient-clustering, you are creating a tree to best highlight
# compositional differences along the metadata category of your choice,
# and it's possible to get false positives. Use gradient-clustering with caution.



# HERE IF NOT WORKING CHANGE BY THIS :         --m-gradient-column \

qiime gneiss gradient-clustering \
        --i-table core/RarTable.qza \
        --m-gradient-file $METADATA_ITS2/sample-metadata.tsv \
        --m-gradient-column 'Acronym' \
        --o-clustering gneiss/GradHierarchy.qza


##########################################################################
# Aim: Calculate balances given a hierarchy

qiime gneiss ilr-hierarchical \
        --i-table core/RarTable.qza \
        --i-tree gneiss/GradHierarchy.qza \
        --o-balances gneiss/Balance.qza

##########################################################################
# Aim: Perform linear regression on balances

qiime gneiss ols-regression \
        --p-formula 'Acronym' \
        --i-table gneiss/Balance.qza \
        --i-tree gneiss/GradHierarchy.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --o-visualization visual/Regression

##########################################################################
# Aim: Visualize the feature table as a heatmap

qiime gneiss dendrogram-heatmap \
        --i-table core/RarTable.qza \
        --i-tree gneiss/GradHierarchy.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --m-metadata-column 'Acronym' \
        --p-color-map 'seismic' \
        --p-method 'clr' \
        --p-ndim '10' \
        --o-visualization visual/RegSum.qzv

##########################################################################
# Aim: Visualize the distribution of a single balance and summarize

# --p-taxa-level :
  #level: # choose only one
    #- 0 # Life
    #- 0 # Domain       Bacteria / Eukarya
    #- 1 # Kingdom      Bacteria / Fungui
    #- 2 # Phylum   Acidobacteria / Ascomycota
    #- 3 # Class                 / 
    #- 4 # Order                 /
    #- 5 # Familly               /
    #- 6 # Genus                 /
    #- 7 # Species               /

qiime gneiss balance-taxonomy \
        --i-table core/RarTable.qza \
        --i-tree gneiss/GradHierarchy.qza \
        --i-taxonomy taxonomy/Taxonomy.qza \
        --p-taxa-level '2' \
        --p-balance-name 'y0' \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --m-metadata-column 'Acronym' \
        --o-visualization visual/y0TaxaSum.qz


###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10


##########################################################################
# Aim: Build bifurcating tree representing features hierarchical clustering

qiime gneiss correlation-clustering \
        --i-table core/RarTable.qza \
        --o-clustering gneiss/CorrHierarchy.qza

##########################################################################
# Aim: Build bifurcating tree representing features hierarchical clustering

# Notes:
# An important consideration for downstream analyses is  overfitting.
# When using gradient-clustering, you are creating a tree to best highlight
# compositional differences along the metadata category of your choice,
# and it's possible to get false positives. Use gradient-clustering with caution.



# HERE IF NOT WORKING CHANGE BY THIS :         --m-gradient-column \

qiime gneiss gradient-clustering \
        --i-table core/RarTable.qza \
        --m-gradient-file $METADATA_V4/sample-metadata.tsv \
        --m-gradient-column 'Acronym' \
        --o-clustering gneiss/GradHierarchy.qza


##########################################################################
# Aim: Calculate balances given a hierarchy

qiime gneiss ilr-hierarchical \
        --i-table core/RarTable.qza \
        --i-tree gneiss/GradHierarchy.qza \
        --o-balances gneiss/Balance.qza

##########################################################################
# Aim: Perform linear regression on balances

qiime gneiss ols-regression \
        --p-formula 'Acronym' \
        --i-table gneiss/Balance.qza \
        --i-tree gneiss/GradHierarchy.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --o-visualization visual/Regression

##########################################################################
# Aim: Visualize the feature table as a heatmap

qiime gneiss dendrogram-heatmap \
        --i-table core/RarTable.qza \
        --i-tree gneiss/GradHierarchy.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --m-metadata-column 'Acronym' \
        --p-color-map 'seismic' \
        --p-method 'clr' \
        --p-ndim '10' \
        --o-visualization visual/RegSum.qzv

##########################################################################
# Aim: Visualize the distribution of a single balance and summarize

# --p-taxa-level :
  #level: # choose only one
    #- 0 # Life
    #- 0 # Domain       Bacteria / Eukarya
    #- 1 # Kingdom      Bacteria / Fungui
    #- 2 # Phylum   Acidobacteria / Ascomycota
    #- 3 # Class                 / 
    #- 4 # Order                 /
    #- 5 # Familly               /
    #- 6 # Genus                 /
    #- 7 # Species               /

qiime gneiss balance-taxonomy \
        --i-table core/RarTable.qza \
        --i-tree gneiss/GradHierarchy.qza \
        --i-taxonomy taxonomy/Taxonomy.qza \
        --p-taxa-level '2' \
        --p-balance-name 'y0' \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --m-metadata-column 'Acronym' \
        --o-visualization visual/y0TaxaSum.qz


