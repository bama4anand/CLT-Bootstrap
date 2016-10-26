##Define two rnorm samples of differing sample sizes
Std1 <- rnorm(20, 0, 4)  #small sample size
Std2 <- rnorm(200, 0, 4) #large sample size

##Define two rexp samples of differing sample sizes
Exp1 <- rexp(20)  #small sample size
Exp2 <- rexp(200) #large sample size

##Define a vector to house the 1000 samples for each
bootStd1mean <- numeric(1000)
bootStd2mean <- numeric(1000)
bootExp1mean <- numeric(1000)
bootExp2mean <- numeric(1000)

##This is our bootstrap loop to define means of 1000 samples of our original dataset.
##Samples are chosen randomly with replacement
for (i in 1:1000) {
  bootStd1 <- sample(Std1, size=length(Std1), replace=TRUE)
  bootStd2 <- sample(Std2, size=length(Std2), replace=TRUE)
  
  bootexp1 <- sample(Std1, size=length(Exp1), replace=TRUE)
  bootexp2 <- sample(Std2, size=length(Exp2), replace=TRUE)
  
  bootStd1mean[i] <- mean(bootStd1)
  bootStd2mean[i] <- mean(bootStd2)
  
  bootExp1mean[i] <- mean(bootexp1)
  bootExp2mean[i] <- mean(bootexp2)
}
##Below you will see Histogram output from our results:
  par(mfrow=c(2,2))
hist(Std1, main = "Original rnorm Sample Size 20")
hist(bootStd1mean, main = "BootStrap rnorm Sample Size 20")

hist(Std2, main = "Original rnorm Sample Size 200")
hist(bootStd2mean, main = "BootStrap rnorm Sample Size 200")

