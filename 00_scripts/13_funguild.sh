#!/usr/bin/env bash

#DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2/
#DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4/
#
#METADATA_ITS2=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/ITS2
#METADATA_V4=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/V4
#
#FUNGUILD=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/ITS2/Guilds_v1.1.py
#
################################################################
#### For Fungi
################################################################
#
#cd $DATADIRECTORY_ITS2_fungi
#
#eval "$(conda shell.bash hook)"
#conda activate qiime2-2019.10
#
## Aim: Sort biom tsv table by ASVs
#
##sed '1d ; s/\#OTU ID/ID/' export/core/RarTable/table-from-biom.tsv | sort -r > funguild/SortASV.tsv
#sed '1d ; s/\#OTU ID/ID/' export/core/rarefied_table/table-from-biom.tsv | sort -r > funguild/SortASV.tsv
#
#
## Aim: Sort taxonomy tsv table by OTUs
#
#sed 's/Taxon/taxonomy/ ; s/\Feature ID/ID/' export/taxonomy/taxonomy_reads-per-batch_0_RepSeq/taxonomy.tsv | sort -r > funguild/SortTaxo.tsv
#
## Aim: Filter taxonomy tsv table
#
#awk '{{print $2}}' funguild/SortTaxo.tsv > funguild/FiltTaxo.tsv
#
## Aim: Merge sorted biom and  taxonomy tsv tables
#
#paste funguild/SortASV.tsv funguild/FiltTaxo.tsv > funguild/TaxoASV.tsv
#
### Aim: Parse fungal community datas by ecological guild with FUNGuild
##python3 $FUNGUILD -otu funguild/TaxoASV.tsv -db fungi 


################################################################
#### Better to run in local
################################################################

# Follow instruction from here : https://github.com/UMNFuN/FUNGuild
# or 
# git clone https://github.com/UMNFuN/FUNGuild
# cd FUNGuild/

# For next step : be careful than the header is still here (sort can be problematic)
sed '1d ; s/\#OTU ID/ID/' table-from-biom.tsv > SortASV.tsv
# For next step : be careful than the header is still here (sort can be problematic)
sed 's/Taxon/taxonomy/ ; s/\Feature ID/ID/' taxonomy.tsv > SortTaxo.tsv
awk '{{print $2}}' SortTaxo.tsv > FiltTaxo.tsv
paste SortASV.tsv FiltTaxo.tsv > TaxoASV.tsv

# Warning to put quotes ("), change ";" by ",", delete "__", etc..

# The input need to be like that :
# ID	F1	F3	F4	F5	LF1	LF3	LF4	SF1	SF2	SF4	SF5	taxonomy
# 1c59a2b1a01274325dbef821eaba4182	1341	1248	983	429	458	784	1566	134	1863	653	68	"k:Fungi"
# dd1fe660214b39824b616bd2680c6449	457	520	168	1332	1318	1313	227	11	284	1329	0	"k:Fungi,p:Ascomycota,c:Eurotiomycetes,o:Chaetothyriales,f:Herpotrichiellaceae,g:unidentified,s:unidentified"
# 0855391856e3d2ebeec3a858dfccd810	369	757	355	1040	0	1001	272	346	439	1536	0	"k:Fungi,p:Ascomycota,c:Eurotiomycetes,o:Chaetothyriales"
# c8f7bdebcacd1a67f22781ea1217396a	701	597	546	0	229	382	615	52	999	394	45	"k:Fungi"
# d0b765a332f1bf3131fa037879fa7192	324	99	644	429	288	389	0	256	779	0	559	"k:Fungi"
# b608ea18e6f891583c7ed191d44d4b4f	212	517	144	602	185	157	1506	0	112	447	131	"k:Fungi"

# And then run this 

python3 Guilds_v1.1.py -otu TaxoASV.tsv -db fungi -m -u




