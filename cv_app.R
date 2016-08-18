# Author: Sony Nghiem
# Title: Applications of cross-validation in comparing models
# Purpose: as mentioned the point of cross-validation is to choose the best models
# out of choices (linear, non-linear, neural model, knn, etc), not to predict 
# the test sets' values. Here I compare linear and polynomial models using k-fold cross-validation.

rm(list=ls())
library(MASS) # for the Boston's housing data
library(boot) # for cv.glm function

set.seed(23)

k.fold = function(data, degree) {
  glm.fit = glm(medv~poly(lstat, degree), data=Boston)
  # prediction error
  cv.glm(Boston, glm.fit, K=20)$delta[1] #delta elements in the function cv.glm
}

cv.error = rep(0,10) 
degree = 1:10
for (d in degree) # for polynomials to the power of 10 
  cv.error[d] = k.fold(Boston, d)

plot(degree, cv.error, type="b", col="maroon") # b for both line and point drawings
which.min(cv.error)
# polynomial of 5 seems to obtain the least MSE.