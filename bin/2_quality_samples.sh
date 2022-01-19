#!/bin/bash

# This script do the quality analysis of sequencing with fastqc
# Run this script from directory /bin/  and  the sequences they are in /data/raw/new_genomes/  and in /data/raw/published/
# Prerequisites: install FastQC v.0.11.7 

# Create output directory
mkdir ../data/raw/new_genomes/fastqcs

# Do analysis sequences quality 
for i in ../data/raw/new_genomes/*.fastq.gz;
do fastqc $i -o ../data/raw/new_genomes/fastqcs
done

# Create output directory 
mkdir ../data/raw/published/fastqcs

# Do analysis sequences quality 
for i in ../data/raw/published/*.fq.gz;
do fastqc $i -o ../data/raw/published/fastqcs
done
