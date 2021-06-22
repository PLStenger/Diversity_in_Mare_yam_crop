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

# Aim: Export QIIME2 subtables artifact.qza

qiime tools export \
        --input-path subtables/RarTable-Forest.qza \
        --output-path export/subtables/RarTable-Forest \

qiime tools export \
        --input-path subtables/RarTable-Long_fallow.qza \
        --output-path export/subtables/RarTable-Long_fallow \

qiime tools export \
        --input-path subtables/RarTable-short_fallow.qza \
        --output-path export/subtables/RarTable-short_fallow \


for FILE in $(ls core/*.qza)

do

qiime tools export \
        --input-path ${FILE##*/} \
        --output-path export/core/${FILE##*/} \

done;

qiime tools export \
        --input-path core/Vector-faith_pd.qza \
        --output-path export/core/Vector-faith_pd \




# Aim: Convert to/from the BIOM table format

#biom convert \
#        -i  \
#        -o {output.tsv_file} \
#        --to-tsv
