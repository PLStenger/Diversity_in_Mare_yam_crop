# Diversity_in_Mare_yam_crop
Diversity in Mare island (Loyalty island, New-Caledonia) yam's crop (*Dioscorea sp*.) - DNA metabarcoding on ITS2 (Fungi) and V4 (bacteria)

<!-- This is commented out. -->

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
        >real	3m38.017s
        >user	1m27.684s
        >sys	0m20.047s
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

## Preliminary results

### ITS2

#### Context
Internal transcribed spacer (**ITS**) is the spacer DNA situated between the small-subunit ribosomal RNA (rRNA) and large-subunit rRNA genes in the chromosome or the corresponding transcribed region in the polycistronic rRNA precursor transcript.
In bacteria and archaea, there is a single ITS, located between the 16S and 23S rRNA genes. Conversely, there are two ITSs in eukaryotes: ITS1 is located between 18S and 5.8S rRNA genes, while **ITS2** is between 5.8S and 28S (in opisthokonts, or 25S in plants) rRNA genes. ITS1 corresponds to the ITS in bacteria and archaea, while ITS2 originated as an insertion that interrupted the ancestral 23S rRNA gene.
The ITS region is the most widely sequenced DNA region in **molecular ecology of fungi** (*Peay et al 2008*) and has been recommended as the **universal fungal barcode sequence** (*Schoch et al 2012*).

#### Sequences quality results

##### Per base sequence quality plot

Only for paired sequences, after cleanning steps. Per base sequence quality plot :

<details>
  <summary>Click here to expand and see the result!</summary>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_fastqc_per_base_sequence_quality_plot_ITS2_run01.png" width="800">
  </div>

</details>

Adpaters content verification :

<details>
  <summary>Click here to expand and see the result!</summary>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_adapter_content_ITS2_run01.png" width="800">
</div>
</details>

##### Per-sample sequence counts by Qiime2 before Denoise

<details>
  <summary>Click here to expand and see the result!</summary>

| Sample ID                    | Before denoise | After denoise |
|------------------------------|----------------|---------------|
| F4_S249_joined.fastq.gzjoin  | 65331          | 50859         |
| F3_S247_joined.fastq.gzjoin  | 62521          | 50043         |
| JC5_S277_joined.fastq.gzjoin | 59947          | 47324         |
| F1_S243_joined.fastq.gzjoin  | 51272          | 41188         |
| JC2_S255_joined.fastq.gzjoin | 40401          | 32038         |
| JC4_S275_joined.fastq.gzjoin | 37641          | 30307         |
| JL1_S279_joined.fastq.gzjoin | 36987          | 30052         |
| JL4_S285_joined.fastq.gzjoin | 33234          | 28133         |
| JC1_S253_joined.fastq.gzjoin | 32209          | 25286         |
| JL3_S283_joined.fastq.gzjoin | 29839          | 24892         |
| F5_S251_joined.fastq.gzjoin  | 25768          | 21618         |
| JL2_S281_joined.fastq.gzjoin | 3999           | 3972          |
| JC3_S273_joined.fastq.gzjoin | 2292           | 1818          |
| F2_S245_joined.fastq.gzjoin  | 246            | 223           |
| JL5_S287_joined.fastq.gzjoin | 137            | 78            |


JL5 (78 counts), F2 (223 counts), JC3 (1818 counts) and JL2 (3972 counts) are may be too low..

These informations will be important for chosen the "good" rarefaction cut-off.

</details>

##### Quality after demultiplexing check

<details>
  <summary>Click here to expand and see the result!</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_demultiplex_ITS2_run01.png" width="800">
</div>

--> Almost nothing below 20 : ok !
</details>

##### Alpha rarefaction steps with rarefaction on 78

<details>
  <summary>Click here to expand and see the result!</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha-rarefaction78_shannon.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha-rarefaction78_faith_pd.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha-rarefaction78_observed_otu.png" width="800">
</div>
</details>

##### Alpha rarefaction steps with rarefaction on 1818

<details>
  <summary>Click here to expand and see the result!</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha_rarefaction_1818_shannon.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha_rarefaction_1818_faith_pd.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha_rarefaction_1818_observed_otu.png" width="800">
</div>
</details>

##### Alpha rarefaction steps with rarefaction on 3972

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha-rarefaction3972_shannon.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha-rarefaction3972_faith_pd.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha-rarefaction3972_observed_otu.png" width="800">
</div>
</details>

##### Alpha rarefaction steps with rarefaction on 21618

<details>
  <summary>Click here to expand and see the result!</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha-rarefaction21618_shannon.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha-rarefaction21618_faith_pd.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha-rarefaction21618_observed_otu.png" width="800">
</div>
</details>

##### Tree test

<details>
  <summary>Click here to expand and see the result!</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_tree_ITS2_run01.png" width="800">
</div>
</details>

##### Diversity metrix results

<details>
  <summary>Click here to expand and see the result!</summary>

###### relationships between alpha diversity and study metadata

- Faith PD group significance --> Nothing significatif
- Evenness (Pielou) group significance --> Nothing significatif
- Shannon group significance --> Nothing significatif

###### relationships between beta diversity and study metadata 

- unweighted-unifrac-body-site-significance --> Bof
- unweighted-unifrac-subject-group-significance --> Bof

###### PCoA plot to explore beta diversity metric

- unweighted unifrac data as input --> Bof
- bray curtis as input --> Slighlty better ?

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_Color_legend_Bray_ITS2_run01.png" width="100">
</div>

Bray-Curtis distance PCoA

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_bray_curtis_ITS2_run01.png" width="800">
</div>

</details>

##### BarPlot ok site/occurences 

<details>
  <summary>Click here to expand and see the result!</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_Taxonomy_site_occurences_ITS2_run01.png" width="800">
</div>
  
</details>

### Second run for ITS2 :

Delete **JL5** (137 counts), **F2** (246 counts), **JC3** (2292 counts) and **JL2** (3999 counts) (the next one is F5 with 25768 counts) 

## Bibliography/References:


- Peay K.G.; Kennedy P.G.; Bruns T.D. (2008). "Fungal community ecology: a hybrid beast with a molecular master". BioScience. 58 (9): 799–810. doi:10.1641/b580907. S2CID 18363490.
- Schoch, C.L., Seifert, K.A., Huhndorf, S., Robert, V., Spouge, J.L., Levesque, C.A., Chen, W., Bolchacova, E., Voigt, K., Crous, P.W.; et al. (2012). "Nuclear Ribosomal Internal Transcribed Spacer (ITS) Region as a Universal DNA Barcode Marker for Fungi". PNAS. 109 (16): 6241–6246. doi:10.1073/pnas.1117018109. PMC 3341068. PMID 22454494.
