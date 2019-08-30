#!/bin/bash/

# This script do mapping whith bwa 
# Prerequisite: intall bwa 
# Working directory is /bin/

# 1. Create a index genome reference 
bwa index ../data/TM1.fasta
 
# 2. Mapping samples against the genome reference 
 
