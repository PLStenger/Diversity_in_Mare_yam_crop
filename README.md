# Diversity_in_Mare_yam_crop
Diversity in Mare island (Loyalty island, New-Caledonia) yam's crop (*Dioscorea sp*.) - DNA metabarcoding on ITS2 (Fungi) and V4 (bacteria)


## Pipeline

1. FastQC on both ITS2 (Fungi) and V4 (bacteria) raw sequences for quality check
     * run 00_quality_check_by_FastQC.sh script (FastQC tool)
     * run 01_XXXX   script (ReadFastQC R package, https://github.com/PLStenger/ReadFastQC) for quick results exploration 
2. Trimming and quality cleanning sequences
3. FastQC on both ITS2 (Fungi) and V4 (bacteria) cleanned sequences for double check

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

### Run scripts in local by :

    cd /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop
    nohup bash 00_quality_check_by_FastQC.sh &> 00_quality_check_by_FastQC.out
