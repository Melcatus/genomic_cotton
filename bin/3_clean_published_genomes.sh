# This script is for data cleaning using trim_galore.
# Run this script from directory /bin/  and  the sequences they are in /data/raw/published/
# Prerequisites: install trim_galore 0.6.0_dev

# Create output directory
mkdir -p ../data/raw/published/clean

# Clean the sequences with trim_galor
for R in `ls ../data/raw/published | grep -oE "\w*_" | uniq`;
do ./TrimGalore-0.6.0/trim_galore --fastqc --paired --length 83 --clip_R1 12 --clip_R2 12 --three_prime_clip_R1 5 --three_prime_clip_R2 5 --illumina -o ../data/raw/published/clean ../data/raw/published/${R}1.fastq.gz ../data/raw/published/${R}2.fastq.gz;
done
