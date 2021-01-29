#!/bin/bash

# Filter SNPs
## Wild
grep -v "TYPE=INDEL" ../data/raw/new_genomes/trim/next/wild.vcf > ../data/raw/new_genomes/trim/next/wildindel.vcf

grep -v "TYPE=STR" ../data/raw/new_genomes/trim/next/wildindel.vcf > ../data/raw/new_genomes/trim/next/wildsnp.vcf

java -jar -Xms50000M -Xmx50000M ../NGSEPcore_3.3.0.jar FilterVCF -d10 -q 40 -s -fi -minMAF 0.05 -fs ../data/raw/new_genomes/trim/next/wildsnp.vcf 1> ../data/raw/new_genomes/trim/next/wild_fil.vcf

## landraces
grep -v "TYPE=INDEL" ../data/raw/new_genomes/trim/next/landraces.vcf > ../data/raw/new_genomes/trim/next/landracesindel.vcf

grep -v "TYPE=STR" ../data/raw/new_genomes/trim/next/landracesindel.vcf > ../data/raw/new_genomes/trim/next/landracessnp.vcf

java -jar -Xms50000M -Xmx50000M ../NGSEPcore_3.3.0.jar FilterVCF -d10 -q 40 -s -fi -minMAF 0.05 -fs ../data/raw/new_genomes/trim/next/landracessnp.vcf 1> ../data/raw/new_genomes/trim/next/landraces_fil.vcf

## commercial varieties
grep -v "TYPE=INDEL" ../data/raw/new_genomes/trim/next/commercial.vcf > ../data/raw/new_genomes/trim/next/commercialindel.vcf

grep -v "TYPE=STR" ../data/raw/new_genomes/trim/next/commercialindel.vcf > ../data/raw/new_genomes/trim/next/commercialsnp.vcf

java -jar -Xms50000M -Xmx50000M ../NGSEPcore_3.3.0.jar FilterVCF -d10 -q 40 -s -fi -minMAF 0.05 -fs ../data/raw/new_genomes/trim/next/commercialsnp.vcf 1> ../data/raw/new_genomes/trim/next/commercial_fil.vcf

### compare vcf files with command Compare VCF of NGSEP and the software vcftoolz
vcftoolz compare ../data/raw/new_genomes/trim/next/wild_annotated.vcf ../data/raw/new_genomes/trim/next/landraces_annotated.vcf ../data/raw/new_genomes/trim/next/commercial_annotated.vcf > summary_annotated.txt

java -jar -Xms50000M -Xmx50000M ../NGSEPcore_3.3.0.jar CompareVCF -g 0 -d 100 ../data/raw/reference/TM-1_V2.1.fa ../data/raw/new_genomes/trim/next/wild_annotated.vcf ../data/raw/new_genomes/trim/next/landraces_annotated.vcf ../data/raw/new_genomes/trim/next/commercial_annotated.vcf 1>population_sampleComparation.txt

