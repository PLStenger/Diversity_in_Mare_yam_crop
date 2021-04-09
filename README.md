# Diversity_in_Mare_yam_crop
Diversity in Mare island (Loyalty island, New-Caledonia) yam's crop (*Dioscorea sp*.) - DNA metabarcoding on ITS2 (Fungi) and V4 (bacteria)


## Pipeline

1. FastQC on both ITS2 (Fungi) and V4 (bacteria) raw sequences for quality check
     * run **00_quality_check_by_FastQC.sh** script (FastQC tool)
     * run **01_exploring_data_with_ReadFastQC.R** script (ReadFastQC R package, https://github.com/PLStenger/ReadFastQC) for quick results exploration 
     * run multiqc . 
2. Trimming and quality cleanning sequences with the script **02_trimmomatic_q30.sh**
     * ILLUMINACLIP:"$ADAPTERFILE":2:30:10
     * LEADING:30
     * TRAILING:30
     * SLIDINGWINDOW:26:30
     * MINLEN:150
3. FastQC on both ITS2 (Fungi) and V4 (bacteria) cleanned sequences for double check
     * run **03_cleaned_data_quality_check_by_FastQC.sh** script (FastQC tool)
     * run **04_exploring_cleaned_data_with_ReadFastQC.R** script (ReadFastQC R package, https://github.com/PLStenger/ReadFastQC) for quick results exploration 
     * run multiqc .

## Run this pipeline

### Installing pipeline :

First, open your terminal. Then, run these two command lines :

    cd -place_in_your_local_computer
    git clone https://github.com/PLStenger/Diversity_in_Mare_yam_crop.git

### Update the pipeline in local by :

    git pull
    
### If necessary, install softwares by :   

    cd 99_softwares/
    conda install -c bioconda fastqc
    conda install -c bioconda trimmomatic
    conda install -c bioconda multiqc

### Run scripts in local by :

    cd /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop
    
    bash
    nohup bash 00_quality_check_by_FastQC.sh &> 00_quality_check_by_FastQC.out
    nohup Rscript 01_01_exploring_data_with_ReadFastQC.R &> 01_01_exploring_data_with_ReadFastQC.out
    nohup bash 01_02_replicates_pooling.sh &> 01_02_replicates_pooling.out
    nohup bash 02_trimmomatic_q30.sh &> 02_trimmomatic_q30.out
    nohup bash 03_cleaned_data_quality_check_by_FastQC.sh &> 03_cleaned_data_quality_check_by_FastQC.out
    nohup Rscript 04_exploring_cleaned_data_with_ReadFastQC.R &> 04_exploring_cleaned_data_with_ReadFastQC.out
    nohup bash 05_cutadapt_for_rebellious_seq.sh &> 05_cutadapt_for_rebellious_seq.out
    nohup bash 06_FastQC_on_rebellious.sh &> 06_FastQC_on_rebellious.out
    nohup bash 07_fastq-join.sh &> 07_fastq-join.out
    time nohup bash 08_qiime2_import.sh &> 08_qiime2_import.out
        >real	18m50.406s
        >user	12m41.991s
        >sys	0m30.152s
    time nohup bash 09_qiime2_denoise.sh &> 09_qiime2_denoise.out
        >real	94m10.219s # Only for V4
        >user	246m37.209s # Only for V4
        >sys	5m52.654s # Only for V4
    time nohup bash 10_qiime2_tree.sh &> 10_qiime2_tree.out
        >real	35m4.471s
        >user	21m19.925s
        >sys	0m44.076s
    time nohup bash 11_qiime2_rarefaction.sh &> 11_qiime2_rarefaction.out
        >real	5m00.489s
        >user	1m23.374s
        >sys	1m6.505s
    time nohup bash 12_qiime2_calculate_and_explore_diversity_metrics.sh &> 12_qiime2_calculate_and_explore_diversity_metrics.out
        >real	17m47.147s
        >user	2m25.299s
        >sys	0m46.509s
    time nohup bash 13_qiime2_assign_taxonomy.sh &> 13_qiime2_assign_taxonomy.out
        >real	75m29.388s
        >user	50m12.821s
        >sys	3m7.610s

### For running MultiQC (work now only in Python3) :

    /Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9 -m pip install --upgrade pip' 
    python3.9 -m pip install multiqc
    python3 -m multiqc .

### First run results

#### ITS2


<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_Taxonomy_site_occurences_ITS2_run01.png" width="500">
</div>
  


### Second run for ITS2 :

Delete **JL5** (137 counts), **F2** (246 counts), **JC3** (2292 counts) and **JL2** (3999 counts) (the next one is F5 with 25768 counts) 
