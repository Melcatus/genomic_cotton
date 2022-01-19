#!/bin/bash

# This script is to sort the aligmented genomes.
# Run this script from directory ~/bin.  The sequences they are in ~/data/raw/published/clean/next and in ~/data/raw/resequenced/clean/next
# Prerequisites: install Picard tools


####### Published genomes #####
# Convert aligment from sam to bam 
for i in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`; 
do java -jar -Xmx16000M ../picard.jar SamFormatConverter I=../data/raw/published/clean/next/${i}.sam O=../data/raw/published/clean/next/${i}.bam;
done 
## Sorted both files 
for i in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do java -jar -Xmx10000M ../picard.jar SortSam I=../data/raw/published/clean/next/${i}.bam O=../data/raw/published/clean/next/${i}sorted.bam SO=coordinate;
done

### Add group
for i in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do java -jar -Xmx10000M ../picard.jar AddOrReplaceReadGroups I=../data/raw/published/clean/next/${i}sorted.bam O=../data/raw/published/clean/next/${i}RG.bam ID=sample LB=Paired-end PL=Illumina PU=Unknown SM=sample;
done

####### Resequenced genomes #####
# Convert aligment from sam to bam 
for R in `ls ../data/raw/resequenced/trim/next | grep -oE "\w*_" | uniq`;
do java -jar -Xmx16000M ../picard.jar SamFormatConverter I=../data/raw/resequenced/trim/next/${R}.sam O=../data/raw/resequenced/trim/next/${R}.bam;
done

## Sorted both files 
for R in `ls ../data/raw/resequenced/trim/next | grep -oE "\w*_" | uniq`;
do java -jar -Xmx10000M ../picard.jar SortSam I=../data/raw/resequenced/trim/next/${R}.bam O=../data/raw/resequenced/trim/next/${R}sorted.bam SO=coordinate;
done

### Add group
for R in `ls ../data/raw/resequenced/trim/next | grep -oE "\w*_" | uniq`;
do java -jar -Xmx10000M ../picard.jar AddOrReplaceReadGroups I=../data/raw/resequenced/trim/next/${R}sorted.bam O=../data/raw/resequenced/trim/next/${R}_sorted_RG.bam ID=sample LB=Paired-end PL=Illumina PU=Unknown SM=sample;
done
