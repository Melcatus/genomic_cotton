#!/bin/bash/

# This script is for data cleaning using BBTools and Trim Galore.
# Run from directory /bin/  and  the sequences they are in /data/R1 and /data/R2
# Prerequisites: install BBTools 38.49

# 1. Eliminate adapters
mkdir ../data/seq_clean/R1
mkdir ../data/seq_clean/R2
for i in *.fastq.gz;
do bbduk.sh -Xmx2g threads=1 in1=../data/R1/$i in2=../data/R2/$i out1=../data/seq_clean/R1/$i out2=../data/R2/$i ref=/resources/adapters.fa tpe tbo

# 2. Eliminate sequences of phago phix

# 3. Eliminate sequences with low quality 

# 4. Eliminate overrepresented sequences
