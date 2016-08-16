# Author: Sony Nghiem
# Title: Validation Set Approach

# It is similar to k-fold cross-validation with k=2
# but here we divide the sample into train and validation sets
# fit on train and test on validation
# but I do not switch to fit on validation and test on train like that in k-fold
rm(list=ls())
library(MASS) # for the Boston's housing data

set.seed(1)
train = sample(dim(Boston)[1], dim(Boston)[1]/2)
lm.fit = lm(medv~., data = Boston, subset=train)
lm.pred = predict(lm.fit, Boston[-train,]) #note that it's not !train since train is not logical here

# estimated test Mean-Squared Error
mean((medv[-train]-lm.pred)^2)

# Note that I could use
# lm.pred = predict(lm.fit, Boston[-train]) without the comma at the end of train
# but then the MSE would be
# mean((medv-lm.pred)[-train]^2) since now lm.pred has 506 values
