#!/bin/bash

# This script do the quality analysis of sequencing with fastqc
# Create output directory
mkdir ../data/fastqcs

# Do analysis sequences quality 
for i in ../data/samples/*.fq.gz;
do fastqc $i -o ../data/fastqcs
done

