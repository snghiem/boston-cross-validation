# Author: Sony Nghiem
# Title: K-fold cross-validation
# Purpose: randomly divide the set into k groups of equal size, treat one as
# validation and the rest as training set.Do the fitting on the train
# and find MSE, then choose another set out of k groups as validation. Repeat.

rm(list=ls())
library(MASS) # for the Boston's housing data
library(boot) # for cv.glm function

set.seed(1)
glm.fit =glm(medv~., data=Boston) #without family argument, by default is OLS
cv.error = cv.glm(Boston, glm.fit, K=10) # 10-fold here
# LOOCV is k-fold cross-validation with k=n

# prediction error
cv.error$delta[1]
