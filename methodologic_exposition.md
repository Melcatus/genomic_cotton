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

![textlink](https://github.com/Melcatus/genomic_cotton/blob/master/humano.jpg)

Figure 3. Clinical examples of structural variations in the genome (Spielmann et al. 2018)

#### Strategies to detect and analysis SV of data from high-throughput sequencing

They are several methods to find SV, these are (Chen et al. 2009; Sindi et al. 2009; Schröder et al. 2014; Abyzov et al. 2011; Duitama et al. 2014; Smith et al. 2015):

- *paired-end mapping* : Read pairs that map too far apart define deletions, those found too close together are indicative of insertions, and orientation inconsistencies can delineate inversions and a specific class of tandem duplications.

- *read-depth* : Duplicated regions will show significantly higher read depth and deletions will show reduced read depth when compared to diploid regions.

- *split-read mapping* : are capable of detecting deletions and small insertions down to single-base-pair resolution.

- *de novo assembly* : characterize novel sequence between genomes without genome reference.


Because each variant can present different complications for identification, it has been proposed that in general it be used *paired-end mapping* or *de novo assembly*, but, the software to identify each variant can be different.


![textlink](https://github.com/Melcatus/genomic_cotton/blob/master/different_methods.jpg)


Figure 4. Two major NGS approaches to detect SVs (Saxena et al. 2014). PAV= presence-absence variation.

One of them is NGSEP that include parameters like:

- LENGTH:  Predicted length of the event
- SOURCE: Algorithm that originated each variant call
- NSF: Number of fragments supporting the structural variation event
- NTADF: For CNVs called with the read depth algorithms this is the number of paired-end frDistribution and classification of SVs. (A) Frequency of observations per SV cluster. Only 562 high-coverage samples were used for insertion detection. (B) Distribution of variant sizes by SV type. (C) Classification of variants in each peak (cluster frequency > 10 samples). (D) Frequencies of events with 98% sequence identity to known or potentially active TEs in rice.agments showing an alignment pattern consistent with a tandem duplication
- And others ...

The comand that use this software is

```
java -jar NGSEPcore.jar FindVariants -maxAlnsPerStartPos 100 <REFERENCE> <BAM_FILE>

```


-maxAlnsPerStartPos: Maximum number of alignments allowed to start at the same reference site. This parameter helps to control false positives produced by PCR amplification artifacts.

And, this step of our workflow is crucial because the parameters that describe the biology of the analyzed specie must be chosen and the sequencing characteristics indicated, if done properly the probability of false positivesis decreased.

It has been observed that the complexity of genomes (ploidy) and characteristics such as the high number of transposable elements, can generate different results depending on the variant that is analyzed and its length, so it has been suggested that each variant be searched through of sensitive software to each one.

For example, in *Oryza*, it was used DELLY, GROM and LUMPY for langer variants and, MetaSV and MindTheGap for short insertions. The results showed 63 millon of SV (Fuentes et al. 2019), compared to the previous study in which they foun 90, 000 SV (Wang et al. 2018).

![textlink](https://github.com/Melcatus/genomic_cotton/blob/master/F1.large.jpg)   

Figure 5. Distribution and classification of SVs. (A) Frequency of observations per SV cluster. Only 562 high-coverage samples were used for insertion detection. (B) Distribution of variant sizes by SV type. (C) Classification of variants in each peak (cluster frequency > 10 samples). (D) Frequencies of events with 98% sequence identity to known or potentially active TEs in rice. (Fuentes et al. 2019)
