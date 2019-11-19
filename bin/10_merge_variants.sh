#!/bin/bash

# This script do merge files .vcf with variants (output of FindVariants-NGSEP) of each sample. Incluide three steps using commands: MergeVariants, FindVariants and MergeVCF
# The script run in the directory /bin/  the data are in /data/vcfs , /data/bams and /data/genome_reference

# Generate file of sequence name file wit the genome reference  
samtools faidx ../data/genome_reference/TM-1_V2.1.fa 
# First step: Merge variants of the multiple files vcf (in files with coverage more that 10X)
java -jar -Xmx4000M NGSEPcore_3.3.2.jar MergeVariants ../data/genome_reference/TM-1_V2.1.fa.fai ../data/vcfs/my_samples ../data/vcfs/*.vcf 

# Second step: Genotype for each sample the variants produced at the first step using the variants detector
for R in `ls ../data/vcfs | grep -oE "\w*_" | uniq`;
do java -jar -Xmx4000M NGSEPcore_3.3.2.jar MergeVariants ../data/genome_reference/TM-1_V2.1.fa.fai ../data/vcfs/my_samples ../data/bams/${R}sorted.bam ../data/vcfs/${R}merge.vcf
done

# Third step: to join these new vcf files
java -jar -Xmx4000M NGSEPcore_3.3.2.jar MergeVCF /home/mel/Documentos/cotton/data/variants_samples/TM-1_V2.1.fa.fai ../data/vcfs/*merge.vcf > ../data/vcfs/all_my_samples.vcf

