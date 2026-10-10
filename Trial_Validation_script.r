library(dplyr)
library(stringr)
library(tidyr)
library(tidyverse)
library(data.table)
library(openxlsx)

setwd("/Users/USERNAME/Downloads/")

##### -------------------------------------------------------------------- TRIAL X

## Reading in the downloaded CTIMS CTML Trial Matches from the Results Dashboard
TRIALX <- fread("NCT123456789_result.csv")

## The unique studies that were matched
unique(TRIALX$`Study ID`) 

## Narrowing down for a specific study among the results
TRIALX_STUDY1 <- TRIALX[grepl("STUDY1",TRIALX$`Study ID`),]

## The dimensions for a specific study
dim(TRIALX_STUDY1)

## The total unique patients in the whole trial for a study
length(unique(TRIALX_STUDY1$`Patient ID`)) 

## The total unique samples in the whole trial for a study
length(unique(TRIALX_STUDY1$`Sample ID`)) 

## The number of arms a study matched on
length(unique(TRIALX_STUDY1$`Arm Code`))

## Listing which arms were matched on
unique(TRIALX_STUDY1$`Arm Code`)



#### --------------- Match results for a specific study and check each arm:

### Arm 1
## REQUIRES: For example: - and:  Head and Neck Squamous Cell Carcinoma, EGFR mutation

## Narrowing down the results for a specific study and specific arm
TRIALX_STUDY1_arm1 <- TRIALX_STUDY1[grepl("ARM_NAME",TRIALX_STUDY1$`Arm Code`),] 

## The total number of patients matched for an arm
length(unique(TRIALX_STUDY1_arm1$`Patient ID`))

## The total number of samples matched for an arm
length(unique(TRIALX_STUDY1_arm1$`Sample ID`)) 

## Listing the unique cancer types that were matched
unique(LXH254_ctgov_arm1$Diagnosis)

## Listing the unique genes that were matched on
unique(LXH254_ctgov_arm1$`Hugo Symbol`)

## Listing the unique gene and their protein change
unique(TRIALX_STUDY1_arm1$`Genomic Alteration`)

## Checking to see if for example signature criteria were what was specified
unique(TRIALX_STUDY1_arm1$`MS Status`) #  [1] "High"
unique(TRIALX_STUDY1_arm1$`HER2 Status`) # [1] "Negative"
unique(TRIALX_STUDY1_arm1$`ER Status`) # [1] "Negative"
unique(TRIALX_STUDY1_arm1$`PR Status`) # [1] "Negative"


## If the results are many cohorts within an arm, isolate to find the specific gene
TRIALX_STUDY1_arm1_EGFR <- TRIALX_STUDY1_arm1[grepl("EGFR",TRIALX_STUDY1_arm1$`Hugo Symbol`),] 
## List all the cancer types that have this gene
unique(TRIALX_STUDY1_arm1_EGFR$Diagnosis)

## Examine the specific matched values ie the specific prior treatments will be listed, the 'treatment_category', 'agent class' and the specific 'agent' aka drug
unique(TRIALX_STUDY1_arm1_EGFR$`Patient Match Values`)







