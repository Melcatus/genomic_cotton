#!/bin/bash

for R in `ls ./ | grep -oE "\w*_" | uniq` ;
do vcf2bed < ${R}filt2.txt > ${R}pos.bed ;
done


for R in `ls ./ | grep -oE "\w*_" | uniq`;
do awk '{print $1 "\t" $2 "\t" $3}' ${R}pos.bed > ${R}pos2.txt;
done

for R in `ls ./ | grep -oE "\w*_" | uniq`;
do bedmap --echo --echo-map-id --delim '\t' ${R}pos2.txt annotations.bed > ${R}a.bed ;
done


mkdir wild
mkdir gmwild
mkdir landraces
mkdir gmlandraces
mkdir breedinglines

mv A*a.bed ./wild
mv B*a.bed ./gmwild
mv C*a.bed ./landraces
mv D*a.bed ./gmlandraces
mv E*a.bed ./breedinglines


cat A* > all_pos.txt
sort all_pos.txt > sort_all.txt
uniq -D sort_all.txt > wildinv_pos.vcf
awk '{print $4}' wildinv_pos.vcf | sed '/^$/d;s/[[:blank:]]//g' | uniq > wild_indels_genes.txt


cat B* > all_pos.txt
sort all_pos.txt > sort_all.txt
uniq -D sort_all.txt > gm-wildinv_pos.vcf
awk '{print $4}' gm-wildinv_pos.vcf | sed '/^$/d;s/[[:blank:]]//g' | uniq > gmwild_indels_genes.txt

cat C* > all_pos.txt
sort all_pos.txt > sort_all.txt
uniq -D sort_all.txt > landracesinv_pos.vcf
awk '{print $4}' landracesinv_pos.vcf | sed '/^$/d;s/[[:blank:]]//g' | uniq > landraces_indels_genes.txt

cat D* > all_pos.txt
sort all_pos.txt > sort_all.txt
uniq -D sort_all.txt > gmlandracesinv_pos.vcf
awk '{print $4}' gm-landracesinv_pos.vcf | sed '/^$/d;s/[[:blank:]]//g' | uniq > landraces_indels_genes.txt

cat E* > all_pos.txt
sort all_pos.txt > sort_all.txt
uniq -D sort_all.txt > blinv_pos.vcf
awk '{print $4}' blinv_pos.vcf | sed '/^$/d;s/[[:blank:]]//g' | uniq > bl_indels_genes.txt


