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
        real	126m54.675s
        user	293m11.617s
        sys	9m0.347s
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
    time nohup bash 14_qiime2_metrics.sh &> 14_qiime2_metrics.out

### Run Paired-end pipeline scripts in local by :

    time nohup bash 08_qiime2_import_PE.sh &> 08_qiime2_import_PE.out


### For running MultiQC (work now only in Python3) :

    /Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9 -m pip install --upgrade pip' 
    python3.9 -m pip install multiqc
    python3 -m multiqc .

# Preliminary results

## ITS2

### Context
Internal transcribed spacer (**ITS**) is the spacer DNA situated between the small-subunit ribosomal RNA (rRNA) and large-subunit rRNA genes in the chromosome or the corresponding transcribed region in the polycistronic rRNA precursor transcript.
In bacteria and archaea, there is a single ITS, located between the 16S and 23S rRNA genes. Conversely, there are two ITSs in eukaryotes: ITS1 is located between 18S and 5.8S rRNA genes, while **ITS2** is between 5.8S and 28S (in opisthokonts, or 25S in plants) rRNA genes. ITS1 corresponds to the ITS in bacteria and archaea, while ITS2 originated as an insertion that interrupted the ancestral 23S rRNA gene.
The ITS region is the most widely sequenced DNA region in **molecular ecology of fungi** (*Peay et al 2008*) and has been recommended as the **universal fungal barcode sequence** (*Schoch et al 2012*).

### Sequences quality results

#### Per base sequence quality plot

<details>
  <summary>Click here for per base sequence quality plot (Only for paired sequences, after cleanning steps)</summary>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_fastqc_per_base_sequence_quality_plot_ITS2_run01.png" width="800">
  </div>

</details>

<details>
  <summary>Click here for adpaters content verification</summary>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_adapter_content_ITS2_run01.png" width="800">
</div>
</details>

#### Per-sample sequence counts by Qiime2 before Denoise

| Sample ID  | Before denoise SE | After denoise SE | After denoise PE | After denoise PE |
|------------|-------------------|------------------|------------------|------------------|
| F4         | 65331             | 50859            | 66823            | XXXXXXX          |
| F3         | 62521             | 50043            | 63670            | XXXXXXX          |
| SF5        | 59947             | 47324            | 61513            | XXXXXXX          |
| F1         | 51272             | 41188            | 52434            | XXXXXXX          |
| SF2        | 40401             | 32038            | 41328            | XXXXXXX          |
| LF1        | 37641             | 30307            | 39437            | XXXXXXX          |
| SF4        | 36987             | 30052            | 37588            | XXXXXXX          |
| LF4        | 33234             | 28133            | 33867            | XXXXXXX          |
| SF1        | 32209             | 25286            | 33598            | XXXXXXX          |
| LF3        | 29839             | 24892            | 30642            | XXXXXXX          |
| F5         | 25768             | 21618            | 26530            | XXXXXXX          |
| LF2        | 3999              | 3972             | 4033             | XXXXXXX          |
| SF3        | 2292              | 1818             | 2338             | XXXXXXX          |
| F2         | 246               | 223              | 258              | XXXXXXX          |
| LF5        | 137               | 78               | 138              | XXXXXXX          |

