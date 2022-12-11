tsum.test(mean.x = 3.63, s.x = 1.67, n.x = 19,
          mean.y = 2.79, s.y = 1.32, n.y = 27,
          alternative = "greater", var.equal = TRUE, conf.level = 0.90)

install.packages("mosaic")
library(mosaic)

plotDist(dist = 't', df = 2, col = "blue")

qchisq(p = 0.05, df = 2, lower.tail=FALSE)