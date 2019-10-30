#!/bin/bash

# Create output directory 
mkdir ../data/raw/mydata/clean/variants/

# This script do find variants 
for R in `ls ../data/raw/mydata/clean/sorted/ | grep -oE "\w*_" | uniq`;
do java -jar -Xmx4000M NGSEPcore_3.3.2.jar FindVariants -maxAlnsPerStartPos 100 -csb -ploidy 4 -psp ../data/reference/TM-1_V2.1.fa ../data/raw/mydata/clean/sorted/${i}_sorted.bam ../data/raw/mydata/clean/variants/${i} ;
done


