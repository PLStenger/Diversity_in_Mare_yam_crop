#!/usr/bin/env bash

# Run all scripts :

time nohup bash 00_quality_check_by_FastQC.sh &> 00_quality_check_by_FastQC.out
time nohup bash 01_replicates_pooling.sh &> 01_replicates_pooling.out
time nohup bash 02_trimmomatic_q30.sh &> 02_trimmomatic_q30.out
time nohup bash 03_cleaned_data_quality_check_by_FastQC.sh &> 03_cleaned_data_quality_check_by_FastQC.out
time nohup bash 04_qiime2_import_PE.sh &> 04_qiime2_import_PE.out
time nohup bash 05_qiime2_denoise_PE.sh &> 05_qiime2_denoise_PE.out
time nohup bash 06_qiime2_tree_PE.sh &> 06_qiime2_tree_PE.out
time nohup bash 07_qiime2_rarefaction_PE.sh &> 07_qiime2_rarefaction_PE.out
time nohup bash 08_qiime2_calculate_and_explore_diversity_metrics_PE.sh &> 08_qiime2_calculate_and_explore_diversity_metrics_PE.out
time nohup bash 09_core_biom_PE.sh &> 09_core_biom_PE.out
time nohup bash 10_qiime2_assign_taxonomy_PE.sh &> 10_qiime2_assign_taxonomy_PE.out
time nohup bash 11_ANCOM_PE.sh &> 11_ANCOM_PE.out
time nohup bash 12_GNEISS_PE.sh &> 12_GNEISS_PE.out
time nohup bash 13_funguild.sh &> 13_funguild.out
