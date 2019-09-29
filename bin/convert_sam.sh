#!/bin/bash


# This script convert file .sam to .bam with samtools
# Prerequisite: install samtools 1.9
# Working directory is /bin/
# Files .sam generated from mapping is ../data/raw/mydata/clean/sams/


# Create the output directory
mkdir ../data/raw/mydata/clean/bams/

# Convert files
for i in `ls ../data/raw/mydata/clean/sams | grep -oE "\w*_" | uniq`;
do samtools view -S -b ../data/raw/mydata/clean/sams/${i}.sam > ../data/raw/mydata/clean/bams/${i}.bam ;
done

