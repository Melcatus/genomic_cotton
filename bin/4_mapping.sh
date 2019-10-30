#!/bin/bash

# This script do mapping whith bwa 
# Prerequisite: intall bwa 0.7.12-r1039
# Working directory is /bin/
# Genome reference is /data/reference/
# Samples /data/raw/mydata/clean

# Index genome reference 
bwa index ../data/reference/TM-1_V2.1.fa
 
# Mapping samples against the genome reference 
for R in `ls ../data/raw/mydata | grep -oE "\w*_" | uniq`;
do bwa mem -t 8 -M ../data/reference/TM-1_V2.1.fa ${R}_1.fq.gz ${R}_2.fq.gz > ${R}.sam ;
done

