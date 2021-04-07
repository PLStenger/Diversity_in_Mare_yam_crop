#!/usr/bin/env bash

DATADIRECTORY_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/04_joined_sequences/ITS2_fungi/
DATADIRECTORY_V4_bacteria=//Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/04_joined_sequences/V4_bacteria/

OUTPUT_ITS2_fungi=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/

MANIFEST_FUNGI=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/05_QIIME2/ITS2/manifest.csv

cd $DATADIRECTORY_ITS2_fungi

conda init bash
conda activate qiime2-2019.10

qiime tools import --type 'SampleData[SequencesWithQuality]' \
			    --input-path  $MANIFEST_FUNGI \
			    --output-path $OUTPUT_ITS2_fungi \
			    --input-format SingleEndFastqManifestPhred33
