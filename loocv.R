# Author: Sony Nghiem
# Title: Leave-one-out-cross-validation (LOOCV)
# Purpose: a single observation as a validation set, the rest as train
# find MSE and repeat the process with n-1 left observations.

rm(list=ls())
library(MASS) # for the Boston's housing data
library(boot) # for cv.glm function

set.seed(1)
glm.fit =glm(medv~., data=Boston) #without family argument, by default is OLS
cv.error = cv.glm(Boston, glm.fit)
# LOOCV is k-fold cross-validation with k=n

# prediction error
cv.error$delta[1]
# perform better than validation approach

