#!/bin/bash

#SBATCH -p keri
#SBATCH -n 8
#SBATCH --mem=10500

# This script is for data cleaning using trim_galore.
# Run this script from directory /bin/  and  the sequences they are in /data/raw/mydata/
# Prerequisites: install trim_galore 0.4.4_dev

# Create output directory
mkdir -p ../data/raw/mydata/clean

# Clean the sequences with trim_galor
for R in `ls ../data/raw/mydata | grep -oE "\w*_" | uniq`;
do trim_galore --fastqc --paired --retain_unpaired --length 136 --three_prime_clip_R1 15 --three_prime_clip_R2 15 --illumina -a2 GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG --stringency 5  -o ../data/raw/mydata/clean ../data/raw/mydata/${R}1.fastq.gz ../data/raw/mydata/${R}2.fastq.gz;
done
