#!/bin/bash

## This script is to search of transgenes sequences genomes samples
### Pre-requisite: samtools and blastn
#### The script is in bin/ and the database: ref_transgen.fasta is in github in meta/

##### Search of transgenes sequences in available genomes in NCBI
# convert fastq to fasta
for R in `ls ../data/raw/published/ | grep -oE "\w*_" | uniq`;
do ../seqtk/seqtk seq -a ../data/raw/published/${R}1.fq.gz > ../data/raw/published/${R}1.fasta;
done

for R in `ls ../data/raw/published/ | grep -oE "\w*_" | uniq`;
do ../seqtk/seqtk seq -a ../data/raw/published/${R}2.fq.gz > ../data/raw/published/${R}2.fasta;
done

# search sequences of transgenes
for R in `ls ../data/raw/published/ | grep -oE "\w*_" | uniq`;
do blastn -query ../data/raw/published/${R}1.fasta -db ../data/raw/new_genomes/trim/next/transgenes/ref_transgen.fasta -out ../data/raw/new_genomes/trim/next/transgenes/${R}1RT.tb -evalue 1e-5 -outfmt "6 qseqid sseqid qseq sseq length pident qcovs evalue" -num_threads 8;
done

for R in `ls ../data/raw/published/ | grep -oE "\w*_" | uniq`;
do blastn -query ../data/raw/published/${R}2.fasta -db ../data/raw/new_genomes/trim/next/transgenes/ref_transgen.fasta -out ../data/raw/new_genomes/trim/next/transgenes/${R}2RT.tb -evalue 1e-5 -outfmt "6 qseqid sseqid qseq sseq length pident qcovs evalue" -num_threads 8;
done


##### Search of transgenes sequences in resequencing genomes
# convert fastq to fasta
for R in `ls ../data/raw/new_genomes/ | grep -oE "\w*_" | uniq`;
do ../seqtk/seqtk seq -a ../data/raw/new_genomes/${R}1.fq.gz > ../data/raw/new_genomes/${R}1.fasta;
done

for R in `ls ../data/raw/new_genomes/ | grep -oE "\w*_" | uniq`;
do ../seqtk/seqtk seq -a ../data/raw/new_genomes/${R}2.fq.gz > ../data/raw/new_genomes/${R}2.fasta;
done

# search sequences of transgenes
for R in `ls ../data/raw/new_genomes/ | grep -oE "\w*_" | uniq`;
do blastn -query ../data/raw/new_genomes/${R}1.fasta -db ../data/raw/new_genomes/trim/next/transgenes/ref_transgen.fasta -out ../data/raw/new_genomes/trim/next/transgenes/${R}1RT.tb -evalue 1e-5 -outfmt "6 qseqid sseqid qseq sseq length pident qcovs evalue" -num_threads 8;
done

for R in `ls ../data/raw/new_genomes/ | grep -oE "\w*_" | uniq`;
do blastn -query ../data/raw/new_genomes/${R}2.fasta -db ../data/raw/new_genomes/trim/next/transgenes/ref_transgen.fasta -out ../data/raw/new_genomes/trim/next/transgenes/${R}2RT.tb -evalue 1e-5 -outfmt "6 qseqid sseqid qseq sseq length pident qcovs evalue" -num_threads 8;
done
