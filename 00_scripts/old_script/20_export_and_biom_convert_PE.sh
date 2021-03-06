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

# Loop didn't work here, don't know why :

#for FILE in $(ls core/*.qza)
#do
#qiime tools export \
#        --input-path ${FILE##*/} \
#        --output-path export/core/${FILE##*/} \
#done;

# ok qiime tools export \
# ok         --input-path subtables/RarTable-Forest.qza \
# ok         --output-path export/subtables/RarTable-Forest \

# ok qiime tools export \
# ok         --input-path subtables/RarTable-Long_fallow.qza \
# ok         --output-path export/subtables/RarTable-Long_fallow \

# ok qiime tools export \
# ok         --input-path subtables/RarTable-short_fallow.qza \
# ok         --output-path export/subtables/RarTable-short_fallow \


# From script 14
# ok qiime tools export --input-path core/Matrix-braycurtis.qza --output-path export/core/Matrix-braycurtis
# ok qiime tools export --input-path core/Matrix-jaccard.qza --output-path export/core/Matrix-jaccard
# ok qiime tools export --input-path core/Matrix-unweighted_unifrac.qza --output-path export/core/Matrix-unweighted_unifrac
# ok qiime tools export --input-path core/Matrix-weighted_unifrac.qza --output-path export/core/Matrix-weighted_unifrac
# ok qiime tools export --input-path core/Vector-evenness.qza --output-path export/core/Vector-evenness
# ok qiime tools export --input-path core/Vector-faith_pd.qza --output-path export/core/Vector-faith_pd
# ok qiime tools export --input-path core/Vector-observed_asv.qza --output-path export/core/Vector-observed_asv
# ok qiime tools export --input-path core/Vector-shannon.qza --output-path export/core/Vector-shannon

# evenness_vector.qza doublons ?
# shannon_vector.qza idem ?
# unweighted_unifrac_distance_matrix.qza

# From script 12
# ok qiime tools export --input-path core/bray_curtis_distance_matrix.qza --output-path export/core/bray_curtis_distance_matrix
# ok qiime tools export --input-path core/bray_curtis_pcoa_results.qza --output-path export/core/bray_curtis_pcoa_results
# ok qiime tools export --input-path core/evenness_vector.qza --output-path export/core/evenness_vector
# ok qiime tools export --input-path core/faith_pd_vector.qza --output-path export/core/faith_pd_vector_BEFORE
# ok qiime tools export --input-path core/jaccard_distance_matrix.qza --output-path export/core/jaccard_distance_matrix
# ok qiime tools export --input-path core/jaccard_pcoa_results.qza --output-path export/core/jaccard_pcoa_results
# ok qiime tools export --input-path core/observed_otus_vector.qza --output-path export/core/observed_otus_vector
# ok qiime tools export --input-path core/rarefied_table.qza --output-path export/core/rarefied_table
# ok qiime tools export --input-path core/shannon_vector.qza --output-path export/core/shannon_vector
# ok qiime tools export --input-path core/unweighted_unifrac_distance_matrix.qza --output-path export/core/unweighted_unifrac_distance_matrix
# ok qiime tools export --input-path core/unweighted_unifrac_pcoa_results.qza --output-path export/core/unweighted_unifrac_pcoa_results
# ok qiime tools export --input-path core/weighted_unifrac_distance_matrix.qza --output-path export/core/weighted_unifrac_distance_matrix
# ok qiime tools export --input-path core/weighted_unifrac_pcoa_results.qza --output-path export/core/weighted_unifrac_pcoa_results


