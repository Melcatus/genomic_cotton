#!/bin/bash

# This script is to short variant annotation.
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

#### separate files of Indels, STR and SNP
#####make directory to indel files
mkdir indels
#### eliminate snps and STR and select Indels
for R in `ls ./ | grep -oE "\w*_" | uniq`;
do grep "INDEL" ./${R}annotate.vcf | grep -v "Scaffold" | grep -v "scaffold" > ./indels/${R}indel.vcf;
done

#####make directory to indel files
mkdir str

#### eliminate snps and indels and select STR
for R in `ls ./ | grep -oE "\w*_" | uniq`;
do grep "STR" ./${R}annotate.vcf | grep -v "Scaffold" | grep -v "scaffold" > ./str/${R}str.vcf;
done

#####make directory to indel files
mkdir snp
for R in `ls ./ | grep -oE "\w*_" | uniq`;
do grep -v "TYPE=INDEL" ./${R}annotate.vcf | grep -v "TYPE=STR" | grep -v "Scaffold" | grep -v "scaffold"  > ./snp/${R}fil4.vcf;
done


