rtheta = rbeta(100000, 100, 300)

y = vapply(rtheta, function(th) {
  rbinom(1, prob = th, size = 300)
}, numeric(1))
x <- hist(y, breaks = 50, col = "orange", main = "", xlab = "")

hist(rbinom(length(rtheta), rtheta, size = 300), col = "orange", main = "", xlab = "")

thetaPostEmp = rtheta[ y == 40 ]
hist(thetaPostEmp, breaks = 40, col = "chartreuse4", main = "",
     probability = TRUE, xlab = expression("posterior"~theta))
qqplot(thetaPostEmp, x, type = "l", asp = 1)