# ok qiime tools export --input-path visual/demux.qzv --output-path export/visual/demux
# ok qiime tools export --input-path visual/CoreBiomAll.qzv --output-path export/visual/CoreBiomAll
# ok qiime tools export --input-path visual/CoreBiom-Long_fallow.qzv --output-path export/visual/CoreBiom-Long_fallow
# ok qiime tools export --input-path visual/CoreBiom-short_fallow.qzv --output-path export/visual/CoreBiom-short_fallow
# ok qiime tools export --input-path visual/CoreBiom-Forest.qzv --output-path export/visual/CoreBiom-Forest
# ok qiime tools export --input-path visual/y0TaxaSum.qz.qzv --output-path export/visual/y0TaxaSum.qz
# ok qiime tools export --input-path visual/RegSum.qzv --output-path export/visual/RegSum
# ok qiime tools export --input-path visual/Regression.qzv --output-path export/visual/Regression
# ok qiime tools export --input-path visual/Ancom.qzv --output-path export/visual/Ancom
# ok qiime tools export --input-path visual/BetaSignification-braycurtis-Acronyme.qzv --output-path export/visual/BetaSignification-braycurtis-Acronyme
# ok qiime tools export --input-path visual/BetaSignification-jaccard-Acronyme.qzv --output-path export/visual/BetaSignification-jaccard-Acronyme
# ok qiime tools export --input-path visual/AlphaCorrelation-fisher_alpha.qzv --output-path export/visual/AlphaCorrelation-fisher_alpha
# ok qiime tools export --input-path visual/AlphaCorrelation-pielou_e.qzv --output-path export/visual/AlphaCorrelation-pielou_e
# ok qiime tools export --input-path visual/AlphaCorrelation-chao1.qzv --output-path export/visual/AlphaCorrelation-chao1
# ok qiime tools export --input-path visual/AlphaCorrelation-simpson_e.qzv --output-path export/visual/AlphaCorrelation-simpson_e
# ok qiime tools export --input-path visual/AlphaCorrelation-simpson.qzv --output-path export/visual/AlphaCorrelation-simpson
# ok qiime tools export --input-path visual/AlphaSignification-fisher_alpha.qzv --output-path export/visual/AlphaSignification-fisher_alpha
# ok qiime tools export --input-path visual/AlphaSignification-pielou_e.qzv --output-path export/visual/AlphaSignification-pielou_e
# ok qiime tools export --input-path visual/AlphaSignification-chao1.qzv --output-path export/visual/AlphaSignification-chao1
# ok qiime tools export --input-path visual/AlphaSignification-simpson_e.qzv --output-path export/visual/AlphaSignification-simpson_e
# ok qiime tools export --input-path visual/AlphaSignification-simpson.qzv --output-path export/visual/AlphaSignification-simpson
# ok qiime tools export --input-path visual/Emperor-braycurtis.qzv --output-path export/visual/Emperor-braycurtis
# ok qiime tools export --input-path visual/Emperor-jaccard.qzv --output-path export/visual/Emperor-jaccard
# ok qiime tools export --input-path visual/Emperor-weighted_unifrac.qzv --output-path export/visual/Emperor-weighted_unifrac
# ok qiime tools export --input-path visual/Emperor-unweighted_unifrac.qzv --output-path export/visual/Emperor-unweighted_unifrac
# ok qiime tools export --input-path visual/alpha-rarefaction.qzv --output-path export/visual/alpha-rarefaction
# ok qiime tools export --input-path visual/NegTable.qzv --output-path export/visual/NegTable
# ok qiime tools export --input-path visual/ConTable.qzv --output-path export/visual/ConTable
# ok qiime tools export --input-path visual/Table.qzv --output-path export/visual/Table
# ok qiime tools export --input-path visual/HitNegCtrl.qzv --output-path export/visual/HitNegCtrl
# ok qiime tools export --input-path visual/RepSeq.qzv --output-path export/visual/RepSeq
# ok qiime tools export --input-path visual/NegRepSeq.qzv --output-path export/visual/NegRepSeq


# ok qiime tools export --input-path taxonomy/Classifier.qza --output-path export/taxonomy/Classifier
# ok qiime tools export --input-path taxonomy/DataSeq.qza --output-path export/taxonomy/DataSeq
# ok qiime tools export --input-path taxonomy/RefSeq.qza --output-path export/taxonomy/RefSeq
# ok qiime tools export --input-path taxonomy/RefTaxo.qza --output-path export/taxonomy/RefTaxo
# ok qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_0_RepSeq.qza --output-path export/taxonomy/taxonomy_reads-per-batch_0_RepSeq

