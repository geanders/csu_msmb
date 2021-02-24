install.packages("flexmix")
library("flexmix")
data("NPreg")
set.seed(10)
m1 = flexmix(yn ~ x + I(x^2), data = NPreg, k = 2)
class(NPreg)
summary(NPreg)

table(NPreg$class, clusters(m1))
#rows are true clusters and m1 are flexmix extimators
#yn = normal yp = poisson yb = binomal 
# install.packages("ggplot2")
install.packages("ggplot2")
library("ggplot2")

which(clusters(m1)!=NPreg$class)

NPreg$class

clusters(m1)

flexmix(formula = )

which(clusters(m1)!=NPreg$class)


ggplot(data = NPreg, aes ( x = x, y =yn, color = class)) +
  geom_point()


m3 = flexmix(yp ~ x, data = NPreg,model = FLXMRglm(family = "poisson"), k = 2)

table(NPreg$class, clusters(m2))

ggplot(data = NPreg, aes ( x = x, y =yp, color = clusters(m2))) +
  geom_point()

ggplot(data = NPreg, aes ( x = x, y =yp, color = clusters(m3))) +
  geom_point()








