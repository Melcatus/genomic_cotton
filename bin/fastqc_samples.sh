#!/bin/bash

#This script do the quality analysis of sequencing with fastqc

for i in ../data/*.fastq.gz;
do fastqc $i -o ./
done