# ok qiime tools export --input-path unrooted-tree.qza --output-path export/tree/unrooted-tree
# ok qiime tools export --input-path rooted-tree.qza --output-path export/tree/rooted-tree
# ok cp tree.nwk export/tree/tree.nwk

# ok qiime tools export --input-path pcoa/PCoA-braycurtis.qza --output-path export/pcoa/PCoA-braycurtis
# ok qiime tools export --input-path pcoa/PCoA-jaccard.qza --output-path export/pcoa/PCoA-jaccard
# ok qiime tools export --input-path pcoa/PCoA-unweighted_unifrac.qza --output-path export/pcoa/PCoA-unweighted_unifrac
# ok qiime tools export --input-path pcoa/PCoA-weighted_unifrac.qza --output-path export/pcoa/PCoA-weighted_unifrac

# ok qiime tools export --input-path RarTable.qza --output-path export/table/RarTable
# ok qiime tools export --input-path RarRepSeq.qza --output-path export/table/RarRepSeq
# ok qiime tools export --input-path Classifier.qza --output-path export/table/Classifier
# ok qiime tools export --input-path RefSeq.qza --output-path export/table/RefSeq
# ok qiime tools export --input-path DataSeq.qza --output-path export/table/DataSeq
# ok qiime tools export --input-path RefTaxo.qza --output-path export/table/RefTaxo
# ok qiime tools export --input-path masked-aligned-RepSeq.qza --output-path export/table/masked-aligned-RepSeq
# ok qiime tools export --input-path aligned-RepSeq.qza --output-path export/table/aligned-RepSeq
# ok qiime tools export --input-path ConRepSeq.qza --output-path export/table/ConRepSeq
# ok qiime tools export --input-path ConTable.qza --output-path export/table/ConTable
# ok qiime tools export --input-path NegTable.qza --output-path export/table/NegTable
# ok qiime tools export --input-path NegRepSeq.qza --output-path export/table/NegRepSeq
# ok qiime tools export --input-path HitNegCtrl.qza --output-path export/table/HitNegCtrl
# ok qiime tools export --input-path SampleData.qza --output-path export/table/SampleData
# ok qiime tools export --input-path RepSeq.qza --output-path export/table/RepSeq
# ok qiime tools export --input-path Table.qza --output-path export/table/Table
# ok qiime tools export --input-path demux.qza --output-path export/core/demux



####### Biom convert
#
## Aim: Convert to/from the BIOM table format
#
#biom convert -i export/subtables/RarTable-Forest/feature-table.biom -o export/subtables/RarTable-Forest/table-from-biom.tsv --to-tsv
#biom convert -i export/subtables/RarTable-Long_fallow/feature-table.biom -o export/subtables/RarTable-Long_fallow/table-from-biom.tsv --to-tsv
#biom convert -i export/subtables/RarTable-short_fallow/feature-table.biom -o export/subtables/RarTable-short_fallow/table-from-biom.tsv --to-tsv
#
# # Aim: Remove first line and rename '#OTU ID' into 'ASV'
# 
# sed '1d ; s/\#OTU ID/ASV_ID/' export/subtables/RarTable-Forest/table-from-biom.tsv > export/subtables/RarTable-Forest/ASV.tsv
# sed '1d ; s/\#OTU ID/ASV_ID/' export/subtables/RarTable-Long_fallow/table-from-biom.tsv > export/subtables/RarTable-Long_fallow/ASV.tsv
# sed '1d ; s/\#OTU ID/ASV_ID/' export/subtables/RarTable-short_fallow/table-from-biom.tsv > export/subtables/RarTable-short_fallow/ASV.tsv
# 
# # Aim: Convert to/from the BIOM table format
# 
#biom convert -i export/core/rarefied_table/feature-table.biom -o export/core/rarefied_table/table-from-biom.tsv --to-tsv
#
## Aim: Remove first line and rename '#OTU ID' into 'ASV'
#
#sed '1d ; s/\#OTU ID/ASV_ID/' export/core/rarefied_table/table-from-biom.tsv > export/core/rarefied_table/ASV.tsv
#
#



