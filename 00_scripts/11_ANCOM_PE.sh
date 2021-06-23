#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4/


METADATA_ITS2=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/ITS2/
METADATA_V4=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/V4/


# Aim: Apply Analysis of Composition of Microbiomes (ANCOM), identify features that are differentially abundant across groups


###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

##########################################################################
# Aim: Collapse groups of features that have the same taxonomic assignment
 
# --p-level :
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


qiime taxa collapse \
        --i-table core/RarTable.qza \
        --i-taxonomy taxonomy/taxonomy_reads-per-batch_0_RepSeq.qza \
        --p-level 2 \
        --o-collapsed-table ancom/ColTable.qza
        
##########################################################################
# Aim: Increment all counts in table by pseudocount

qiime composition add-pseudocount \
        --i-table ancom/ColTable.qza \
        --o-composition-table ancom/CompTable.qza

##########################################################################
# Aim: Apply Analysis of Composition of Microbiomes (ANCOM)

qiime composition ancom \
        --i-table ancom/CompTable.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --m-metadata-column 'Acronyme' \
        --o-visualization visual/Ancom.qzv
        
qiime tools export --input-path visual/Ancom.qzv --output-path export/visual/Ancom
qiime tools export --input-path ancom/ColTable.qza --output-path export/ancom/ColTable
qiime tools export --input-path ancom/CompTable.qza --output-path export/ancom/CompTable
        
        
###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10
        
##########################################################################
# Aim: Collapse groups of features that have the same taxonomic assignment
 
# --p-level :
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


qiime taxa collapse \
        --i-table core/RarTable.qza \
        --i-taxonomy taxonomy/taxonomy_reads-per-batch_0_RepSeq.qza \
        --p-level '2' \
        --o-collapsed-table ancom/ColTable.qza
        
##########################################################################
# Aim: Increment all counts in table by pseudocount

qiime composition add-pseudocount \
        --i-table ancom/ColTable.qza \
        --o-composition-table ancom/CompTable.qza

##########################################################################
# Aim: Apply Analysis of Composition of Microbiomes (ANCOM)

qiime composition ancom \
        --i-table ancom/CompTable.qza \
        --m-metadata-file $METADATA_V4/sample-metadata.tsv \
        --m-metadata-column 'Acronyme' \
        --o-visualization visual/Ancom.qzv
                
qiime tools export --input-path visual/Ancom.qzv --output-path export/visual/Ancom
qiime tools export --input-path ancom/ColTable.qza --output-path export/ancom/ColTable
qiime tools export --input-path ancom/CompTable.qza --output-path export/ancom/CompTable
