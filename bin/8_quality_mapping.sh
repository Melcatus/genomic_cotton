#!/bin/bash

# This script evaluate the quality of mapping 
# Prerequisite: qualimap_v2.2.1
# Working directory is /bin/
# Files .sam generated from mapping is ../data/raw/mydata/clean/sorted/

# Create the output directory 
mkdir ../data/raw/mydata/clean/sorted/

# Analysis of quality
for R in `ls ../data/raw/mydata/clean/sorted/ | grep -oE "\w*_" | uniq`;
./qualimap bamqc -bam ../data/raw/mydata/clean/sorted/${R}_sorted.bam -gff /home/mel/Documentos/cotton/data/TM-1_V2.1.gene.gff -nw 400 -hm 3 -nt 7 -outdir ../data/raw/mydata/clean/sorted/ -outfile ../data/raw/mydata/clean/sorted/ --java-mem-size=4G
