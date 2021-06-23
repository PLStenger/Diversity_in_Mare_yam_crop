#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4/

METADATA_ITS2=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/ITS2
METADATA_V4=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/V4

FUNGUILD=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/ITS2/Guilds_v1.1.py

###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

# Aim: Sort biom tsv table by ASVs

sed '1d ; s/\#OTU ID/ID/' export/core/RarTable/table-from-biom.tsv | sort -r > funguild/SortASV.tsv

# Aim: Sort taxonomy tsv table by OTUs

sed 's/Taxon/taxonomy/ ; s/\Feature ID/ID/' export/taxonomy/taxonomy_reads-per-batch_0_RepSeq/taxonomy.tsv | sort -r > funguild/SortTaxo.tsv

# Aim: Filter taxonomy tsv table

awk '{{print $2}}' funguild/SortTaxo.tsv > funguild/FiltTaxo.tsv

# Aim: Merge sorted biom and  taxonomy tsv tables

paste funguild/SortASV.tsv funguild/FiltTaxo.tsv > funguild/TaxoASV.tsv

# Aim: Parse fungal community datas by ecological guild with FUNGuild

python3.5 $FUNGUILD -otu funguild/TaxoASV.tsv -db fungi 
