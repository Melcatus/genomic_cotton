## This script is to filter the diferent genomic variants

#### To structural variants
##### Remove variants in scaffolds and variants with score > 40
for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep -v "Scaffold" ./${i}1SV.gff > ${i}sS.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep -v "scaffold" ${i}sS.gff > ${i}ss.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep -v "REPEAT" ${i}ss.gff > ${i}z.gff;
done
## Separate by chromosome
for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A01 ./${i}1SV.gff > ${i}a01.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A02 ./${i}1SV.gff > ${i}a02.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A03 ./${i}1SV.gff > ${i}a03.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A04 ./${i}1SV.gff > ${i}a04.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A05 ./${i}1SV.gff > ${i}a05.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A06 ./${i}1SV.gff > ${i}a06.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A07 ./${i}1SV.gff > ${i}a07.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A08 ./${i}1SV.gff > ${i}a08.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A09 ./${i}1SV.gff > ${i}a09.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A10 ./${i}1SV.gff > ${i}a10.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A11 ./${i}1SV.gff > ${i}a11.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A12 ./${i}1SV.gff > ${i}a12.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep A13 ./${i}1SV.gff > ${i}a13.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D01 ./${i}1SV.gff > ${i}d01.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D02 ./${i}1SV.gff > ${i}d02.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D03 ./${i}1SV.gff > ${i}d03.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D04 ./${i}1SV.gff > ${i}d04.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D05 ./${i}1SV.gff > ${i}d05.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D06 ./${i}1SV.gff > ${i}d06.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D07 ./${i}1SV.gff > ${i}d07.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D08 ./${i}1SV.gff > ${i}d08.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D09 ./${i}1SV.gff > ${i}d09.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D10 ./${i}1SV.gff > ${i}d10.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D11 ./${i}1SV.gff > ${i}d11.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D12 ./${i}1SV.gff > ${i}d12.gff;
done

for i in `ls ./ | grep -oE "\w*_" | uniq`;
do grep D13 ./${i}1SV.gff > ${i}d13.gff;
done

##### filter by position, eliminate overlapped and close SV
library(tidyverse)
library(GenomicRanges)
library(data.table)

variants <- read.delim("CNV_cromosomaA1.txt") %>%
  as.tibble() %>%
  select(X.2, X.3, X.4) %>%
  dplyr::rename(start = X.2, end = X.3, val1 = X.4)

variants <- data.table(variants)

setkey(variants, start, end)

ppp <- foverlaps(variants, variants, type="any")

nnn <- unique(ppp, by = "i.end")

write.table(nnn, file = "result1.txt")

#####convert gff files to vcf format
##fileformat=VCFv3.3
##fileDate=2021817
##source=gffToVcf ../../../chrA01_gff/A01_a01_filt_1.gff
##INFO=NS,1,Integer,"Number of Samples with Data"
##INFO=DP,1,Integer,"Total Depth of Coverage"
#CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO

##Creating an editing script
#Download files
unzip ../../../../../Downloads/*.zip
#Move them to gff_files
mv chr* ../../../gff_files/
mv Chr* ../../../gff_files/

#Bulk
FILES=$(ls ../../../../gff_files/)
declare -a FILES=("$FILES")

for GFF_FILES in ${FILES[@]}; do
	mkdir ../../../../out/$GFF_FILES

FILES=$(cat gff_names.txt)
declare -a FILES=("$FILES")

for GFF in ${FILES[@]}; do
    awk -F " " '{print $1 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' ../../../../gff_files/$FILES/$GFF >> ../../../../out/$FILES/$GFF.vcf
    done
    done

awk -F " " '{print $1 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' ../../../../gff_files/ChrD13_gff/ >> ../../../../out/ChrD13_gff/E05_d13_filt.vcf

#Editar header y crear archivo consenso de cada cromosoma
sed "s/gff//g" ../../../../out/ChrA01_gff/A0*.vcf > ../../../../out/ChrA01_gff/A_a01.vcf

	‘/tmp/RtmpYDTftL/downloaded_packages’

#Concatenar archivos con las 6 columnas (todo) de los cromosomas A-D para silvestres y variedades

	cat ../../../../out/ChrA*/A_*.vcf ../../../../out/ChrD*/A_*.vcf >> ../../../../out/consensus_ChrA-D/ChrA-D_A.vcf #silvestres
	
	cat ../../../../out/ChrA*/C_*.vcf ../../../../out/ChrD*/C_*.vcf >> ../../../../out/consensus_ChrA-D/ChrA-D_C.vcf #variedades nativas

