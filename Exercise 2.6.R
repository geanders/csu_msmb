#exercise 2.6
loglikelihood = function(theta, n = 300, k = 40) {
  115 + k * log(theta) + (n - k) * log(1 - theta)
}

thetas = seq(0, 1, by = 0.001)
plot(thetas, loglikelihood(thetas), xlab = expression(theta),
     ylab = expression(paste("log f(", theta, " | y)")),type = "l")


rtheta = rbeta(100000, 50, 350)
y = vapply(rtheta, function(th) {
  rbinom(1, prob = th, size = 300)
}, numeric(1))
hist(y, breaks = 50, col = "orange", main = "", xlab = "")

rbinom(length(rtheta), rtheta, size = 300)

thetaPostEmp = rtheta[ y == 40 ]
hist(thetaPostEmp, breaks = 40, col = "chartreuse4", main = "",
     probability = TRUE, xlab = expression("posterior"~theta))
densPostTheory  =  dbeta(thetas, 90, 610)
lines(thetas, densPostTheory, type="l", lwd = 3)

mean(thetaPostEmp)
## [1] 0.1286394
dtheta = thetas[2]-thetas[1]
sum(thetas * densPostTheory * dtheta)
## [1] 0.1285714

thetaPostMC = rbeta(n = 1e6, 90, 610)
mean(thetaPostMC)
## [1] 0.1285445

qqplot(thetaPostMC, thetaPostEmp, type = "l", asp = 1)
abline(a = 0, b = 1, col = "blue")

densPost2 = dbeta(thetas, 115, 735)
mcPost2   = rbeta(1e6, 115, 735)

sum(thetas * densPost2 * dtheta)  # mean, by numeric integration
## [1] 0.1352941
mean(mcPost2)                     # mean, by MC
## [1] 0.1352963
thetas[which.max(densPost2)]      # MAP estimate
## [1] 0.134

quantile(mcPost2, c(0.025, 0.975))
##      2.5%     97.5% 
## 0.1131867 0.1590393