Legend : F = Forest, SF = Short Fallow, LF = Long Fallow, SE = pipeline as Single-End (pipeline from https://gitlab.com/IAC_SolVeg/CNRT_BIOINDIC), PE = pipeline as Paired-End.

<details>
  <summary>Click here to expand</summary>

JL5 (78 counts), F2 (223 counts), JC3 (1818 counts) and JL2 (3972 counts) are may be too low..

These informations will be important for chosen the "good" rarefaction cut-off.

</details>

<details>
  <summary>Click here for quality after demultiplexing check</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_demultiplex_ITS2_run01.png" width="800">
</div>

--> Almost nothing below 20 : ok !
</details>

### Alpha rarefaction steps with rarefaction on 78

<details>
  <summary>Click here for alpha-diversity index</summary>

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

<details>
  <summary>Click here for tree test</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_tree_ITS2_run01.png" width="800">
</div>
</details>

<details>
  <summary>Click here for diversity metrix results</summary>

##### relationships between alpha diversity and study metadata

- Faith PD group significance --> Nothing significatif
- Evenness (Pielou) group significance --> Nothing significatif
- Shannon group significance --> Nothing significatif

##### relationships between beta diversity and study metadata 

- unweighted-unifrac-body-site-significance --> Bof
- unweighted-unifrac-subject-group-significance --> Bof

##### PCoA plot to explore beta diversity metric

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

<details>
  <summary>Click here for BarPlot site/occurences </summary>

#### BarPlot ok site/occurences 

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_Taxonomy_site_occurences_ITS2_run01.png" width="800">
</div>
  
</details>

### Alpha rarefaction steps with rarefaction on 1818

<details>
  <summary>Click here for alpha-diversity index</summary>

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

### Alpha rarefaction steps with rarefaction on 3972

<details>
  <summary>Click here for alpha-diversity index</summary>

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

### Alpha rarefaction steps with rarefaction on 21618

<details>
  <summary>Click here for alpha-diversity index</summary>

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

### Alpha rarefaction steps with rarefaction on 50859 (maximum)

<details>
  <summary>Click here for alpha-diversity index</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha-rarefaction50859_shannon.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha-rarefaction50859_faith_pd.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/zz_ITS2-alpha-rarefaction50859_observed_otu.png" width="800">
</div>
</details>

--> So we're go in 21618

## Second run for ITS2 :

Delete **JL5** (137 counts), **F2** (246 counts), **JC3** (2292 counts) and **JL2** (3999 counts) (the next one is F5 with 25768 counts) 

# Bibliography/References:


- Peay K.G.; Kennedy P.G.; Bruns T.D. (2008). "Fungal community ecology: a hybrid beast with a molecular master". BioScience. 58 (9): 799–810. doi:10.1641/b580907. S2CID 18363490.
- Schoch, C.L., Seifert, K.A., Huhndorf, S., Robert, V., Spouge, J.L., Levesque, C.A., Chen, W., Bolchacova, E., Voigt, K., Crous, P.W.; et al. (2012). "Nuclear Ribosomal Internal Transcribed Spacer (ITS) Region as a Universal DNA Barcode Marker for Fungi". PNAS. 109 (16): 6241–6246. doi:10.1073/pnas.1117018109. PMC 3341068. PMID 22454494.



## V4

### Context

### Sequences quality results

#### Per base sequence quality plot

#### Per-sample sequence counts by Qiime2 before Denoise

| Sample ID  | Before denoise SE | After denoise SE | After denoise PE | After denoise PE |
|------------|-------------------|------------------|------------------|------------------|
| SF4        |  108358           |  83183           | 108406           | XXXXXXX          |
| LF5        |  103261           |  74653           | 103313           | XXXXXXX          |
| SF5        |  101516           |  71800           | 101555           | XXXXXXX          |
| SF2        |  88896            |  71746           | 88930            | XXXXXXX          |
| F4         |  88488            |  68766           | 88533            | XXXXXXX          |
| SF3        |  72746            |  56477           | 72773            | XXXXXXX          |
| SF1        |  69635            |  56065           | 69662            | XXXXXXX          |
| LF1        |  69614            |  53340           | 69644            | XXXXXXX          |
| LF3        |  66873            |  51933           | 66899            | XXXXXXX          |
| F1         |  64152            |  50617           | 64183            | XXXXXXX          |
| F3         |  63601            |  48066           | 63630            | XXXXXXX          |
| LF4        |  52577            |  41690           | 52598            | XXXXXXX          |
| F5         |  39553            |  31247           | 39571            | XXXXXXX          |
| LF2        |  32960            |  29544           | 32982            | XXXXXXX          |
| F2         |  8925             |  5797            | 8927             | XXXXXXX          |

Legend : F = Forest, SF = Short Fallow, LF = Long Fallow, SE = pipeline as Single-End (pipeline from https://gitlab.com/IAC_SolVeg/CNRT_BIOINDIC), PE = pipeline as Paired-End.
