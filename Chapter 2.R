#Part 1
mtb = read.table("../data/M_tuberculosis.txt", header = TRUE)
head(mtb, n = 4)

pro  =  mtb[ mtb$AmAcid == "Pro", "Number"]
pro/sum(pro)

table(mtb)
tabulate(mtb)

install.packages("rlang")
install.packages("dplyr")
library(dplyr)
mtb%>%
  mutate(genome_length = sum(Number)) %>%
  group_by(Codon) %>%
  mutate(PerThous = 1000*Number / genome_length)


stat = function(obsvd, exptd = 20 * pvec) {
  sum((obsvd - exptd)^2 / exptd)
}
B = 1000
simulstat = replicate(B, {
  randomtab10 = sapply(cs, function(s) { rmultinom(1, s, p0) })
  stat(randomtab10, expectedtab10)
})
S1 = stat(tab10, expectedtab10)
sum(simulstat >= S1)

#Part 2

rtheta = rbeta(100000, 50, 350)
hist(rtheta)
#centered around 0.125 then grab a theta and will go into binomial distribution and will compare it 


rtheta = rbeta(100000, 50, 350)
y = vapply(rtheta, function(th) {
  rbinom(1, prob = th, size = 300)
}, numeric(1))
hist(y, breaks = 50, col = "orange", main = "", xlab = "")
#this is a bionomial distribution but for all the values for theta evaluated accross the binomial 
#marginal bc were only looking at the why compenent 

#Compute the conditional probability outcomes where y=40, compute the posterior distribution of θby conditioning on those outcomes where Ywas 40
#pick 40 on the orange ? 
thetaPostEmp = rtheta[ y == 40 ]
hist(thetaPostEmp, breaks = 40, col = "chartreuse4", main = "",
     probability = TRUE, xlab = expression("posterior"~theta))
densPostTheory  =  dbeta(thetas, 90, 610)
lines(thetas, densPostTheory, type="l", lwd = 3)

#the histogram (green) shows the simulated values for the posteriror distribution, the line the theoretical density of a beta distribution with the theoretical posterior parameters.

#If we want to change the 90,610 w/ y=30
#beta(80,870)=beta(50+30,350+(300-30))

thetaPostEmp = rtheta[ y == 30 ]
hist(thetaPostEmp, breaks = 40, col = "chartreuse4", main = "",
     probability = TRUE, xlab = expression("posterior"~theta))
densPostTheory  =  dbeta(thetas, 80, 620)
lines(thetas, densPostTheory, type="l", lwd = 3)
mean(thetaPostEmp)
#smaller theta now 0.11



rtheta = rbeta(100000, 10, 30)
y = vapply(rtheta, function(th) {
  rbinom(1, prob = th, size = 300)
}, numeric(1))
hist(y, breaks = 50, col = "orange", main = "", xlab = "")
mean(rtheta)

thetaPostEmp = rtheta[ y == 40 ]
hist(thetaPostEmp, breaks = 40, col = "chartreuse4", main = "",
     probability = TRUE, xlab = expression("posterior"~theta))
densPostTheory  =  dbeta(thetas, x = 50, 290)
lines(thetas, densPostTheory, type="l", lwd = 3)
mean(thetaPostEmp)
