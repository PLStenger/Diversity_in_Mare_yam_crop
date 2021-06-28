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

qiime feature-table filter-samples \
        --i-table core/RarTable.qza \
        --m-metadata-file $METADATA_ITS2/sample-metadata.tsv \
        --p-where "[#SampleID] IN ('F1', 'F2', 'F3', 'F4', 'F5', 'SF1', 'SF2', 'SF3', 'SF4', 'SF5', 'LF1', 'LF2', 'LF3', 'LF4', 'LF5')"  \
        --o-filtered-table subtables/RarTable-all.qza
        
qiime feature-table core-features \
        --i-table subtables/RarTable-all.qza \
        --p-min-fraction 0.1 \
        --p-max-fraction 1.0 \
        --p-steps 10 \
        --o-visualization visual/CoreBiom-all.qzv    
        
  # CoreBiomAll.qzv  a suprrimer ?      
        
        

qiime tools export --input-path subtables/RarTable-Forest.qza --output-path export/subtables/RarTable-Forest 
qiime tools export --input-path subtables/RarTable-Long_fallow.qza --output-path export/subtables/RarTable-Long_fallow 
qiime tools export --input-path subtables/RarTable-short_fallow.qza --output-path export/subtables/RarTable-short_fallow       
qiime tools export --input-path subtables/RarTable-all.qza --output-path export/subtables/RarTable-all    
        
#qiime tools export --input-path visual/CoreBiomAll.qzv --output-path export/visual/CoreBiomAll
qiime tools export --input-path visual/CoreBiom-all.qzv --output-path export/visual/CoreBiom-all
qiime tools export --input-path visual/CoreBiom-Long_fallow.qzv --output-path export/visual/CoreBiom-Long_fallow
qiime tools export --input-path visual/CoreBiom-short_fallow.qzv --output-path export/visual/CoreBiom-short_fallow
qiime tools export --input-path visual/CoreBiom-Forest.qzv --output-path export/visual/CoreBiom-Forest



biom convert -i export/subtables/RarTable-all/feature-table.biom -o export/subtables/RarTable-all/table-from-biom.tsv --to-tsv

sed '1d ; s/\#OTU ID/ASV_ID/' export/subtables/RarTable-all/table-from-biom.tsv > export/subtables/RarTable-all/ASV.tsv

###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10