###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10


# Aim: Export QIIME2 subtables artifact.qza

# Loop didn't work here, don't know why :

#for FILE in $(ls core/*.qza)
#do
#qiime tools export \
#        --input-path ${FILE##*/} \
#        --output-path export/core/${FILE##*/} \
#done;

qiime tools export \
        --input-path subtables/RarTable-Forest.qza \
        --output-path export/subtables/RarTable-Forest \

qiime tools export \
        --input-path subtables/RarTable-Long_fallow.qza \
        --output-path export/subtables/RarTable-Long_fallow \

qiime tools export \
        --input-path subtables/RarTable-short_fallow.qza \
        --output-path export/subtables/RarTable-short_fallow \


# From script 14
qiime tools export --input-path core/Matrix-braycurtis.qza --output-path export/core/Matrix-braycurtis
qiime tools export --input-path core/Matrix-jaccard.qza --output-path export/core/Matrix-jaccard
qiime tools export --input-path core/Matrix-unweighted_unifrac.qza --output-path export/core/Matrix-unweighted_unifrac
qiime tools export --input-path core/Matrix-weighted_unifrac.qza --output-path export/core/Matrix-weighted_unifrac
qiime tools export --input-path core/Vector-evenness.qza --output-path export/core/Vector-evenness
qiime tools export --input-path core/Vector-faith_pd.qza --output-path export/core/Vector-faith_pd
qiime tools export --input-path core/Vector-observed_asv.qza --output-path export/core/Vector-observed_asv
qiime tools export --input-path core/Vector-shannon.qza --output-path export/core/Vector-shannon

# evenness_vector.qza doublons ?
# shannon_vector.qza idem ?
# unweighted_unifrac_distance_matrix.qza

# From script 12
qiime tools export --input-path core-metrics-results/bray_curtis_distance_matrix.qza --output-path export/core/bray_curtis_distance_matrix
qiime tools export --input-path core-metrics-results/bray_curtis_pcoa_results.qza --output-path export/core/bray_curtis_pcoa_results
qiime tools export --input-path core-metrics-results/evenness_vector.qza --output-path export/core/evenness_vector
qiime tools export --input-path core-metrics-results/faith_pd_vector.qza --output-path export/core/faith_pd_vector_BEFORE
qiime tools export --input-path core-metrics-results/jaccard_distance_matrix.qza --output-path export/core/jaccard_distance_matrix
qiime tools export --input-path core-metrics-results/jaccard_pcoa_results.qza --output-path export/core/jaccard_pcoa_results
qiime tools export --input-path core-metrics-results/observed_otus_vector.qza --output-path export/core/observed_otus_vector
qiime tools export --input-path core-metrics-results/rarefied_table.qza --output-path export/core/rarefied_table
qiime tools export --input-path core-metrics-results/shannon_vector.qza --output-path export/core/shannon_vector
qiime tools export --input-path core-metrics-results/unweighted_unifrac_distance_matrix.qza --output-path export/core/unweighted_unifrac_distance_matrix
qiime tools export --input-path core-metrics-results/unweighted_unifrac_pcoa_results.qza --output-path export/core/unweighted_unifrac_pcoa_results
qiime tools export --input-path core-metrics-results/weighted_unifrac_distance_matrix.qza --output-path export/core/weighted_unifrac_distance_matrix
qiime tools export --input-path core-metrics-results/weighted_unifrac_pcoa_results.qza --output-path export/core/weighted_unifrac_pcoa_results


