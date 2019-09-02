#!/bin/bash/

# This script is for data cleaning using BBTools.
# Run this script from directory /bin/  and  the sequences they are in /data/R1 and /data/R2
# Prerequisites: install BBTools 38.49

# 1. Create output directories 
mkdir ../data/clean

# 2. Create a array containing the unique  pice of the file name (in word character) before the "_" 

fileprefix=$(ls ../data | grep -oE "\w*"_ | uniq)

# 3. Eliminate adapters

for i in $fileprefix;
do bbmap/bbduk.sh -Xmx2g threads=1 in1=../data/${R}1.fastq.gz in2=../data/${R}2.fastq.gz out1=../data/clean/${R}1.fastq.gz out2=../data/clean/${R}2.fastq.gz ref=/bbmap/resources/adapters.fa tpe tbo;
done


