#!/bin/bash


# This script is for data cleaning using trim_galore.
# Run this script from directory ~/bin/  and  the sequences they are in ~/data/raw/published/  and in ~/data/raw/resequenced
# Prerequisites: install trim_galore 0.6.0_dev

# Create output directory
mkdir -p ../data/raw/published/trim
mkdir -p ../data/raw/resequenced/trim

# Clean the published sequences with trim_galor
for R in `ls ../data/raw/published | grep -oE "\w*_" | uniq`;
do ./TrimGalore-0.6.0/trim_galore --fastqc --paired --length 83 --clip_R1 12 --clip_R2 12 --three_prime_clip_R1 5 --three_prime_clip_R2 5 --illumina -o ../data/raw/published/trim ../data/raw/published/${R}1.fastq.gz ../data/raw/published/${R}2.fastq.gz;
done

# Clean the resequences with trim_galor
for R in `ls ../data/raw/resequenced | grep -oE "\w*_" | uniq`;
do ./TrimGalore-0.6.0/trim_galore --fastqc --paired --length 136 --clip_R1 10 --clip_R2 10 --three_prime_clip_R1 5 --three_prime_clip_R2 5 --illumina -a2 GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG --stringency 5  -o ../data/raw/resequenced/trim ../data/raw/resequenced/${R}1.fastq.gz ../data/raw/resequenced/${R}2.fastq.gz;
done
