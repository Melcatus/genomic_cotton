#!/bin/bash

# This script do the quality analysis of sequencing with fastqc
# Run this script from directory /bin/  and  the sequences they are in /data/raw/resequenced/  and in /data/raw/published/
# Prerequisites: install FastQC v.0.11.7 

# Create output directory
mkdir ../data/raw/resequenced/fastqcs

# Do analysis sequences quality 
for i in ../data/raw/resequenced/*.fastq.gz;
do fastqc $i -o ../data/raw/resequenced/fastqcs
done

# Create output directory 
mkdir ../data/raw/published/fastqcs

# Do analysis sequences quality 
for i in ../data/raw/published/*.fq.gz;
do fastqc $i -o ../data/raw/published/fastqcs
done
