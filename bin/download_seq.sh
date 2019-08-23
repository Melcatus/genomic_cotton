#!/bin/bash

#This script download sequences of projects in NCBI that contain binary files and convert this is files in files .fasta

for i in SRR1975549 SRR1536367 SRR1536365.2 SRR1536364.2;
do fastq-dump -gzip --fasta $i 
done
