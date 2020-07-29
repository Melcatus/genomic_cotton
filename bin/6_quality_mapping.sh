#!/bin/bash

# This script is for evaluate the quality mapping.
# Run this script from directory ~/bin. The sequences they are in ~/data/raw/published/clean/next and ~/data/raw/resequenced/trim/next
# Prerequisites: install samtools 1.7 and qualimap v2.2.1


########### Published genomes ############
# Index samples
for i in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do samtools index ../data/raw/published/clean/next/${i}RG.bam;
done

# Out directory by each sample 
for i in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do mkdir ../data/raw/published/clean/next/${i};
done

# Analysis of mapping 

for i in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do ../qualimap_v2.2.1/qualimap bamqc --java-mem-size=10G -bam ../data/raw/published/clean/next/${i}RG.bam -gff .../data/raw/reference/TM-1_V2.1.gene.gff -outdir ../data/raw/published/clean/next/${i} -nw 400 -hm 3;
done 


########### Resequenced genomes ############
# Index samples
for R in `ls ../data/raw/resequenced/trim/next | grep -oE "\w*_" | uniq`;
do samtools index ../data/raw/resequenced/trim/next/${R}sortedRG.bam;
done

## Outdir 
for R in `ls ../data/raw/resequenced/trim/next | grep -oE "\w*_" | uniq`;
do mkdir ../data/raw/resequenced/trim/next/${R};
done

## Qualimap
for R in `ls ../data/raw/resequenced/trim/next | grep -oE "\w*_" | uniq`;
do ../qualimap_v2.2.1/qualimap bamqc --java-mem-size=16G -bam ../data/raw/resequenced/trim/next/${R}sortedRG.bam -gff .../data/raw/reference/TM-1_V2.1.gene.gff -outdir ../data/raw/resequenced/trim/next/${R} -nw 400 -hm 3;
done 