qiime tools export --input-path visual/demux.qzv --output-path export/visual/demux
qiime tools export --input-path visual/CoreBiomAll.qzv --output-path export/visual/CoreBiomAll
qiime tools export --input-path visual/CoreBiom-Long_fallow.qzv --output-path export/visual/CoreBiom-Long_fallow
qiime tools export --input-path visual/CoreBiom-short_fallow.qzv --output-path export/visual/CoreBiom-short_fallow
qiime tools export --input-path visual/CoreBiom-Forest.qzv --output-path export/visual/CoreBiom-Forest
qiime tools export --input-path visual/y0TaxaSum.qz.qzv --output-path export/visual/y0TaxaSum.qz
qiime tools export --input-path visual/RegSum.qzv --output-path export/visual/RegSum
qiime tools export --input-path visual/Regression.qzv --output-path export/visual/Regression
qiime tools export --input-path visual/Ancom.qzv --output-path export/visual/Ancom
qiime tools export --input-path visual/BetaSignification-braycurtis-Acronyme.qzv --output-path export/visual/BetaSignification-braycurtis-Acronyme
qiime tools export --input-path visual/BetaSignification-jaccard-Acronyme.qzv --output-path export/visual/BetaSignification-jaccard-Acronyme
qiime tools export --input-path visual/AlphaCorrelation-fisher_alpha.qzv --output-path export/visual/AlphaCorrelation-fisher_alpha
qiime tools export --input-path visual/AlphaCorrelation-pielou_e.qzv --output-path export/visual/AlphaCorrelation-pielou_e
qiime tools export --input-path visual/AlphaCorrelation-chao1.qzv --output-path export/visual/AlphaCorrelation-chao1
qiime tools export --input-path visual/AlphaCorrelation-simpson_e.qzv --output-path export/visual/AlphaCorrelation-simpson_e
qiime tools export --input-path visual/AlphaCorrelation-simpson.qzv --output-path export/visual/AlphaCorrelation-simpson
qiime tools export --input-path visual/AlphaSignification-fisher_alpha.qzv --output-path export/visual/AlphaSignification-fisher_alpha
qiime tools export --input-path visual/AlphaSignification-pielou_e.qzv --output-path export/visual/AlphaSignification-pielou_e
qiime tools export --input-path visual/AlphaSignification-chao1.qzv --output-path export/visual/AlphaSignification-chao1
qiime tools export --input-path visual/AlphaSignification-simpson_e.qzv --output-path export/visual/AlphaSignification-simpson_e
qiime tools export --input-path visual/AlphaSignification-simpson.qzv --output-path export/visual/AlphaSignification-simpson
qiime tools export --input-path visual/Emperor-braycurtis.qzv --output-path export/visual/Emperor-braycurtis
qiime tools export --input-path visual/Emperor-jaccard.qzv --output-path export/visual/Emperor-jaccard
qiime tools export --input-path visual/Emperor-weighted_unifrac.qzv --output-path export/visual/Emperor-weighted_unifrac
qiime tools export --input-path visual/Emperor-unweighted_unifrac.qzv --output-path export/visual/Emperor-unweighted_unifrac
qiime tools export --input-path visual/alpha-rarefaction.qzv --output-path export/visual/alpha-rarefaction
# ok qiime tools export --input-path visual/NegTable.qzv --output-path export/visual/NegTable
# ok qiime tools export --input-path visual/ConTable.qzv --output-path export/visual/ConTable
# ok qiime tools export --input-path visual/Table.qzv --output-path export/visual/Table
qiime tools export --input-path visual/HitNegCtrl.qzv --output-path export/visual/HitNegCtrl
qiime tools export --input-path visual/RepSeq.qzv --output-path export/visual/RepSeq
qiime tools export --input-path visual/NegRepSeq.qzv --output-path export/visual/NegRepSeq


qiime tools export --input-path taxonomy/Classifier.qza --output-path export/taxonomy/Classifier
qiime tools export --input-path taxonomy/DataSeq.qza --output-path export/taxonomy/DataSeq
qiime tools export --input-path taxonomy/RefSeq.qza --output-path export/taxonomy/RefSeq
qiime tools export --input-path taxonomy/RefTaxo.qza --output-path export/taxonomy/RefTaxo
qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_0_RepSeq.qza --output-path export/taxonomy/taxonomy_reads-per-batch_0_RepSeq

qiime tools export --input-path unrooted-tree.qza --output-path export/tree/unrooted-tree
qiime tools export --input-path rooted-tree.qza --output-path export/tree/rooted-tree
cp tree.nwk export/tree/tree.nwk

