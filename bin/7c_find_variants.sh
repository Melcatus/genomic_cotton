#!/bin/bash



# The fai index 

samtools faidx  ../data/cloros/ref/g_hirsutum.fasta

## Find variants

for R in `ls ../data/cloros/map | grep -oE "\w*_" | uniq`;

do java -jar -Xms60000M -Xmx60000M ../NGSEPcore_3.3.0.jar FindVariants  -runRep -runRD -runRP -maxAlnsPerStartPos 100 -csb -ploidy 1 -psp ../data/cloros/ref/g_hirsutum.fasta ../data/cloros/map/${R}sortedRG.bam ../data/cloros/map/${R}1 >& ../data/cloros/map/${R}.log;

done



### Merge vcf

java -jar -Xms60000M -Xmx60000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/cloros/ref/g_hirsutum.fasta.fai ../data/cloros/map/A01_1.vcf ../data/cloros/map/A02_1.vcf ../data/cloros/map/A04_1.vcf ../data/cloros/map/A05_1.vcf ../data/cloros/map/B01_1.vcf ../data/cloros/map/B02_1.vcf ../data/cloros/map/B03_1.vcf ../data/cloros/map/B04_1.vcf 1> ../data/cloros/map/wild.vcf 2> ../data/cloros/map/wild.log



java -jar -Xms60000M -Xmx60000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/cloros/ref/g_hirsutum.fasta.fai ../data/cloros/map/C01_1.vcf ../data/cloros/map/C02_1.vcf ../data/cloros/map/C03_1.vcf ../data/cloros/map/C04_1.vcf ../data/cloros/map/C05_1.vcf ../data/cloros/map/C06_1.vcf ../data/cloros/map/D01_1.vcf ../data/cloros/map/D02_1.vcf ../data/cloros/map/D03_1.vcf ../data/cloros/map/D04_1.vcf 1> ../data/cloros/map/landraces.vcf 2> ../data/cloros/map/landraces.log



java -jar -Xms60000M -Xmx60000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/cloros/ref/g_hirsutum.fasta.fai ../data/cloros/map/E01_1.vcf ../data/cloros/map/E02_1.vcf ../data/cloros/map/E03_1.vcf ../data/cloros/map/E04_1.vcf ../data/cloros/map/E05_1.vcf 1> ../data/cloros/map/bl.vcf 2> ../data/cloros/map/bl.log
