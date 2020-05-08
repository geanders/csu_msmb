if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(c("Biostrings", "BSgenome.Celegans.UCSC.ce2"))
BiocManager::install("BSgenome")
suppressMessages(library("BSgenome.Celegans.UCSC.ce2"))
Celegans
seqnames(Celegans)
class(Celegans$chrM)
length(Celegans$chrM)
library("Biostrings")
lfM = letterFrequency(Celegans$chrM, letters = c("A", "T", "G", "C"))
lfM
sum(lfM)
lfM/sum(lfM)
?rmultinom
dmultinom(c(4335, 6179, 2055, 1225), prob = rep(1/4, 4))
dmultinom(c(4, 6, 2, 1), prob = rep(1/4, 4))
dmultinom(c(43, 61, 20, 12), prob = rep(1/4, 4))
dmultinom(c(433, 617, 205, 122), prob = rep(1/4, 4))
rmultinom(n = 5, size = 13794, prob = rep(0.25, 4))
13794/4
dmultinom(c(4335, 6179, 2055, 1225), prob = rep(1/4, 4))
hist(colSums(((rmultinom(n = 10000, size = 13794, prob = rep(0.25, 4))-3448.5)^2)/3448.5))


