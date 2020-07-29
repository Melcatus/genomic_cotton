#!/bin/bash

# This script do mapping whith bwa 
# Prerequisite: intall bwa 0.7.12-r1039
# Working directory is ~/bin/
# Genome reference is ~/data/reference/
# Samples ~/data/raw/mydata/trim

# Index genome reference 
bwa index ../data/reference/TM-1_V2.1.fa

# Move clean samples to new directory 
mkdir ../data/raw/resequenced/trim/next
mv ../data/raw/resequenced/trim/*fq.gz  ../data/raw/resequenced/trim/next 

# Mapping samples against the genome reference 
for R in `ls ../data/raw/resequenced/trim/next | grep -oE "\w*_" | uniq`;
do bwa mem -t 10 -M ../data/raw/reference/TM-1_V2.1.fa ../data/raw/resequenced/trim/next/${R}1.fq.gz ../data/raw/resequenced/trim/next/${R}2.fq.gz > ../data/raw/resequenced/trim/next/${R}.sam ;
done

####### Published genomes ######
# Samples /data/raw/published/trim

# Move clean samples to new directory 
mkdir ../data/raw/published/trim/next
mv ../data/raw/published/trim/*fq.gz  ../data/raw/published/trim/next

# Mapping samples against the genome reference  
for R in `ls ../data/raw/published/trim/next | grep -oE "\w*_" | uniq`;
do bwa mem -t 10 -M ../data/raw/reference/TM-1_V2.1.fa ../data/raw/published/trim/next/${R}1.fq.gz ../data/raw/published/trim/next/${R}2.fq.gz > ../data/raw/published/trim/next/${R}.sam ;
done

