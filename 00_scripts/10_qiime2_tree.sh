#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/V4/

# Aim: construct a rooted phylogenetic tree

###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

##carry out a multiple seqeunce alignment using Mafft
# qiime alignment mafft \
#  --i-sequences RepSeq.qza \
#  --o-alignment aligned-RepSeq.qza
#
##mask (or filter) the alignment to remove positions that are highly variable. These positions are generally considered to add noise to a resulting phylogenetic tree.
#qiime alignment mask \
#  --i-alignment aligned-RepSeq.qza \
#  --o-masked-alignment masked-aligned-RepSeq.qza
#
##create the tree using the Fasttree program
#qiime phylogeny fasttree \
#  --i-alignment masked-aligned-RepSeq.qza \
#  --o-tree unrooted-tree.qza
#
##root the tree using the longest root
#qiime phylogeny midpoint-root \
#  --i-tree unrooted-tree.qza \
#  --o-rooted-tree rooted-tree.qza
  
#export the tree  
qiime tools export \
  unrooted-tree.qza \
  --output-dir exported-tree  
  
# This out put is in Newick format, see http://scikit-bio.org/docs/latest/generated/skbio.io.format.newick.html  
# See it on https://itol.embl.de

###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10


##carry out a multiple seqeunce alignment using Mafft
# qiime alignment mafft \
#  --i-sequences RepSeq.qza \
#  --o-alignment aligned-RepSeq.qza
#
##mask (or filter) the alignment to remove positions that are highly variable. These positions are generally considered to add noise to a resulting phylogenetic tree.
#qiime alignment mask \
#  --i-alignment aligned-RepSeq.qza \
#  --o-masked-alignment masked-aligned-RepSeq.qza
#
##create the tree using the Fasttree program
#qiime phylogeny fasttree \
#  --i-alignment masked-aligned-RepSeq.qza \
#  --o-tree unrooted-tree.qza
#
##root the tree using the longest root
#qiime phylogeny midpoint-root \
#  --i-tree unrooted-tree.qza \
#  --o-rooted-tree rooted-tree.qza
  
  
#export the tree  
qiime tools export \
  unrooted-tree.qza \
  --output-dir exported-tree    

# This out put is in Newick format, see http://scikit-bio.org/docs/latest/generated/skbio.io.format.newick.html  
# See it on https://itol.embl.de
