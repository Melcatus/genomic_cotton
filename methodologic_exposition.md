### Analysis of Structural variants in genomes

#### Change in the analysis of variations between populations

In the last few years, the analysis about genetic diversity between populations had been marked by the study of the single nucleotid polymorphism (SNPs). With the increase of the resolution and the number of reads by sample, longer regions have been studied.

![textlink](https://github.com/Melcatus/genomic_cotton/blob/master/methods_sequencing.jpg)

Figure 1. Copy number variant size distribution and discovery methods ([Alkan et al. 2011](https://www.ncbi.nlm.nih.gov/pubmed/21358748))


The change in the genome compared to a reference genome that has a different copy number, orientation, or chromosomal location, is defined as structural variant (SV), that can be 100-1000 bp (Fuentes et al. 2019).  Structural variants can be classified as:

 - deletions
 - insertions
 - duplications
 - inversions
 - translocations

 in more detail,  Alkan et al. 2011 describe SV like:

 ![textlink](https://github.com/Melcatus/genomic_cotton/blob/master/structural_variants.jpg)

 Figure 2. Classes of SV.

The analysis of SV started in human genome,in which it was found that the SV were related to different diseases (Spielmann et al. 2018). Then, started the analysis in plant genomes of species with agronomy importance and species in extinction danger. Now, it's know that the differents SV in plants are related with characteristic phenotypes, for example, the increased copy number of some genes (*Vrn-A1*, *Ppd-B1*) can be cause late flowering.

#### Strategies to detect and analysis SV of data from high-throughput sequencing

They are several methods to find SV, these are (Chen et al. 2009; Sindi et al. 2009; Schröder et al. 2014; Abyzov et al. 2011; Duitama et al. 2014; Smith et al. 2015):

- *paired-end mapping* : Read pairs that map too far apart define deletions, those found too close together are indicative of insertions, and orientation inconsistencies can delineate inversions and a specific class of tandem duplications.

- *read-depth* : Duplicated regions will show significantly higher read depth and deletions will show reduced read depth when compared to diploid regions.

- *split-read mapping* : are capable of detecting deletions and small insertions down to single-base-pair resolution.

- *de novo assembly* : characterize novel sequence between genomes without genome reference.


Because each variant can present different complications for identification, it has been proposed that in general it be used *paired-end mapping* or *de novo assembly*, but, the software to identify each variant can be different.


![textlink](https://github.com/Melcatus/genomic_cotton/blob/master/different_methods.jpg)


Figure 3. Two major NGS approaches to detect SVs (Saxena et al. 2014). PAV= presence-absence variation.

One of them is NGSEP that include parameters like:

- LENGTH:  Predicted length of the event
- SOURCE: Algorithm that originated each variant call
- NSF: Number of fragments supporting the structural variation event
- NTADF: For CNVs called with the read depth algorithms this is the number of paired-end fragments showing an alignment pattern consistent with a tandem duplication
- And others ...

The comand that use this software is

```
java -jar NGSEPcore.jar FindVariants -maxAlnsPerStartPos 100 <REFERENCE> <BAM_FILE>

```


Maximum number of alignments allowed to start at the same reference site. This parameter helps to control false positives produced by PCR amplification artifacts.
