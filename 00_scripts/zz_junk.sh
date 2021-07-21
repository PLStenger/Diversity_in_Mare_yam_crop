#!/usr/bin/env bash

# pathways in cluster:
DATADIRECTORY_ITS2_fungi=/scratch_vol1/fungi/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2/
DATADIRECTORY_V4_bacteria=/scratch_vol1/fungi/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4/

METADATA_ITS2=/scratch_vol1/fungi/Diversity_in_Mare_yam_crop/98_database_files/ITS2/
METADATA_V4=/scratch_vol1/fungi/Diversity_in_Mare_yam_crop/98_database_files/V4/

TMPDIR=/scratch_vol1

###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2021.4

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p taxonomy
mkdir -p export/taxonomy

# I'm doing this step in order to deal the no space left in cluster :
export TMPDIR='/scratch_vol1/fungi'
echo $TMPDIR

echo '##############################################################################################################################'
echo '### Bacteria ###'
echo '##############################################################################################################################'

###### All this step was for "old" database, now we uysed new ones 
######
######
######
######qiime tools import --type 'FeatureData[Taxonomy]' \
######  --input-format HeaderlessTSVTaxonomyFormat \
######  --input-path /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/98_database_files/silva_nr99_v138_wSpecies_train_set.fa \
######  --output-path taxonomy/RefTaxo.qza
######
######qiime tools import --type 'FeatureData[Sequence]' \
######  --input-path /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/07_Rhabdastrella_globostellata_microbiome/Rhabdastrella_globostellata_microbiome/98_database_files/silva_nr99_v138_wSpecies_train_set.fa \
######  --output-path taxonomy/DataSeq.qza
######
######   
####### Aim: Extract sequencing-like reads from a reference database.
####### Warning: For v4 only !!! Not for its2 !!! 
######
####### The --p-trunc-len parameter should only be used to trim reference sequences,
####### if query sequences are trimmed to this same length or shorter.
###### 
####### Paired sequences that successfully join will typically be variable in length.
####### Single reads not truncated at a specific length may also be variable in length.
######
####### For classification of paired-end reads and untrimmed single-end reads,
####### we recommend training a classifier on sequences that have been extracted
####### at the appropriate primer sites, but are not trimmed !!!
####### -----
####### The primer sequences used for extracting reads should be the actual DNA-binding
####### (i.e., biological) sequence contained within a primer construct.
######
####### It should NOT contain any non-biological, non-binding sequence,
####### e.g., adapter, linker, or barcode sequences.
######
####### If you aren't sure what section of your primer sequences are actual DNA-binding
####### you should consult whoever constructed your sequencing library, your sequencing
####### center, or the original source literature on these primers.
######
####### If your primer sequences are > 30 nt long, they most likely contain some
####### non-biological sequence !
######
######qiime feature-classifier extract-reads --i-sequences taxonomy/DataSeq.qza \
######        --p-f-primer 'GTGCCAGCMGCCGCGGTAA' \
######        --p-r-primer 'TCCTCCGCTTATTGATATGC' \
######        --o-reads taxonomy/RefSeq.qza 
######        
######        #--p-trunc-len {params.length} \
######
####### Aim: Create a scikit-learn naive_bayes classifier for reads
######
######qiime feature-classifier fit-classifier-naive-bayes \
######  --i-reference-reads taxonomy/RefSeq.qza \
######  --i-reference-taxonomy taxonomy/RefTaxo.qza \
######  --o-classifier taxonomy/Classifier.qza

# With new database :

# See here for only V4 : https://www.dropbox.com/sh/nz7c5asn6b3hr1j/AADMAR-YZOBkpUQJLumZ9w3wa/ver_0.02?dl=0&subfolder_nav_tracking=1
# See here for all 16S : https://www.dropbox.com/sh/ibpy9j0clw8dzwm/AAAIVuYnqUzAOxlg2fijePQna/ver_0.02?dl=0&subfolder_nav_tracking=1

# See this thread https://forum.qiime2.org/t/silva-138-classifiers/13131 (found because of this thread : https://forum.qiime2.org/t/silva-138-for-qiime2/12957/4)

#cp $METADATA_V4/SILVA-138-SSURef-full-length-classifier.qza taxonomy/Classifier.qza
cp $METADATA_V4/SILVA-138-SSURef-Full-Seqs.qza taxonomy/DataSeq.qza
cp $METADATA_V4/Silva-v138-full-length-seq-taxonomy.qza taxonomy/RefTaxo.qza

# Here only for V4 --> forward: 'GTGCCAGCMGCCGCGGTAA'  # 515f & reverse: 'GGACTACHVGGGTWTCTAAT' # 806r
#qiime feature-classifier extract-reads --i-sequences taxonomy/DataSeq.qza \
#        --p-f-primer 'GTGCCAGCMGCCGCGGTAA' \
#        --p-r-primer 'TCCTCCGCTTATTGATATGC' \
#        --o-reads taxonomy/RefSeq.qza 

