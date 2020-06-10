#!/bin/bash

# This script is for data cleaning using trim_galore.
# Run this script from directory /bin/  and  the sequences they are in /data/raw/new_genomes/
# Prerequisites: install trim_galore 0.6.0_dev

# make out directory 
mkdir -p ../data/raw/new_genomes/trim


# Clean the sequences with trim_galor
for R in `ls ../data/raw/new_genomes/| grep -oE "\w*_" | uniq`;
do ./TrimGalore-0.6.0/trim_galore --fastqc --paired --length 136 --clip_R1 10 --clip_R2 10 --three_prime_clip_R1 5 --three_prime_clip_R2 5 --illumina -a2 GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG --stringency 5  -o ../data/raw/new_genomes/trim ../data/raw/new_genomes/${R}1.fastq.gz ../data/raw/new_genomes/${R}2.fastq.gz;
done
