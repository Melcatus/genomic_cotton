#!/bin/bash

# This script is to variant annotation.
# Run this script from directory ~/bin. The sequences they are in ~/data/raw/published/clean/next and ~/data/raw/resequenced/trim/next
# Prerequisites: install NGSEPcore 3.3.0 

######### Published genomes #########
# Annotation
for i in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do java -jar -Xms16000M -Xmx16000M ../NGSEPcore_3.3.0.jar Annotate ../data/raw/published/clean/next/${i}RG3.vcf ../data/raw/reference/gene.Ghir.ZJU.gff3 ../data/raw/reference/TM-1_V2.1.fa 1> ../data/raw/published/clean/next/${i}annotated.vcf;
done 

## Statistics
for i in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do java -jar -Xms16000M -Xmx16000M ../NGSEPcore_3.3.0.jar SummaryStats -m 1 ../data/raw/published/clean/next/${i}annotated.vcf 1> ../data/raw/published/clean/next/${i}.stats;
done 

######### Resequenced genomes #########
# Annotation
for R in `ls ../data/raw/new_genomes/trim/next | grep -oE "\w*_" | uniq`;
do java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar Annotate ../data/raw/new_genomes/trim/next/${R}3.vcf ../data/raw/reference/gene.Ghir.ZJU.gff3 ../data/raw/reference/TM-1_V2.1.fa 1> ../data/raw/new_genomes/trim/next/${R}annotated.vcf;
done

## Statistics
for R in `ls ../data/raw/new_genomes/trim/next | grep -oE "\w*_" | uniq`;
do java -jar -Xms10000M -Xmx10000M ../NGSEPcore_3.3.0.jar SummaryStats -m 1 ../data/raw/new_genomes/trim/next/${R}annotated.vcf 1> ../data/raw/new_genomes/trim/next/${R}a.stats;
done

######## Merge vcf by population #######
java -jar -Xms50000M -Xmx50000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/reference/TM-1_V2.1.fa.fai ../data/raw/new_genomes/trim/next/A01_3.vcf ../data/raw/new_genomes/trim/next/A02_3.vcf ../data/raw/published/clean/next/A04_3.vcf ../data/raw/published/clean/next/A05_3.vcf 1> ../data/raw/new_genomes/trim/next/wild.vcf 2> ../data/raw/new_genomes/trim/next/1populationwild.log

java -jar -Xms50000M -Xmx50000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/new_genomes/trim/next/C01_3.vcf ../data/raw/new_genomes/trim/next/C02_3.vcf ../data/raw/new_genomes/trim/next/C03_3.vcf ../data/raw/new_genomes/trim/next/C04_3.vcf ../data/raw/new_genomes/trim/next/C05_3.vcf 1> ../data/raw/new_genomes/trim/next/landraces.vcf 2> ../data/raw/new_genomes/trim/next/1populationland.log

java -jar -Xms50000M -Xmx50000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/published/clean/next/E01_3.vcf ../data/raw/published/clean/next/E02_3.vcf ../data/raw/published/clean/next/E03_3.vcf ../data/raw/published/clean/next/E04_3.vcf ../data/raw/published/clean/next/E05_3.vcf ../data/raw/published/clean/next/F01_3.vcf 1> ../data/raw/new_genomes/trim/next/commercial.vcf 2> ../data/raw/new_genomes/trim/next/1populationcomm.log
