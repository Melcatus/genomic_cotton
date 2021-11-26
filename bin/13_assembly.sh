#!/bin/bash

# This script was used to assembly genomes from a mapped samples
## This script is /bin and the data are ../data/raw/new_genomes/trim/next/
### Requisites install samtools, bamtools, trimommatic, abyss, spades

# Do output directory to sample A03
mkdir ../data/raw/new_genomes/trim/next/sampleA03

# Extract chromosome by chromosome
#### chromosomes of genome A
for i in {01,02,03,04,05,06,07,08,09,10,11,12,13} ;
do samtools view -h -b -f 0x1 ../data/raw/new_genomes/trim/next/A03_fm.bam A${i} > ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA${i}.bam ;
done

#### chromosomes of genome D
for i in {01,02,03,04,05,06,07,08,09,10,11,12,13} ;
do samtools view -h -b -f 0x1 ../data/raw/new_genomes/trim/next/A03_fm.bam D${i} > ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD${i}.bam ;
done
##### indexar chromosomes files
#### chromosomes of genome A
for i in {01,02,03,04,05,06,07,08,09,10,11,12,13} ;
do samtools index ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA${i}.bam ;
done

#### chromosomes of genome D
for i in {01,02,03,04,05,06,07,08,09,10,11,12,13} ;
do samtools index ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD${i}.bam ;
done
##### merge output files of genome A and D

bamtools merge -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA01.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA02.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA03.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA04.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA05.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA06.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA07.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA08.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA09.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA10.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA11.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA12.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrA13.bam -out ../data/raw/new_genomes/trim/next/sampleA03/genomeA.bam

bamtools merge -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD01.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD02.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD03.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD04.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD05.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD06.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD07.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD08.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD09.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD10.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD11.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD12.bam -in ../data/raw/new_genomes/trim/next/sampleA03/A03_chrD13.bam -out ../data/raw/new_genomes/trim/next/sampleA03/genomeD.bam

# index and sorted each genome
samtools index ../data/raw/new_genomes/trim/next/sampleA03/genomeA.bam

samtools index ../data/raw/new_genomes/trim/next/sampleA03/genomeD.bam

samtools sort -n ../data/raw/new_genomes/trim/next/sampleA03/genomeA.bam -o ../data/raw/new_genomes/trim/next/sampleA03/genomeA_sorted.bam
samtools sort -n ../data/raw/new_genomes/trim/next/sampleA03/genomeD.bam -o ../data/raw/new_genomes/trim/next/sampleA03/genomeD_sorted.bam

# convert bam to fastq and compress
bedtools bamtofastq -i ../data/raw/new_genomes/trim/next/sampleA03/genomeA_sorted.bam -fq ../data/raw/new_genomes/trim/next/sampleA03/genomeA_1.fastq -fq2 ../data/raw/new_genomes/trim/next/sampleA03/genomeA_2.fastq

bedtools bamtofastq -i ../data/raw/new_genomes/trim/next/sampleA03/genomeD_sorted.bam -fq ../data/raw/new_genomes/trim/next/sampleA03/genomeD_1.fastq -fq2 ../data/raw/new_genomes/trim/next/sampleA03/genomeD_2.fastq

gzip ../data/raw/new_genomes/trim/next/sampleA03/genomeA_1.fastq
gzip ../data/raw/new_genomes/trim/next/sampleA03/genomeA_2.fastq

gzip ../data/raw/new_genomes/trim/next/sampleA03/genomeD_1.fastq
gzip ../data/raw/new_genomes/trim/next/sampleA03/genomeD_2.fastq

### filter reads to get paired reads and assembly each genome with spades
java -jar -Xms50000M -Xmx50000M ../Trimmomatic-0.39/trimmomatic-0.39.jar PE ../data/raw/new_genomes/trim/next/sampleA03/genomeA_1.fastq.gz ../data/raw/new_genomes/trim/next/sampleA03/genomeA_2.fastq.gz ../data/raw/new_genomes/trim/next/sampleA03/genomeA_1.pair.fastq.gz ../data/raw/new_genomes/trim/next/sampleA03/genomeA_1.unpair.fastq.gz ../data/raw/new_genomes/trim/next/sampleA03/genomeA_2.pair.fastq.gz ../data/raw/new_genomes/trim/next/sampleA03/genomeA_2.unpair.fastq.gz ILLUMINACLIP:TruSeq-PE.fa:2:30:10 LEADING:0 TRAILING:0 SLIDINGWINDOW:4:15 MINLEN:36

spades.py -1 ../data/raw/new_genomes/trim/next/sampleA03/genomeA_1.pair.fastq.gz -2 ../data/raw/new_genomes/trim/next/sampleA03/genomeA_2.pair.fastq.gz -t 13 -k 77 -o ../data/raw/new_genomes/trim/next/assembly/A03A_V2


java -jar -Xms50000M -Xmx50000M ../Trimmomatic-0.39/trimmomatic-0.39.jar PE ../data/raw/new_genomes/trim/next/sampleA03/genomeD_1.fastq.gz ../data/raw/new_genomes/trim/next/sampleA03/genomeD_2.fastq.gz ../data/raw/new_genomes/trim/next/sampleA03/genomeD_1.pair.fastq.gz ../data/raw/new_genomes/trim/next/sampleA03/genomeD_1.unpair.fastq.gz ../data/raw/new_genomes/trim/next/sampleA03/genomeD_2.pair.fastq.gz ../data/raw/new_genomes/trim/next/sampleA03/genomeD_2.unpair.fastq.gz ILLUMINACLIP:TruSeq-PE.fa:2:30:10 LEADING:0 TRAILING:0 SLIDINGWINDOW:4:15 MINLEN:36

spades.py -1 ../data/raw/new_genomes/trim/next/sampleA03/genomeD_1.pair.fastq.gz -2 ../data/raw/new_genomes/trim/next/sampleA03/genomeD_2.pair.fastq.gz -t 13 -k 77 -o ../data/raw/new_genomes/trim/next/assembly/A03D_V2

### assembly with abyss
abyss-pe name=cottonA03 k=77 in=' ../data/raw/new_genomes/trim/next/sampleA03/genomeA_1.pair.fastq.gz ../data/raw/new_genomes/trim/next/sampleA03/genomeA_2.pair.fastq.gz'

abyss-pe name=cottonA03 k=77 in=' ../data/raw/new_genomes/trim/next/sampleA03/genomeD_1.pair.fastq.gz ../data/raw/new_genomes/trim/next/sampleA03/genomeD_2.pair.fastq.gz'