# Here for V1V2V3V4 --> forward 515f & reverse 806r
qiime feature-classifier extract-reads --i-sequences taxonomy/DataSeq.qza \
        --p-f-primer 'GTGCCAGCMGCCGCGGTAA' \
        --p-r-primer 'TCCTCCGCTTATTGATATGC' \
        --o-reads taxonomy/RefSeq.qza         


# Aim: Create a scikit-learn naive_bayes classifier for reads

qiime feature-classifier fit-classifier-naive-bayes \
  --i-reference-reads taxonomy/RefSeq.qza \
  --i-reference-taxonomy taxonomy/RefTaxo.qza \
  --o-classifier taxonomy/Classifier.qza
  
# Aim: Create a scikit-learn naive_bayes classifier for reads

qiime feature-classifier classify-sklearn \
   --i-classifier taxonomy/Classifier.qza \
   --i-reads core/ConRepSeq.qza \
   --o-classification taxonomy/taxonomy_reads-per-batch_ConRepSeq.qza
   
qiime feature-classifier classify-sklearn \
  --i-classifier taxonomy/Classifier.qza \
  --i-reads core/RepSeq.qza \
  --o-classification taxonomy/taxonomy_reads-per-batch_RepSeq.qza

qiime feature-classifier classify-sklearn \
  --i-classifier taxonomy/Classifier.qza \
  --i-reads core/RarRepSeq.qza \
  --o-classification taxonomy/taxonomy_reads-per-batch_RarRepSeq.qza

# Switch to https://chmi-sops.github.io/mydoc_qiime2.html#step-9-assign-taxonomy
# --p-reads-per-batch 0 (default)

qiime metadata tabulate \
  --m-input-file taxonomy/taxonomy_reads-per-batch_RarRepSeq.qza \
  --o-visualization taxonomy/taxonomy_reads-per-batch_RarRepSeq.qzv

qiime metadata tabulate \
  --m-input-file taxonomy/taxonomy_reads-per-batch_ConRepSeq.qza \
  --o-visualization taxonomy/taxonomy_reads-per-batch_ConRepSeq.qzv
  
qiime metadata tabulate \
  --m-input-file taxonomy/taxonomy_reads-per-batch_RepSeq.qza \
  --o-visualization taxonomy/taxonomy_reads-per-batch_RepSeq.qzv  

# Now create a visualization of the classified sequences.
  
qiime taxa barplot \
  --i-table core/Table.qza \
  --i-taxonomy taxonomy/taxonomy_reads-per-batch_RepSeq.qza \
  --m-metadata-file $METADATA_V4/sample-metadata.tsv \
  --o-visualization taxonomy/taxa-bar-plots_reads-per-batch_RepSeq.qzv

qiime taxa barplot \
  --i-table core/ConTable.qza \
  --i-taxonomy taxonomy/taxonomy_reads-per-batch_ConRepSeq.qza \
  --m-metadata-file $METADATA_V4/sample-metadata.tsv \
  --o-visualization taxonomy/taxa-bar-plots_reads-per-batch_ConRepSeq.qzv
  
qiime taxa barplot \
  --i-table core/RarTable.qza \
  --i-taxonomy taxonomy/taxonomy_reads-per-batch_RarRepSeq.qza \
  --m-metadata-file $METADATA_V4/sample-metadata.tsv \
  --o-visualization taxonomy/taxa-bar-plots_reads-per-batch_RarRepSeq.qzv  

qiime tools export --input-path taxonomy/Classifier.qza --output-path export/taxonomy/Classifier
qiime tools export --input-path taxonomy/RefSeq.qza --output-path export/taxonomy/RefSeq
qiime tools export --input-path taxonomy/DataSeq.qza --output-path export/taxonomy/DataSeq
qiime tools export --input-path taxonomy/RefTaxo.qza --output-path export/taxonomy/RefTaxo
  
qiime tools export --input-path taxonomy/taxa-bar-plots_reads-per-batch_RarRepSeq.qzv --output-path export/taxonomy/taxa-bar-plots_reads-per-batch_RarRepSeq
qiime tools export --input-path taxonomy/taxa-bar-plots_reads-per-batch_ConRepSeq.qzv --output-path export/taxonomy/taxa-bar-plots_reads-per-batch_ConRepSeq
qiime tools export --input-path taxonomy/taxa-bar-plots_reads-per-batch_RepSeq.qzv --output-path export/taxonomy/taxa-bar-plots_reads-per-batch_RepSeq

qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_RepSeq.qzv --output-path export/taxonomy/taxonomy_reads-per-batch_RepSeq_visual
qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_ConRepSeq.qzv --output-path export/taxonomy/taxonomy_reads-per-batch_ConRepSeq_visual
qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_RarRepSeq.qzv --output-path export/taxonomy/taxonomy_reads-per-batch_RarRepSeq_visual

qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_RepSeq.qza --output-path export/taxonomy/taxonomy_reads-per-batch_RepSeq
qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_ConRepSeq.qza --output-path export/taxonomy/taxonomy_reads-per-batch_ConRepSeq
qiime tools export --input-path taxonomy/taxonomy_reads-per-batch_RarRepSeq.qza --output-path export/taxonomy/taxonomy_reads-per-batch_RarRepSeq
