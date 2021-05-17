#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_ITS2_fungi/
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria/

OUTPUT_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2/
OUTPUT_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4/

MANIFEST_FUNGI=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2/manifest.csv
MANIFEST_BACTERIA=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4/manifest.csv

###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' \
			    --input-path  $MANIFEST_FUNGI \
			    --output-path $OUTPUT_ITS2_fungi/demux.qza \
			    --input-format PairedEndFastqManifestPhred64V2

cd $OUTPUT_ITS2_fungi

qiime demux summarize --i-data demux.qza --o-visualization demux.qzv

# for vizualisation :
# https://view.qiime2.org

###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' \
			    --input-path  $MANIFEST_BACTERIA \
			    --output-path $OUTPUT_V4_bacteria/demux.qza \
			    --input-format PairedEndFastqManifestPhred64V2

cd $OUTPUT_V4_bacteria

qiime demux summarize --i-data demux.qza --o-visualization demux.qzv

# for vizualisation :
# https://view.qiime2.org
