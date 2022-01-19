#!/bin/bash

#This script download sequences of projects in NCBI that contain binary files and convert this is files in files .fasta

for i in SRR1975549 SRR1536369 SRR1534688 SRR1536367 SRR1536365 SRR1536364 SRR617482;
do fastq-dump --split-files --gzip $i 
done

