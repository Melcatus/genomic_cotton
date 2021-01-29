#!/bin/bash

# This script is to do a network with all samples of complex wild-to-crop of cotton
# Run in /bin directory and the data is in /data/raw/new_genomes/trim/next
# Prerequisites: install NGSEPcore 3.3.0, Ugene and SplitsTree

## Merge vcf population of wild and domesticated groups
java -jar -Xms50000M -Xmx50000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/reference/TM-1_V2.1.fa.fai ../data/raw/new_genomes/trim/next/wild_fil.vcf ../data/raw/new_genomes/trim/next/landraces_fil.vcf ../data/raw/new_genomes/trim/next/commercial_fil.vcf 1> ../data/raw/new_genomes/trim/next/dome1000.vcf 2> ../data/raw/new_genomes/trim/next/domefull.log

### Convert vcf to fasta file
java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar ConvertVCF -printFasta ../data/raw/new_genomes/trim/next/dome1000.vcf ../data/raw/new_genomes/trim/next/domestication

#### Convert aligned fasta file of NGSEP with Ugene to nexus file

##### Nexus files can be manipulate by SplitsTree 

