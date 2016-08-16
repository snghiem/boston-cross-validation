# Author: Sony Nghiem
# Title: Bootstrap analysis

rm(list=ls())
library(MASS) # for the Boston's housing data
library(boot) # for the boot() function (bootstrap analysis)

boot.fn  = function(data, index) 
  lm(medv~., data=data, subset=index)$coefficients

boot(Boston, boot.fn, 100) #boostrap 100 times
#compare with the OLS
summary(lm(medv~.,Boston))
#I guess in this case, there is no improvement using bootstrap
