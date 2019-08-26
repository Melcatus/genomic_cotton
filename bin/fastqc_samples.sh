#!/bin/bash

#This script realize the quality analysis of sequencing with fastqc

for i in GhB11_2_R1.fastq.gz GhB11_2_R2.fastq.gz GhY3-1_R1.fastq.gz GhY3-1_R2.fastq.gz GhOaxC3_R1.fastq.gz GhOaxC3_R2.fastq.gz;
do fastqc $i -o ./
done