cat ../../../../out/ChrA*/E_*.vcf ../../../../out/ChrD*/E_*.vcf >> ../../../../out/consensus_ChrA-D/ChrA-D_E.vcf #variedades comerciales



### To short mutations 
####SNPs
##### Merge individuals vcf in population vcf files
java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/reference/TM-1_V2.1.fa.fai ../data/raw/new_genomes/trim/next/finalresult/A01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/A02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/A04_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/A05_fil5.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/wild_ann.vcf 2> ../data/raw/new_genomes/trim/next/finalresult/Wpopulation.log


java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/reference/TM-1_V2.1.fa.fai ../data/raw/new_genomes/trim/next/finalresult/C01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C03_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C04_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C05_fil5.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/landraces_ann.vcf 2> ../data/raw/new_genomes/trim/next/finalresult/Lpopulation.log


java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/reference/TM-1_V2.1.fa.fai ../data/raw/new_genomes/trim/next/finalresult/E01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E03_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E04_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E05_fil5.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/BL_ann.vcf 2> ../data/raw/new_genomes/trim/next/finalresult/BLpopulation.log


java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/reference/TM-1_V2.1.fa.fai ../data/raw/new_genomes/trim/next/finalresult/B01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/B02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/B03_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/B04_fil5.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/wildgm_ann.vcf 2> ../data/raw/new_genomes/trim/next/finalresult/wgmpopulation.log


java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/reference/TM-1_V2.1.fa.fai ../data/raw/new_genomes/trim/next/finalresult/D01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/D02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/D03_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/D04_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C06_fil5.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/landracesgm_ann.vcf 2> ../data/raw/new_genomes/trim/next/finalresult/Lgmpopulation.log

java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/reference/TM-1_V2.1.fa.fai ../data/raw/new_genomes/trim/next/finalresult/A01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/A02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/A04_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/A05_fil5.vcf ../data/raw/reference/TM-1_V2.1.fa.fai ../data/raw/new_genomes/trim/next/finalresult/C01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C03_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C04_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C05_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E03_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E04_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E05_fil5.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/dome_ann.vcf 2> ../data/raw/new_genomes/trim/next/finalresult/domepopulation.log


java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar MergeVCF ../data/raw/reference/TM-1_V2.1.fa.fai ../data/raw/new_genomes/trim/next/finalresult/A01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/A02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/A04_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/A05_fil5.vcf ../data/raw/reference/TM-1_V2.1.fa.fai ../data/raw/new_genomes/trim/next/finalresult/C01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C03_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C04_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C05_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E03_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E04_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/E05_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/B01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/B02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/B03_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/B04_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/D01_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/D02_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/D03_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/D04_fil5.vcf ../data/raw/new_genomes/trim/next/finalresult/C06_fil5.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/complex_ann.vcf 2> ../data/raw/new_genomes/trim/next/finalresult/complexpopulation.log



###filter by distance and quality

java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar FilterVCF -d 100 -q 40 -s -fi -minMAF 0.05 -fs ../data/raw/new_genomes/trim/next/finalresult/wild_ann.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/wild_annotated_filtered.vcf

java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar FilterVCF -d 100 -q 40 -s -fi -minMAF 0.05 -fs ../data/raw/new_genomes/trim/next/finalresult/landraces_ann.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/landraces_annotated_filtered.vcf

java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar FilterVCF -d 100 -q 40 -s -fi -minMAF 0.05 -fs ../data/raw/new_genomes/trim/next/finalresult/BL_ann.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/BL_annotated_filtered.vcf

java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar FilterVCF -d 100 -q 40 -s -fi -minMAF 0.05 -fs ../data/raw/new_genomes/trim/next/finalresult/wildgm_ann.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/gmwild_annotated_filtered.vcf

java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar FilterVCF -d 100 -q 40 -s -fi -minMAF 0.05 -fs ../data/raw/new_genomes/trim/next/finalresult/landracesgm_ann.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/gmlandraces_annotated_filtered.vcf

java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar FilterVCF -d 100 -q 40 -s -fi -minMAF 0.05 -fs ../data/raw/new_genomes/trim/next/finalresult/dome_ann.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/dome_annotated_filtered.vcf

java -jar -Xms35000M -Xmx35000M ../NGSEPcore_3.3.0.jar FilterVCF -d 100 -q 40 -s -fi -minMAF 0.05 -fs ../data/raw/new_genomes/trim/next/finalresult/complex_ann.vcf 1> ../data/raw/new_genomes/trim/next/finalresult/complex_annotated_filtered.vcf

