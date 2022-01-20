#!/bin/bash

# This script is to variant annotation.
# Run this script from directory ~/bin. The sequences they are in ~/data/raw/published/clean/next and ~/data/raw/resequenced/trim/next
# Prerequisites: install NGSEPcore 4.0.3 



### my genomes
for R in `ls ../data/raw/new_genomes/trim/next | grep -oE "\w*_" | uniq`;
do java -jar -Xms50000M -Xmx50000M ../NGSEPcore_4.0.3.jar VCFAnnotate -i ../data/raw/new_genomes/trim/next/${R}3.vcf -t ../data/raw/reference/TM-1_V2.1.gene2.gff3 -r ../data/raw/reference/TM-1_V2.1.fa -o ../data/raw/new_genomes/trim/next/${R}annotate.vcf;
done

### published genomes
for R in `ls ../data/raw/published/clean/next/ | grep -oE "\w*_" | uniq`;
do java -jar -Xms50000M -Xmx50000M ../NGSEPcore_4.0.3.jar VCFAnnotate -i ../data/raw/published/clean/next/${R}3.vcf -t ../data/raw/reference/TM-1_V2.1.gene2.gff3 -r ../data/raw/reference/TM-1_V2.1.fa -o ../data/raw/published/clean/next/${R}annotate.vcf;
done

######## Merge vcf by population #######
java -jar -Xms50000M -Xmx50000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/reference/TM-1_V2.1.fa.fai ../data/raw/new_genomes/trim/next/A01_3.vcf ../data/raw/new_genomes/trim/next/A02_3.vcf ../data/raw/published/clean/next/A04_3.vcf ../data/raw/published/clean/next/A05_3.vcf 1> ../data/raw/new_genomes/trim/next/wild.vcf 2> ../data/raw/new_genomes/trim/next/1populationwild.log

java -jar -Xms50000M -Xmx50000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/new_genomes/trim/next/C01_3.vcf ../data/raw/new_genomes/trim/next/C02_3.vcf ../data/raw/new_genomes/trim/next/C03_3.vcf ../data/raw/new_genomes/trim/next/C04_3.vcf ../data/raw/new_genomes/trim/next/C05_3.vcf 1> ../data/raw/new_genomes/trim/next/landraces.vcf 2> ../data/raw/new_genomes/trim/next/1populationland.log

java -jar -Xms50000M -Xmx50000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/published/clean/next/E01_3.vcf ../data/raw/published/clean/next/E02_3.vcf ../data/raw/published/clean/next/E03_3.vcf ../data/raw/published/clean/next/E04_3.vcf ../data/raw/published/clean/next/E05_3.vcf ../data/raw/published/clean/next/F01_3.vcf 1> ../data/raw/new_genomes/trim/next/commercial.vcf 2> ../data/raw/new_genomes/trim/next/1populationcomm.log
