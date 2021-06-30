#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_ITS2_fungi
DATADIRECTORY_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/02_cleaned_data/DATAOUTPUT_V4_bacteria

OUTPUT_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/ITS2
OUTPUT_V4_bacteria=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/Paired_end/V4

MANIFEST_FUNGI=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/ITS2/manifest
MANIFEST_BACTERIA=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/98_database_files/V4/manifest

###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS2_fungi

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT_ITS2_fungi/core
mkdir -p $OUTPUT_ITS2_fungi/visual

qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' \
			    --input-path  $MANIFEST_FUNGI \
			    --output-path $OUTPUT_ITS2_fungi/core/demux.qza \
			    --input-format PairedEndFastqManifestPhred33V2

cd $OUTPUT_ITS2_fungi

qiime demux summarize --i-data core/demux.qza --o-visualization visual/demux.qzv

# for vizualisation :
# https://view.qiime2.org

qiime tools export --input-path visual/demux.qzv --output-path export/visual/demux
qiime tools export --input-path core/demux.qza --output-path export/core/demux


###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_V4_bacteria

eval "$(conda shell.bash hook)"
conda activate qiime2-2019.10

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT_V4_bacteria/core
mkdir -p $OUTPUT_V4_bacteria/visual

qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' \
			    --input-path  $MANIFEST_BACTERIA \
			    --output-path $OUTPUT_V4_bacteria/core/demux.qza \
			    --input-format PairedEndFastqManifestPhred33V2

cd $OUTPUT_V4_bacteria

qiime demux summarize --i-data core/demux.qza --o-visualization visual/demux.qzv

# for vizualisation :
# https://view.qiime2.org

qiime tools export --input-path visual/demux.qzv --output-path export/visual/demux
qiime tools export --input-path core/demux.qza --output-path export/core/demux
