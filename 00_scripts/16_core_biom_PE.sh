    #!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4/


###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

# Aim: Filter sample from table based on a feature table or metadata

qiime feature-table filter-samples \
        --i-table RarTable.qza \
        --m-metadata-file sample-metadata.tsv \
        --p-where 'Acronyme = \"F\"'  \
        --o-filtered-table subtables/RarTable-Forest.qza

qiime feature-table filter-samples \
        --i-table RarTable.qza \
        --m-metadata-file sample-metadata.tsv \
        --p-where 'Acronyme = \"SF\"'  \
        --o-filtered-table subtables/RarTable-short_fallow.qza

qiime feature-table filter-samples \
        --i-table RarTable.qza \
        --m-metadata-file sample-metadata.tsv \
        --p-where 'Acronyme = \"LF\"'  \
        --o-filtered-table subtables/RarTable-Long_fallow.qza
           
# Aim: Identify "core" features, which are features observed,
     # in a user-defined fraction of the samples
 
qiime feature-table core-features
        --i-table subtables/RarTable-Forest.qza
        --p-min-fraction 0.1
        --p-max-fraction 1.0
        --p-steps 10
        --o-visualization visual/CoreBiom-Forest.qzv
 
qiime feature-table core-features
        --i-table subtables/RarTable-short_fallow.qza
        --p-min-fraction 0.1
        --p-max-fraction 1.0
        --p-steps 10
        --o-visualization visual/CoreBiom-short_fallow.qzv 
 
qiime feature-table core-features
        --i-table subtables/RarTable-Long_fallow.qza
        --p-min-fraction 0.1
        --p-max-fraction 1.0
        --p-steps 10
        --o-visualization visual/CoreBiom-Long_fallow.qzv 
        
# Aim: Identify "core" features, which are features observed,
     # in a user-defined fraction of the samples

qiime feature-table core-features
        --i-table RarTable.qza
        --p-min-fraction 0.1
        --p-max-fraction 1.0
        --p-steps 10
        --o-visualization visual/CoreBiomAll.qzv 

###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

# Aim: Filter sample from table based on a feature table or metadata

qiime feature-table filter-samples \
        --i-table RarTable.qza \
        --m-metadata-file sample-metadata.tsv \
        --p-where 'Acronyme = \"F\"'  \
        --o-filtered-table subtables/RarTable-Forest.qza

qiime feature-table filter-samples \
        --i-table RarTable.qza \
        --m-metadata-file sample-metadata.tsv \
        --p-where 'Acronyme = \"SF\"'  \
        --o-filtered-table subtables/RarTable-short_fallow.qza

qiime feature-table filter-samples \
        --i-table RarTable.qza \
        --m-metadata-file sample-metadata.tsv \
        --p-where 'Acronyme = \"LF\"'  \
        --o-filtered-table subtables/RarTable-Long_fallow.qza
           
# Aim: Identify "core" features, which are features observed,
     # in a user-defined fraction of the samples
 
qiime feature-table core-features
        --i-table subtables/RarTable-Forest.qza
        --p-min-fraction 0.1
        --p-max-fraction 1.0
        --p-steps 10
        --o-visualization visual/CoreBiom-Forest.qzv
 
qiime feature-table core-features
        --i-table subtables/RarTable-short_fallow.qza
        --p-min-fraction 0.1
        --p-max-fraction 1.0
        --p-steps 10
        --o-visualization visual/CoreBiom-short_fallow.qzv 
 
qiime feature-table core-features
        --i-table subtables/RarTable-Long_fallow.qza
        --p-min-fraction 0.1
        --p-max-fraction 1.0
        --p-steps 10
        --o-visualization visual/CoreBiom-Long_fallow.qzv 
        
# Aim: Identify "core" features, which are features observed,
     # in a user-defined fraction of the samples

qiime feature-table core-features
        --i-table RarTable.qza
        --p-min-fraction 0.1
        --p-max-fraction 1.0
        --p-steps 10
        --o-visualization visual/CoreBiomAll.qzv 
        
        
        