qiime tools export --input-path pcoa/PCoA-braycurtis.qza --output-path export/pcoa/PCoA-braycurtis
qiime tools export --input-path pcoa/PCoA-jaccard.qza --output-path export/pcoa/PCoA-jaccard
qiime tools export --input-path pcoa/PCoA-unweighted_unifrac.qza --output-path export/pcoa/PCoA-unweighted_unifrac
qiime tools export --input-path pcoa/PCoA-weighted_unifrac.qza --output-path export/pcoa/PCoA-weighted_unifrac



qiime tools export --input-path RarTable.qza --output-path export/table/RarTable
qiime tools export --input-path RarRepSeq.qza --output-path export/table/RarRepSeq
qiime tools export --input-path Classifier.qza --output-path export/table/Classifier
qiime tools export --input-path RefSeq.qza --output-path export/table/RefSeq
qiime tools export --input-path DataSeq.qza --output-path export/table/DataSeq
qiime tools export --input-path RefTaxo.qza --output-path export/table/RefTaxo
qiime tools export --input-path masked-aligned-RepSeq.qza --output-path export/table/masked-aligned-RepSeq
qiime tools export --input-path aligned-RepSeq.qza --output-path export/table/aligned-RepSeq
qiime tools export --input-path ConRepSeq.qza --output-path export/table/ConRepSeq
qiime tools export --input-path ConTable.qza --output-path export/table/ConTable
qiime tools export --input-path NegTable.qza --output-path export/table/NegTable
qiime tools export --input-path NegRepSeq.qza --output-path export/table/NegRepSeq
qiime tools export --input-path HitNegCtrl.qza --output-path export/table/HitNegCtrl
qiime tools export --input-path SampleData.qza --output-path export/table/SampleData
qiime tools export --input-path RepSeq.qza --output-path export/table/RepSeq
qiime tools export --input-path Table.qza --output-path export/table/Table
qiime tools export --input-path demux.qza --output-path export/table/demux
qiime tools export --input-path RepSeq.qza --output-path export/table/RepSeq
qiime tools export --input-path RepSeq.qza --output-path export/table/RepSeq
qiime tools export --input-path RepSeq.qza --output-path export/table/RepSeq
qiime tools export --input-path RepSeq.qza --output-path export/table/RepSeq


############################################################################################################
###### Biom convert

# Aim: Convert to/from the BIOM table format

biom convert -i export/subtables/RarTable-Forest/feature-table.biom -o export/subtables/RarTable-Forest/table-from-biom.tsv --to-tsv
biom convert -i export/subtables/RarTable-Long_fallow/feature-table.biom -o export/subtables/RarTable-Long_fallow/table-from-biom.tsv --to-tsv
biom convert -i export/subtables/RarTable-short_fallow/feature-table.biom -o export/subtables/RarTable-short_fallow/table-from-biom.tsv --to-tsv

 # Aim: Remove first line and rename '#OTU ID' into 'ASV'
 
 sed '1d ; s/\#OTU ID/ASV_ID/' export/subtables/RarTable-Forest/table-from-biom.tsv > export/subtables/RarTable-Forest/ASV.tsv
 sed '1d ; s/\#OTU ID/ASV_ID/' export/subtables/RarTable-Long_fallow/table-from-biom.tsv > export/subtables/RarTable-Long_fallow/ASV.tsv
 sed '1d ; s/\#OTU ID/ASV_ID/' export/subtables/RarTable-short_fallow/table-from-biom.tsv > export/subtables/RarTable-short_fallow/ASV.tsv
 
 # Aim: Convert to/from the BIOM table format
 
biom convert -i export/core/rarefied_table/feature-table.biom -o export/core/rarefied_table/table-from-biom.tsv --to-tsv

# Aim: Remove first line and rename '#OTU ID' into 'ASV'

sed '1d ; s/\#OTU ID/ASV_ID/' export/core/rarefied_table/table-from-biom.tsv > export/core/rarefied_table/ASV.tsv




