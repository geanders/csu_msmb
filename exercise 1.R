> suppressMessages(library("BSgenome.Celegans.UCSC.ce2"))
> Celegans
Celegans$chrM
library("Biostrings")
lfM = letterFrequency(Celegans$chrM, letters=c("A", "C", "G", "T"))
str(Celegans)
browseVignettes("Biostrings")
length(BSgenome.Celegans.UCSC.ce2)
Celegans$chrM

lfM = letterFrequency(Celegans$chrM, letters=c("A", "C", "G", "T"))
lfM
n <- sum(lfM
  )
lfM/sum(lfM
      )
sample(c("A","T","C","G"), size=n, replace=T)
dat <- sample(c("A","T","C","G"), size=n, replace=T)
table(dat)
sim <- function() {dat <- sample(c("A","T","C","G"), size=n, replace=T)
table(dat)
}
x3 <- replicate(1000, sim())
x3
m <- numeric(4)
for (i in 1:4) { 
  m[i] <- mean(abs(x3[i,] - n*.25) >= abs(lfM-n*.25))
  }
m
