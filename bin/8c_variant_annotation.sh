#!/bin/bash
#### Filter vcf files



java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar FilterVCF -q 40 -d 10 -s -fi -minMAF 0.05 -fs ../data/cloros/map/wild.vcf 1> ../data/cloros/map/wildfiltered.vcf



java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar FilterVCF -q 40 -d 10 -s -fi -minMAF 0.05 -fs ../data/cloros/map/landraces.vcf 1> ../data/cloros/map/landracesfiltered.vcf



java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar FilterVCF -q 40 -d 10 -s -fi -minMAF 0.05 -fs ../data/cloros/map/bl.vcf 1> ../data/cloros/map/blfiltered.vcf



#### Annotation of vcf files



java -jar -Xms60000M -Xmx60000M ../NGSEPcore_4.0.3.jar VCFAnnotate -i ../data/cloros/map/wildfiltered.vcf -t ../data/cloros/ref/g_hirsutum_a.gff3 -r ../data/cloros/ref/g_hirsutum.fasta -o ../data/cloros/map/wildannotated.vcf



java -jar -Xms60000M -Xmx60000M ../NGSEPcore_4.0.3.jar VCFAnnotate -i ../data/cloros/map/landracesfiltered.vcf -t ../data/cloros/ref/g_hirsutum_a.gff3 -r ../data/cloros/ref/g_hirsutum.fasta -o ../data/cloros/map/landracesannotated.vcf



java -jar -Xms60000M -Xmx60000M ../NGSEPcore_4.0.3.jar VCFAnnotate -i ../data/cloros/map/blfiltered.vcf -t ../data/cloros/ref/g_hirsutum_a.gff3 -r ../data/cloros/ref/g_hirsutum.fasta -o ../data/cloros/map/blannotated.vcf

