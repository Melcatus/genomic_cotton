#!/bin/bash

###### annotations.bed file was created before from gff3
##### Annotate structural variants
for R in `ls ./ | grep -oE "\w*_" | uniq`;
do bedmap --echo --echo-map-id --delim '\t' ${R}.vcf annotations.bed > ${R}annotated.bed;
done

###### print gene list
for R in `ls ./ | grep -oE "\w*_" | uniq`;
do awk '{print $4}' ${R}annotated.bed | sed '/^$/d;s/[[:blank:]]//g' > ${R}_genes.txt;
done
