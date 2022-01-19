#!/bin/bash

## Script used for the assembly of cotton genomes from high-quality sequences 150 PE
### Pre-requisites: GetOrganelle


docker exec -u 1313 -w /data/GetOrganelle/ 17db924563e1 get_organelle_from_reads.py -1 ../B04_1.fastq.gz -2 ../B04_2.fastq.gz -t 7 -s ../meta/Ref_chloro.fasta -o ../Cloro/Algodon_B04_GO_2 -R 15 -k 21,35,45,55,65,75 -F embplant_pt
