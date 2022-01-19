###### Run qualimap

for R in `ls ../data/cloros/map | grep -oE "\w*_" | uniq`;

do ../qualimap_v2.2.1/qualimap bamqc --java-mem-size=60G -bam ../data/cloros/map/${R}sortedRG.bam -gff ../data/cloros/ref/g_hirsutum_a.gff  -outdir ../data/cloros/map/${R} -nw 400 -hm 3;

done
