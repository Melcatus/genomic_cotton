#!/bin/bash

# This script is to identified genomic variants .
# Run this script from directory ~/bin. The sequences they are in ~/data/raw/published/clean/next and ~/data/raw/new_genomes/trim/next
# Prerequisites: install NGSEPcore 3.3.0 


## fai index 
samtools faidx  ../data/raw/reference/TM-1_V2.1.fa

########### Published genomes ############
# find variants 
for i in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do java -jar -Xms10000M -Xmx16000M ../NGSEPcore_3.3.0.jar FindVariants -runRep -runRD -runRP -maxAlnsPerStartPos 100 -csb -ploidy 4 -psp -algCNV CNVnator,EWT ../data/raw/reference/TM-1_V2.1.fa ../data/raw/published/clean/next/${i}RG.bam ../data/raw/published/clean/next/${i}RG1 >& ../data/raw/published/clean/next/${i}RG.log ;
done 

## Merge variants
for i in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar MergeVariants  ../data/raw/reference/TM-1_V2.1.fa.fai  ../data/raw/published/clean/next/${i}RG2  ../data/raw/published/clean/next/${i}RG1.vcf  >& ../data/raw/published/clean/next/${i}RG_merg.log; 
done

### Find variants
for i in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar FindVariants -csb -ploidy 4 -psp -knownVariants ../data/raw/published/clean/next/${i}RG2 -knownSVs ../data/raw/published/clean/next/${i}RG1SV.gff  -maxBaseQS 30 -maxAlnsPerStartPos 100 -sampleId A05 ../data/raw/reference/TM-1_V2.1.fa ../data/raw/published/clean/next/${i}RG.bam ../data/raw/published/clean/next/${i}RG3 >& ../data/raw/published/clean/next/${i}3.log;
done 

########### resequenced genomes ############
# Find variants
for R in `ls ../data/raw/new_genomes/trim/next | grep -oE "\w*_" | uniq`;
do java -jar -Xms16000M -Xmx16000M ../NGSEPcore_3.3.0.jar FindVariants -runRep -runRD -runRP -maxAlnsPerStartPos 100 -csb -ploidy 4 -psp -algCNV CNVnator,EWT ../data/raw/reference/TM-1_V2.1.fa ../data/raw/new_genomes/trim/next/${R}sortedRG.bam ../data/raw/new_genomes/trim/next/${R}1 >& ../data/raw/new_genomes/trim/next/${R}.log;
done

## Merge variants
for R in `ls ../data/raw/new_genomes/trim/next | grep -oE "\w*_" | uniq`;
do java -jar -Xms16000M -Xmx16000M ../NGSEPcore_3.3.0.jar MergeVariants  ../data/raw/reference/TM-1_V2.1.fa.fai  ../data/raw/new_genomes/trim/next/${R}2  ../data/raw/new_genomes/trim/next/${R}1.vcf  >& ../data/raw/new_genomes/trim/next/${R}merg.log; 
done

### Find variants
for R in `ls ../data/raw/new_genomes/trim/next | grep -oE "\w*_" | uniq`;
do java -jar -Xms16000M -Xmx16000M ../NGSEPcore_3.3.0.jar FindVariants -csb -ploidy 4 -psp -knownVariants ../data/raw/new_genomes/trim/next/${R}2 -knownSVs ../data/raw/new_genomes/trim/next/${R}1SV.gff  -maxBaseQS 30 -maxAlnsPerStartPos 100 -sampleId ${R} ../data/raw/reference/TM-1_V2.1.fa ../data/raw/new_genomes/trim/next/${R}sortedRG.bam ../data/raw/new_genomes/trim/next/${R}3 >& ../data/raw/new_genomes/trim/next/${R}var3.log;
done

