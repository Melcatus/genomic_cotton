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
|               +--download_seq.sh
|	+--data/
|               +-- README_data.md
|	+--meta/
|               +--id_samples.txt
|               +--general_expo_project.pdf
```


*[/bin/](https://github.com/Melcatus/genomic_cotton/tree/master/bin)*

This directory contains the necessary scripts for do the structural variant analysis. Each script correspond to a step of workflow.

*[/data/](https://github.com/Melcatus/genomic_cotton/tree/master/data)*

Contains the description about data obtain, and the links to repository of data in that you can found files .fastq

*[/meta/](https://github.com/Melcatus/genomic_cotton/tree/master/meta)*

Directory *meta* contain the additional information for management the data

#### Credits
Melania Vega
