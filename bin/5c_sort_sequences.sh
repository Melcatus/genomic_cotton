#!/bin/bash



# Convert sam to bam file

for R in `ls ../data/cloros/map | grep -oE "\w*_" | uniq`;

do java -jar -Xmx60000M ../picard.jar SamFormatConverter I=../data/cloros/map/${R}.sam O=../data/cloros/map/${R}.bam;

done

## Sorted

for R in `ls ../data/cloros/map | grep -oE "\w*_" | uniq`;

do java -jar -Xmx60000M ../picard.jar SortSam I=../data/cloros/map/${R}.bam O=../data/cloros/map/${R}sorted.bam SO=coordinate;

done

### Add group

for R in `ls ../data/cloros/map | grep -oE "\w*_" | uniq`;

do java -jar -Xmx60000M ../picard.jar AddOrReplaceReadGroups I=../data/cloros/map/${R}sorted.bam O=../data/cloros/map/${R}sortedRG.bam ID=sample LB=Paired-end PL=Illumina PU=Unknown SM=sample;

done

#### Index samples

for R in `ls ../data/cloros/map | grep -oE "\w*_" | uniq`;

do samtools index ../data/cloros/map/${R}sortedRG.bam;

done

##### Create out directories to analysis of qualimap 

for R in `ls ../data/cloros/map | grep -oE "\w*_" | uniq`;

do mkdir ../data/cloros/map/${R};

done
