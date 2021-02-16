#!/bin/bash

##### Search of transgenes sequences in published genomes
# extract sequences unmapped
for R in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do samtools view -b -f 4 ../data/raw/published/clean/next/${R}RG.bam > ../data/raw/published/clean/next/${R}unmap.bam;
done

# convert from bam to fasta

for R in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do samtools fasta ../data/raw/published/clean/next/${R}unmap.bam > ../data/raw/published/clean/next/${R}unmap.fa;
done

# search sequences of transgenes
for R in `ls ../data/raw/published/clean/next | grep -oE "\w*_" | uniq`;
do blastn -query ../data/raw/published/clean/next/${R}unmap.fa -db ../data/raw/new_genomes/trim/next/transgenes/ref_transgen.fasta -out ../data/raw/new_genomes/trim/next/transgenes/${R}RT.tb -evalue 1e-5 -outfmt "6 qseqid sseqid qseq sseq length pident qcovs evalue" -num_threads 8;
done

##### Search of transgenes sequences in resequencing genomes
# extract sequences unmapped
for R in `ls ../data/raw/new_genomes/trim/next | grep -oE "\w*_" | uniq`;
do samtools view -b -f 4 ../data/raw/new_genomes/trim/next/${R}RG.bam > ../data/raw/published/clean/next/${R}unmap.bam;
done

# convert from bam to fasta

for R in `ls ../data/raw/new_genomes/trim/next | grep -oE "\w*_" | uniq`;
do samtools fasta ../data/raw/new_genomes/trim/next/${R}unmap.bam > ../data/raw/new_genomes/trim/next/${R}unmap.fa;
done

# search sequences of transgenes
for R in `ls ../data/raw/new_genomes/trim/next | grep -oE "\w*_" | uniq`;
do blastn -query ../data/raw/new_genomes/trim/next/${R}unmap.fa -db ../data/raw/new_genomes/trim/next/transgenes/ref_transgen.fasta -out ../data/raw/new_genomes/trim/next/transgenes/${R}RT.tb -evalue 1e-5 -outfmt "6 qseqid sseqid qseq sseq length pident qcovs evalue" -num_threads 8;
done
