---
title: "Machine Learning in Diagnosing Breast Cancer"
author: "Njorge"
date: "2023-03-2"
---
#Machine learning used in breast cancer diagnosis 
#data
#You can obtain the data from
  ("https://www.kaggle.com/datasets/uciml/breast-cancer-wisconsin-data")

#The libraries required
library(C50)
library(gmodels)
library(tidyverse)
#To have a preview of your data
glimpse(data)
#Since a model patient Id won't be necessary in creating our model we exclude it
Breast_cancer <- data[-1]
#To change a target variable from character to factor
Breast_cancer$diagonsis <- factor(Breast$diagnosis, levels = c("M", "B"), 
                           labels = c("Malignant", " Beging"))
head(Breast$diagnosis)
#We divide our data in to two the first will be used in training our model and the second for testing our model
Breast_cancer_train <- Breast[1:469, ]
Breast_cancer_test <- Breast[470:569, ]
#Now we use the C50 algorithm  to create our model
Breast_cancer_model <- C5.0(Breast_train[-1], Breast_train$diagnosis, trials = 15)
#check our model
Breast_cancer_model
summary(Breast_model)
Breastcancer_pred <- predict(Breast_model, Breast_test)
#To check our model performance
CrossTable(Breast_cancer_test$diagnosis, Breastcancer_pred,
           prop.chisq = FALSE, prop.r = FALSE, prop.c = FALSE,
           dnn = c("Actual diagnosis", "Predicted diagnosis"))
#The model had accuracy of 98% which is actually good , congratulations you have just build our first machine learning model
