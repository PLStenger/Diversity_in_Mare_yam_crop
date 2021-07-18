# Diversity_in_Mare_yam_crop
Diversity in Mare island (Loyalty island, New-Caledonia) yam's crop (*Dioscorea sp*.) - DNA metabarcoding on ITS2 (Fungi) and V4 (bacteria)

<!-- This is commented out. -->

  <div align="center">
  <img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/map.png" width="800">
  </div>

## Pipeline

<details>
  <summary>Click here to see parameters details of this pipeline</summary>

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

</details>

### Installing pipeline :


<details>
  <summary>Click here to see how to install this pipeline</summary>


First, open your terminal. Then, run these two command lines :

    cd -place_in_your_local_computer
    git clone https://github.com/PLStenger/Diversity_in_Mare_yam_crop.git
    
Put your data in the '00_raw_data' folder in the corresponding folders :


:warning: You need to open a new terminal window in local, only the this uplaoding step.

- For ITS2 (Fungi) :

      scp -r path_to_your_raw_data_in_local/*.fastq.gz $CLUSTER_ADRESS://home/fungi/Diversity_in_Mare_yam_crop/00_raw_data/ITS2_fungi

- For V4 (bacteria) :

      scp -r path_to_your_raw_data_in_local/*.fastq.gz $CLUSTER_ADRESS://home/fungi/Diversity_in_Mare_yam_crop/00_raw_data/V4_bacteria
   

If necessary (only in development version), for updating the pipeline run :

    git pull
    
 or
 
    git pull https://github.com/PLStenger/Diversity_in_Mare_yam_crop.git
    
### If necessary, install softwares by :   

Download Anaconda or, better, Miniconda3 (Python 3.9) here : https://www.anaconda.com/products/individual choose the one according to your OS (Windows, MacOS, Linux); here I choose the 'Anaconda3-2021.05-Linux-x86_64.sh'/'Miniconda3-py39_4.9.2-Linux-x86_64.sh'.

Send your file in the '99_softwares/' directory with :

:warning: You need to open a new terminal window in local, only the this uplaoding step.

    scp -r path_to_downloaded_data_in_local/Anaconda-latest-Linux-x86_64.sh $CLUSTER_ADRESS://home/fungi/Diversity_in_Mare_yam_crop/99_softwares/

Then go in the '99_softwares/' directory

    cd 99_softwares/
   
Run :

    bash Anaconda-latest-Linux-x86_64.sh

Then, download all the necessary softwaures by :

1) fastqc V-0.11.8

       bash
       conda create -n fastqc
       conda activate fastqc
       conda install -c bioconda/label/cf201901 fastqc
       conda deactivate
    
2) trimmomatic V-0.38
    
       bash
       conda create -n trimmomatic
       conda activate trimmomatic
       conda install -c bioconda/label/cf201901 trimmomatic 
       conda deactivate
       
3) multiqc V-0.9.1a0
    
       bash
       conda create -n multiqc
       conda activate multiqc
       conda install -c bioconda/label/cf201901 multiqc  
       conda deactivate
              
4) QIIME2
        
	Follow instructions here https://docs.qiime2.org/2021.4/install/native/

	   # If you did'nt have yet 'wget' run : conda install wget
	   wget https://data.qiime2.org/distro/core/qiime2-2021.4-py38-linux-conda.yml
	   conda env create -n qiime2-2021.4 --file qiime2-2021.4-py38-linux-conda.yml
	
	To activate/deactivate this environment, use :

	   conda activate qiime2-2021.4
	   conda deactivate
	
 
### Know the number of CPU (threads) of your computer (here for MacOs) :

    sysctl hw.ncpu
    > hw.ncpu: 4
    
</details>    

## Run scripts in local :

    # Put you in your working directory (as an example, for me it's :)
    cd /Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop
    
> :warning: **Explanation of Real, User and Sys process time statistics below**

<details>
  <summary>Click here to understand what are Real, User and Sys process time statistics</summary>
  
These appears after you run the command line 'time', and it's corresponding for a 8 Go 1600 MHz DDR3 boot on MacOSX 10.14.6, 2.5 GHz Intel Core i5, SSD  
 
### Real, User and Sys process time statistics :

One of these things is not like the other. Real refers to actual elapsed time; User and Sys refer to CPU time used only by the process.

- **Real** is wall clock time - time from start to finish of the call. This is all elapsed time including time slices used by other processes and time the process spends blocked (for example if it is waiting for I/O to complete).
- **User** is the amount of CPU time spent in user-mode code (outside the kernel) within the process. This is only actual CPU time used in executing the process. Other processes and time the process spends blocked do not count towards this figure.
- **Sys** is the amount of CPU time spent in the kernel within the process. This means executing CPU time spent in system calls within the kernel, as opposed to library code, which is still running in user-space. Like 'user', this is only CPU time used by the process. See below for a brief description of kernel mode (also known as 'supervisor' mode) and the system call mechanism.

</details>     
    
### Run this pipeline in Single-End version for Paired-End data (like in Fernandez et al 2021 - in prep)

<details>
  <summary>Click here to see the running command lines</summary>

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
    

</details>  

### Run the new Paired-end pipeline :

<details>
  <summary>Click here to see the running command lines</summary>
  
  For running all the pipeline with only one script; run :
  
    time nohup bash 000_run_all_pipeline_in_one_script.sh &> 000_run_all_pipeline_in_one_script.out
        >real	562m35.947s
        >user	800m3.151s
        >sys	35m17.207s

  For running all the pipeline with step by step; run one by one :

	time nohup bash 00_quality_check_by_FastQC.sh &> 00_quality_check_by_FastQC.out
			Local			Cluster
			>real	15m0.938s	real	10m2,587s
			>user	23m24.964s	user	13m7,749s
			>sys	1m30.933s	sys	0m48,080s
	
	time nohup bash 01_replicates_pooling.sh &> 01_replicates_pooling.out
			Local			Cluster
			>real	0m12.089s	real	0m1,644s
			>user	0m0.284s	user	0m0,079s
			>sys	0m6.321s	sys	0m1,558s
	
	time nohup bash 02_trimmomatic_q30.sh &> 02_trimmomatic_q30.out
			Local			Cluster
			>real	46m36.541s	real	13m13,605s
			>user	115m46.126s	user	102m24,028s
			>sys	4m42.181s	sys	2m12,431s
	
	time nohup bash 03_cleaned_data_quality_check_by_FastQC.sh &> 03_cleaned_data_quality_check_by_FastQC.out
			Local			Cluster
			>real	15m13.915s	real	8m24,390s
			>user	22m30.925s	user	11m35,023s
			>sys	1m29.838s	sys	0m33,590s
	
	time nohup bash 04_qiime2_import_PE.sh &> 04_qiime2_import_PE.out
			Local			Cluster
			>real	4m16.097s	real	1m30,595s
			>user	1m54.078s	user	1m28,997s
			>sys	0m22.440s	sys	0m14,064s
	
	time nohup bash 05_qiime2_denoise_PE.sh &> 05_qiime2_denoise_PE.out
			Local			Cluster
			>real	258m37.391s	real	119m10,621s
			>user	490m55.497s	user	415m59,135s
			>sys	16m22.382s	sys	8m37,648s
	
	time nohup bash 06_qiime2_tree_PE.sh &> 06_qiime2_tree_PE.out
			Local			Cluster
			>real	8m17.027s	real	4m32,597s
			>user	5m55.095s	user	4m34,506s
			>sys	0m31.508s	sys	0m25,527s
	
	time nohup bash 07_qiime2_rarefaction_PE.sh &> 07_qiime2_rarefaction_PE.out
			Local			Cluster
			>real	1m45.833s	real    1m39,117s
			>user	0m57.637s	user    4m26,996s
			>sys	0m14.762s	sys     0m23,216s
	
	time nohup bash 08_qiime2_calculate_and_explore_diversity_metrics_PE.sh &> 08_qiime2_calculate_and_explore_diversity_metrics_PE.out
			Local			Cluster
			>real	35m11.058s	real    8m35,653s
			>user	11m18.333s	user    10m4,448s
			>sys	2m25.772s	sys     3m27,243s
	
	time nohup bash 09_core_biom_PE.sh &> 09_core_biom_PE.out
			Local			Cluster
			>real	18m26.579s	real    2m25,279s
			>user	3m37.654s	user    2m53,403s
			>sys	0m49.689s	sys     0m59,030s
	
	time nohup bash 10_qiime2_assign_taxonomy_PE.sh &> 10_qiime2_assign_taxonomy_PE.out
			Local			Cluster
			>real	147m0.351s	?
			>user	113m39.952s	?
			>sys	6m5.422s	?
	
	time nohup bash 11_ANCOM_PE.sh &> 11_ANCOM_PE.out
			>real	1m10.172s
			>user	0m31.238s
			>sys	0m10.918s
	
	time nohup bash 12_GNEISS_PE.sh &> 12_GNEISS_PE.out
			>real	24m32.454s
			>user	13m24.024s
			>sys	0m38.742s
	
	time nohup bash 13_funguild.sh &> 13_funguild.out
			>real	0m15.448s
			>user	0m7.851s
			>sys	0m3.511s


	Only for developping
	time nohup bash zz_junk.sh &> zz_junk.out


</details> 





### For running MultiQC (work now only in Python3) :

    /Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9 -m pip install --upgrade pip' 
    python3.9 -m pip install multiqc
    python3 -m multiqc .













# Preliminary results











## ITS2

<details>
  <summary>Click here to see ITS2 results</summary>

### Context

<details>
  <summary>Click here to see the context</summary>
  
Internal transcribed spacer (**ITS**) is the spacer DNA situated between the small-subunit ribosomal RNA (rRNA) and large-subunit rRNA genes in the chromosome or the corresponding transcribed region in the polycistronic rRNA precursor transcript.
In bacteria and archaea, there is a single ITS, located between the 16S and 23S rRNA genes. Conversely, there are two ITSs in eukaryotes: ITS1 is located between 18S and 5.8S rRNA genes, while **ITS2** is between 5.8S and 28S (in opisthokonts, or 25S in plants) rRNA genes. ITS1 corresponds to the ITS in bacteria and archaea, while ITS2 originated as an insertion that interrupted the ancestral 23S rRNA gene.
The ITS region is the most widely sequenced DNA region in **molecular ecology of fungi** (*Peay et al 2008*) and has been recommended as the **universal fungal barcode sequence** (*Schoch et al 2012*).

</details>





### Sequences quality results

<details>
  <summary>Click here to see the sequences quality results</summary>

#### Per base sequence quality plot

<details>
  <summary>Click here for per base sequence quality plot (Only for paired sequences, after cleanning steps)</summary>
  
  <div align="center">
  <img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_fastqc_per_base_sequence_quality_plot_ITS2_run01.png" width="800">
  </div>

</details>

<details>
  <summary>Click here for adpaters content verification</summary>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_adapter_content_ITS2_run01.png" width="800">
</div>
</details>


</details>

### Per-sample sequence counts by Qiime2 before Denoise for i) Single-End (SE) pipeline and ii) Paired-End (PE) pipeline

| Sample ID  | Before denoise SE | After denoise SE | Before denoise PE | After denoise PE |
|------------|-------------------|------------------|-------------------|------------------|
| F4         | 65331             | 50859            | 66823             | 57509            |
| F3         | 62521             | 50043            | 63670             | 52848            |
| SF5        | 59947             | 47324            | 61513             | 49934            |
| F1         | 51272             | 41188            | 52434             | 44710            |
| SF2        | 40401             | 32038            | 41328             | 33952            |
| LF1        | 37641             | 30307            | 39437             | 32531            |
| SF4        | 36987             | 30052            | 37588             | 31440            |
| LF4        | 33234             | 28133            | 33867             | 29881            |
| SF1        | 32209             | 25286            | 33598             | 29108            |
| LF3        | 29839             | 24892            | 30642             | 26694            |
| F5         | 25768             | 21618            | 26530             | 22941            |
| LF2        | 3999              | 3972             | 4033              | 4011             |
| SF3        | 2292              | 1818             | 2338              | 1959             |
| F2         | 246               | 223              | 258               | 220              |
| LF5        | 137               | 78               | 138               | 72               |

Legend : F = Forest, SF = Short Fallow, LF = Long Fallow, SE = pipeline as Single-End (pipeline from https://gitlab.com/IAC_SolVeg/CNRT_BIOINDIC), PE = pipeline as Paired-End.


Here, **before denoise**, **PE** allow to obtain **in average 824.9 sequences** (1796 sequences in max for LF1) **more than SE pipeline** (an average of **2.45% in more**, 4.65% in max for LF2).
**After denoise**, **PE** allow to obtain **in average 1998.6 sequences** (6650 sequences in max for F4) **more than SE pipeline** (an average of **5.12% in more**, 13.13% in max for SF1).

<details>
  <summary>Click here for seeing Single-End pipeline results</summary>

<details>
  <summary>Click here to expand</summary>

For SE: JL5 (78 counts), F2 (223 counts), JC3 (1818 counts) and JL2 (3972 counts) are may be too low..

These informations will be important for chosen the "good" rarefaction cut-off.

</details>

<details>
  <summary>Click here for quality after demultiplexing check</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_demultiplex_ITS2_run01.png" width="800">
</div>

--> Almost nothing below 20 : ok !
</details>

### Alpha rarefaction steps with rarefaction on 78

<details>
  <summary>Click here for alpha-diversity index</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha-rarefaction78_shannon.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha-rarefaction78_faith_pd.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha-rarefaction78_observed_otu.png" width="800">
</div>
</details>

<details>
  <summary>Click here for tree test</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_tree_ITS2_run01.png" width="800">
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
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_Color_legend_Bray_ITS2_run01.png" width="100">
</div>

Bray-Curtis distance PCoA

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_bray_curtis_ITS2_run01.png" width="800">
</div>

</details>

<details>
  <summary>Click here for BarPlot site/occurences </summary>

#### BarPlot ok site/occurences 

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_Taxonomy_site_occurences_ITS2_run01.png" width="800">
</div>
  
</details>

### Alpha rarefaction steps with rarefaction on 1818

<details>
  <summary>Click here for alpha-diversity index</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha_rarefaction_1818_shannon.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha_rarefaction_1818_faith_pd.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha_rarefaction_1818_observed_otu.png" width="800">
</div>
</details>

### Alpha rarefaction steps with rarefaction on 3972

<details>
  <summary>Click here for alpha-diversity index</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha-rarefaction3972_shannon.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha-rarefaction3972_faith_pd.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha-rarefaction3972_observed_otu.png" width="800">
</div>
</details>

### Alpha rarefaction steps with rarefaction on 21618

<details>
  <summary>Click here for alpha-diversity index</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha-rarefaction21618_shannon.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha-rarefaction21618_faith_pd.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha-rarefaction21618_observed_otu.png" width="800">
</div>
</details>

### Alpha rarefaction steps with rarefaction on 50859 (maximum)

<details>
  <summary>Click here for alpha-diversity index</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha-rarefaction50859_shannon.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha-rarefaction50859_faith_pd.png" width="800">
</div>
<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_ITS2-alpha-rarefaction50859_observed_otu.png" width="800">
</div>
</details>

--> So we're go in 21618

## Second run for ITS2 :

Delete **JL5** (137 counts), **F2** (246 counts), **JC3** (2292 counts) and **JL2** (3999 counts) (the next one is F5 with 25768 counts) 

# Bibliography/References:


- Peay K.G.; Kennedy P.G.; Bruns T.D. (2008). "Fungal community ecology: a hybrid beast with a molecular master". BioScience. 58 (9): 799–810. doi:10.1641/b580907. S2CID 18363490.
- Schoch, C.L., Seifert, K.A., Huhndorf, S., Robert, V., Spouge, J.L., Levesque, C.A., Chen, W., Bolchacova, E., Voigt, K., Crous, P.W.; et al. (2012). "Nuclear Ribosomal Internal Transcribed Spacer (ITS) Region as a Universal DNA Barcode Marker for Fungi". PNAS. 109 (16): 6241–6246. doi:10.1073/pnas.1117018109. PMC 3341068. PMID 22454494.

</details>







<details>
  <summary>Click here for seeing Paired-End pipeline results</summary>

<details>
  <summary>Click here to expand</summary>

For PE: JL5 (72 counts), F2 (220 counts), JC3 (1959 counts) and JL2 (4011 counts) are may be too low..
--> Same than SE

These informations will be important for chosen the "good" rarefaction cut-off.

</details>

<details>
  <summary>Click here for quality after demultiplexing check</summary>

Need to be done !

</details>

### Alpha rarefaction steps with rarefaction on 22941

<details>
  <summary>Click here for alpha-diversity index</summary>

</details>

<details>
  <summary>Click here for tree test</summary>

<div align="center">
<img src="https://github.com/PLStenger/Diversity_in_Mare_yam_crop/blob/main/99_images/zz_tree_ITS2_run01_PE.png" width="800">
</div>
</details>

<details>
  <summary>Click here for diversity metrix results</summary>

##### relationships between alpha diversity and study metadata

- Faith PD group significance --> Need to be done
- Evenness (Pielou) group significance --> Need to be done
- Shannon group significance --> Need to be done

##### relationships between beta diversity and study metadata 

- unweighted-unifrac-body-site-significance --> Need to be done
- unweighted-unifrac-subject-group-significance --> Need to be done

##### PCoA plot to explore beta diversity metric

- unweighted unifrac data as input --> Need to be done
- bray curtis as input --> Need to be done


Bray-Curtis distance PCoA

Need to be done

</details>

<details>
  <summary>Click here for BarPlot site/occurences </summary>

#### BarPlot ok site/occurences 

Need to be done
  
</details>


# Bibliography/References:


- Peay K.G.; Kennedy P.G.; Bruns T.D. (2008). "Fungal community ecology: a hybrid beast with a molecular master". BioScience. 58 (9): 799–810. doi:10.1641/b580907. S2CID 18363490.
- Schoch, C.L., Seifert, K.A., Huhndorf, S., Robert, V., Spouge, J.L., Levesque, C.A., Chen, W., Bolchacova, E., Voigt, K., Crous, P.W.; et al. (2012). "Nuclear Ribosomal Internal Transcribed Spacer (ITS) Region as a Universal DNA Barcode Marker for Fungi". PNAS. 109 (16): 6241–6246. doi:10.1073/pnas.1117018109. PMC 3341068. PMID 22454494.

</details>

</details> 

















## V4

<details>
  <summary>Click here to see V4 results</summary>


### Context

### Sequences quality results

#### Per base sequence quality plot

#### Per-sample sequence counts by Qiime2 before Denoise

| Sample ID  | Before denoise SE | After denoise SE | After denoise PE | After denoise PE |
|------------|-------------------|------------------|------------------|------------------|
| SF4        |  108358           |  83183           | 108406           | 88093            |
| LF5        |  103261           |  74653           | 103313           | 81840            |
| SF5        |  101516           |  71800           | 101555           | 80974            |
| SF2        |  88896            |  71746           | 88930            | 72735            |
| F4         |  88488            |  68766           | 88533            | 71148            |
| SF3        |  72746            |  56477           | 72773            | 59059            |
| SF1        |  69635            |  56065           | 69662            | 55726            |
| LF1        |  69614            |  53340           | 69644            | 54339            |
| LF3        |  66873            |  51933           | 66899            | 54271            |
| F1         |  64152            |  50617           | 64183            | 52510            |
| F3         |  63601            |  48066           | 63630            | 50073            |
| LF4        |  52577            |  41690           | 52598            | 41865            |
| F5         |  39553            |  31247           | 39571            | 29891            |
| LF2        |  32960            |  29544           | 32982            | 25721            |
| F2         |  8925             |  5797            | 8927             | 7332             |

Legend : F = Forest, SF = Short Fallow, LF = Long Fallow, SE = pipeline as Single-End (pipeline from https://gitlab.com/IAC_SolVeg/CNRT_BIOINDIC), PE = pipeline as Paired-End.


Here, before denoise, **PE** allow to obtain **in average 30.07 sequences** (52 sequences in max for LF5) **more than SE pipeline** (an average of **0.04% in more**, 0.07% in max for LF2).
**After denoise**, **PE** allow to obtain **in average 2043.53 sequences** (9174 sequences in max for SF5) **more than SE pipeline** (an average of **3.33% in more**, 20.94% in max for F2).


</details> 
