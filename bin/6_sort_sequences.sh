#!/bin/bash

# This script order reads after mapping
# Prerequisite: install samtools 1.9
# Working directory is /bin/
# Files .sam generated from mapping is ../data/raw/mydata/clean/bams/

# Create output directory 
mkdir ../data/raw/mydata/clean/sorted

# Sort mapped sequences 
for i in `ls ../data/raw/mydata/clean/bams | grep -oE "\w*_" | uniq`;
do samtools sort ../data/raw/mydata/clean/bams/${i}.bam -o ../data/raw/mydata/clean/sorted/${i}sorted.bam
done

# Index sequences
for i in `ls ../data/raw/mydata/clean/sorted | grep -oE "\w*_" | uniq`;
do samtools index ../data/raw/mydata/clean/sorted/${i}sorted.bam
done


# number of alignments
for i in `ls ../data/raw/mydata/clean/sorted | grep -oE "\w*_" | uniq`;
do samtools view ../data/raw/mydata/clean/sorted/${i}sorted.bam | wc -l >> alignments.txt
done

