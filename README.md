# genomic_cotton
This repository contain the scripts generated in the project *Genomic characterization of the wild-to-domesticated complex of Gossypium hirsutum in Mexico* whitch is subdivided in three sections:

1) Analysis of chloroplast genomes
2) Analysis of nuclear genomes
3) Location of transgenes in the genomes

#### Data characteristics
- WGS
- Sequencing with Illumina NovaSeq 6000
- Library TruSeq DNA PCR free
- Paired-end

#### Graphic workflow by section

*Analysis of chloroplast genomes*

*Analysis of nuclear genomes*
![textlink](https://github.com/Melcatus/genomic_cotton/blob/master/workflow_3.png)

*Location of transgenes in the genomes*


#### Prerequisites
*Software to analyze the chloroplast genomes:*

[GetOrganelle 1.7.3.4 ](https://github.com/Kinggerm/GetOrganelle)

[GeSeq](https://chlorobox.mpimp-golm.mpg.de/geseq.html)

[CPGAVAS2](http://47.90.241.85:16019/analyzer/home)

[Mauve 2.4.0](http://darlinglab.org/mauve/mauve.html)

[MAFFT 7.0](https://mafft.cbrc.jp/alignment/software/)

[MEGA-X 10.2.4](https://www.megasoftware.net/history)

[SplitsTree](https://software-ab.informatik.uni-tuebingen.de/download/splitstree4/manual.pdf)

[BEAST](https://beast.community/)

*Software to analyze the nuclear genome:*

[fastqc_v0.11.8](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)

[trim_galore 0.6.0_dev](https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/)

[bwa0.7.17-r1188](http://bio-bwa.sourceforge.net/)

[Samtools 1.7](http://samtools.sourceforge.net/)

[Picard](https://broadinstitute.github.io/picard/)

[NGSEP](http://ngsep.sourceforge.net/ManualNGSEP.htm#_Toc374444744)

[SplitsTree](https://software-ab.informatik.uni-tuebingen.de/download/splitstree4/manual.pdf)

[bedmap 2.4.40](https://bedops.readthedocs.io/en/latest/content/reference/statistics/bedmap.html)


R packages:
* ggplot2
* gtable
* grid
* lattice
* phyloch
* strap
* phytools
* tidyverse
* GenomicRanges

#### Directories

 ##### Directory organization
 ```
+-- genomic_cotton
|	+--bin/
|               +--1_download_seq.sh
|               +--1.1_transgenes_blast.sh
|               +--2_quality_samples.sh
|               +--3c_assembly_chloroplast.sh
|               +--3n_clean_data.sh
|               +--4_mapping.sh
|               +--5_sort_sequences.sh
|               +--6_quality_mapping.sh
|               +--7_find_variants.sh
|               +--8_variant_annotation.sh
|               +--9_boxplot.R
|               +--10_filter_variants.R
|               +--10_1_filter_overlapped.R
|               +--11_distance_network.R
|	+--data/
|               +-- transgen_db.fasta
|               +-- README_data.md
|	              +--annotation/
|                    	  +--README_annotation.md
|                         +--Predicted gene alignments_TM-1_V2.1.gene.gff.gz
|                         +--blat_AD1_transcript_ZJU_g.hirsutum_cottongen_reftransV1.p97.len97.gff3.gz
|                         +--marker_alignment_blat_AD1_ZJU_SNP.p90.len97.gaplt2.gapszlt2.gff3.gz
|                         +--other_transcript_blat_AD1_TxJGI_g.hirsutum_cottongen_refTransV1.p97.len97.gff3.gz
|                         +--predicted_gene_alignment_Tx-JGI_G.hirsutum_v1.1.gene.gff3.gz
|	+--meta/
|               +--id_samples.txt
```


*[/bin/](https://github.com/Melcatus/genomic_cotton/tree/master/bin)*

This directory contains the necessary scripts for do the structural variant analysis. Each script correspond to a step of workflow.
Description each script:

* `1_download_seq.sh` to download sequences of projects in NCBI
* `1.1_transgenes_blast.sh` to search of transgenes sequences genomes samples
* `2_fastqc_samples.sh` to do the quality analysis of sequencing with fastqc
* `3c_assembly_chloroplast.sh` to do the assembly of chloroplast genomes
* `3n_clean_mydata.sh` to data cleaning using trim_galore
* `4_mapping.sh` to mapping samples against the reference genome whith bwa
* `5_sort_sequences.sh` to convert file .sam to .bam, and to sort the aligmented genomes with Picard
* `6_quality_mapping.sh` to evaluate the quality of mapping
* `7_find_variants.sh` to identified structural variants
* `8_variant_annotation.sh` to annotated each genomic variant
* `9_boxplot.R` to generated graphics with the number of genomic variants found
*

*[/data/](https://github.com/Melcatus/genomic_cotton/tree/master/data)*

Contains the description about the data obtained, and the links to the repository of data where you can found .fastq files

*[/meta/](https://github.com/Melcatus/genomic_cotton/tree/master/meta)*

Directory *meta* contain the additional information about the management of data

#### Credits
Melania Vega
