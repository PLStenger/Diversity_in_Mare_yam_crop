#install.packages("devtools")
#library(devtools)
#install_github("PLStenger/ReadFastQC")
library(ReadFastQC) # https://github.com/PLStenger/ReadFastQC

# For OUT_PUT_ITS2_fungi :
setwd("~/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/01_quality_check/OUT_PUT_ITS2_fungi")

# Run this to catch all information for all FastQC files and print it in a file ("FastQCanalysis.csv"):
New_FastQCresultsForAll()
# Run this to obtain all adapters content of all FastQC in one pdf file ("Adapters content.pdf"):
adapter()
# Run this to obtain all the per base quality of all FastQC in one pdf file ("Per base quality.pdf")
bquality()

# For OUT_PUT_V4_bacteria :
setwd("~/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/05_Mare_ignames/Diversity_in_Mare_yam_crop/01_quality_check/OUT_PUT_V4_bacteria")

# Run this to catch all information for all FastQC files and print it in a file ("FastQCanalysis.csv"):
New_FastQCresultsForAll()
# Run this to obtain all adapters content of all FastQC in one pdf file ("Adapters content.pdf"):
adapter()
# Run this to obtain all the per base quality of all FastQC in one pdf file ("Per base quality.pdf")
bquality()
