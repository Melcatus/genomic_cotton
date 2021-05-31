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
