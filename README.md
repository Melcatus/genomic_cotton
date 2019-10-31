# genomic_cotton
This repository contain the scripts generated in the project *Genomics effects of domestication in Gossypium hirsutum* whitch is directed by this workflow focused of the analysis of structural variants in whole genome:

![textlink](https://github.com/Melcatus/genomic_cotton/blob/master/Workflow.png)

#### Data characteristics
- WGS
- Sequencing with Illumina NovaSeq 6000
- Library TruSeq DNA PCR free
- Paired-end

#### Prerequisites

[fastqc_v0.11.8](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)

[trim_galore 0.4.4_dev](https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/)

[bwa0.7.17-r1188](http://bio-bwa.sourceforge.net/)

[Samtools 1.7](http://samtools.sourceforge.net/)

[FindVariants](http://ngsep.sourceforge.net/ManualNGSEP.htm#_Toc374444744)

[CGTDV](http://circos.ca/software/)

#### Directories

 ##### Directory organization
 ```
+-- genomic_cotton
|	+--bin/
|               +--1_download_seq.sh
|               +--2_fastqc_samples.sh
|               +--3_clean_mydata.sh
|               +--4_mapping.sh
|               +--5_convert_sam_to_bam.sh
|               +--6_sort_sequences.sh
|               +--7_convert_bam_fasta.sh
|               +--8_quality_mapping.sh
|               +--9_find_variants.sh
|	+--data/
|               +-- README_data.md
|	      +--annotation/
|               +--README_annotation.md
|               +--Predicted gene alignments_TM-1_V2.1.gene.gff.gz
|               +--blat_AD1_transcript_ZJU_g.hirsutum_cottongen_reftransV1.p97.len97.gff3.gz
|               +--marker_alignment_blat_AD1_ZJU_SNP.p90.len97.gaplt2.gapszlt2.gff3.gz
|               +--other_transcript_blat_AD1_TxJGI_g.hirsutum_cottongen_refTransV1.p97.len97.gff3.gz
|               +--predicted_gene_alignment_Tx-JGI_G.hirsutum_v1.1.gene.gff3.gz
|	+--meta/
|               +--id_samples.txt
|               +--general_expo_project.pdf
```


*[/bin/](https://github.com/Melcatus/genomic_cotton/tree/master/bin)*

This directory contains the necessary scripts for do the structural variant analysis. Each script correspond to a step of workflow.
Description each script:

*  `1_download_seq.sh` to download sequences of projects in NCBI
* `2_fastqc_samples.sh` to do the quality analysis of sequencing with fastqc
* `3_clean_mydata.sh` to data cleaning using trim_galore
* `4_mapping.sh` to mapping samples against the reference genome whith bwa
* `5_convert_sam_to_bam.sh` to onvert file .sam to .bam with samtools
* `6_sort_sequences.sh` to order reads after mapping
* `7_convert_bam_fasta.sh` to convert files .bam generated mapping to .fasta
* `8_quality_mapping.sh` to evaluate the quality of mapping
* `9_find_variants.sh` to find structural variants


*[/data/](https://github.com/Melcatus/genomic_cotton/tree/master/data)*

Contains the description about data obtain, and the links to repository of data in that you can found files .fastq

*[/meta/](https://github.com/Melcatus/genomic_cotton/tree/master/meta)*

Directory *meta* contain the additional information for management the data

#### Credits
Melania Vega
