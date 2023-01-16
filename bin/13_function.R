#### This script is to do graphic of realtion between the structural variants and the function genes ####
## Before to ejecute the packaeges in Rstudio is neccesary extract the function column from gff files of each genomic variant consensus dataset and eliminate the non informative and  repetitive words such as Protein, uncharacterized, putative, problable
## Pre-requisites R packages: tm, NLP, SnowballC, wordcloud and RColorBrewer

# Load packages
library(tm)
library(NLP)
library(SnowballC)
library(RColorBrewer)
library(wordcloud)
library(wordcloud2) 

## Load dataset
texto <- readLines("funcionesgmlandraces3.txt")
texto = iconv(texto, to="ASCII//TRANSLIT")
texto = Corpus(VectorSource(texto)) 

### sStandardize text

# all lowercase letters (A!=a)
discurso=tm_map(texto, tolower)
# remove whitespace
discurso =tm_map(discurso, stripWhitespace)
# remove punctation
discurso = tm_map(discurso, removePunctuation)
# remove numbers
discurso = tm_map(discurso, removeNumbers)

# show generic words
stopwords("spanish")
# remove generic words
discurso=tm_map(discurso, removeWords,stopwords("spanish"))

# graphic worldcloud
dtm <- TermDocumentMatrix(discurso) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words) 


wordcloud(words = df$word, freq = df$freq, min.freq = 2, max.words=100, random.order=F, scale = c(1.5, 0.2), rot.per=0.35, colors=brewer.pal(8, "Dark2"))
