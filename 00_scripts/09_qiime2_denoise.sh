#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/

cd $DATADIRECTORY_ITS2_fungi

# https://docs.qiime2.org/2021.2/plugins/available/dada2/denoise-single/
# Aim: denoises single-end sequences, dereplicates them, and filters
# chimeras and singletons sequences
# Use: qiime dada2 denoise-single [OPTIONS]

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

# DADA2 method

qiime dada2 denoise-single --i-demultiplexed-seqs demux.qza \
                           --p-n-threads 6 \
                           --p-chimera-method 'consensus' \
                           --p-trunc-len 0 \
                           --p-trunc-q 0 \
                           --o-representative-sequences RepSeq.qza \
                           --o-table Table.qza \
                           --o-denoising-stats Stats.qza


