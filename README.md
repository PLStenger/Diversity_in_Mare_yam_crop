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
    nohup Rscript 01_exploring_data_with_ReadFastQC.R &> 01_exploring_data_with_ReadFastQC.out
    nohup bash 02_trimmomatic_q30.sh &> 02_trimmomatic_q30.out
    nohup bash 03_cleaned_data_quality_check_by_FastQC.sh &> 03_cleaned_data_quality_check_by_FastQC.out
    nohup Rscript 04_exploring_cleaned_data_with_ReadFastQC.R &> 04_exploring_cleaned_data_with_ReadFastQC.out
    nohup bash 05_cutadapt_for_rebellious_seq.sh &> 05_cutadapt_for_rebellious_seq.out

