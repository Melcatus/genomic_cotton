#!/bin/bash

#create output directory 
mkdir ../data/raw/mydata/clean/fastas 

# convert file bam in fasta
for R in `ls ../data/raw/mydata/clean/sorted | grep -oE "\w*_" | uniq`;
do samtools fastq -F 0x900 ../data/raw/mydata/clean/sorted/${R}sorted.bam > ../data/raw/mydata/clean/fastas/${R}.fa;
done

