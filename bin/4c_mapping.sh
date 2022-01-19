#!/bin/bash



# Index reference genome 

bwa index ../data/cloros/ref/g_hirsutum.fasta

## Create output directory

mkdir ../data/cloros/map

### Align samples against the reference genome

for R in `ls ../data/raw/new_genomes/trim/next | grep -oE "\w*_" | uniq`;

do bwa mem -t 10 -M ../data/cloros/ref/g_hirsutum.fasta ../data/raw/new_genomes/trim/next/${R}1.fq.gz ../data/raw/new_genomes/trim/next/${R}2.fq.gz > ../data/cloros/map/${R}.sam ;

done



for R in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;

do bwa mem -t 10 -M ../data/cloros/ref/g_hirsutum.fasta ../data/raw/published/clean/next/${R}1.fq.gz ../data/raw/published/clean/next/${R}2.fq.gz > ../data/cloros/map/${R}.sam ;

done
