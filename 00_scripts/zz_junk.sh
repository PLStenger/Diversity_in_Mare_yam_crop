#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4/


METADATA_ITS2=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/ITS2
METADATA_V4=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/V4


###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10


qiime composition add-pseudocount \
    --i-table core/RarTable.qza \
    --p-pseudocount 1 \
    --o-composition-table gneiss/RarTable_composition.qza

qiime gneiss dendrogram-heatmap \
    --i-table gneiss/RarTable_composition.qza \
    --i-tree gneiss/GradHierarchy.qza \
    --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
    --m-metadata-category "Acronyme" \
    --o-visualization "Site_heatmap" \
    --p-ndim 10 --verbose   

qiime gneiss ilr-transform \
    --i-table gneiss/RarTable_composition.qza \
    --i-tree gneiss/GradHierarchy.qza \
    --o-balances gneiss/RarTable_balances.qza

qiime gneiss ols-regression \
    --p-formula "F + SF + LF" \
    --i-table gneiss/RarTable_balances.qza \
    --i-tree gneiss/GradHierarchy.qza \
    --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
    --o-visualization visual/RarTable_regression_summary.qzv

qiime gneiss balance-taxonomy \
    --i-balances gneiss/RarTable_balances.qza \
    --i-tree gneiss/GradHierarchy.qza \
    --i-taxonomy taxonomy/taxonomy_reads-per-batch_0.qza \
    --p-taxa-level 2 \
    --p-balance-name 'y0' \
    --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
    --m-metadata-category 'Acronyme' \
    --o-visualization visual/RarTable_y0_taxa_summary.qzv




###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10




