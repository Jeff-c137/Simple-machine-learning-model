Machine Learning in Diagnosing Breast Cancer
Overview:
This project utilizes machine learning techniques for diagnosing breast cancer based on relevant features. The dataset used for this project is obtained from Kaggle at Breast Cancer Wisconsin Data.

Author:
Njoroge
Date:
March 2, 2023

Libraries Used:
library(C50)
library(gmodels)
library(tidyverse)

Instructions:
Data Preview:
Use glimpse(data) to get a preview of the dataset.

Data Preprocessing:
Exclude the patient ID since it won't be necessary for the model:
Breast_cancer <- data[-1]

Change the target variable from character to factor:
Breast_cancer$diagnosis <- factor(Breast_cancer$diagnosis, levels = c("M", "B"), 
                                   labels = c("Malignant", "Benign"))
                                   
Data Splitting:
Divide the data into training and testing sets:

Breast_cancer_train <- Breast_cancer[1:469, ]
Breast_cancer_test <- Breast_cancer[470:569, ]

Model Training:
Use the C5.0 algorithm to create the machine learning model:
Breast_cancer_model <- C5.0(Breast_cancer_train[-1], Breast_cancer_train$diagnosis, trials = 15)

Check Model Summary:
Check the summary and details of the trained model:
summary(Breast_cancer_model)

Model Prediction and Evaluation:
Make predictions on the test set and evaluate the model performance:

Breast_cancer_pred <- predict(Breast_cancer_model, Breast_cancer_test)
CrossTable(Breast_cancer_test$diagnosis, Breast_cancer_pred,
           prop.chisq = FALSE, prop.r = FALSE, prop.c = FALSE,
           dnn = c("Actual diagnosis", "Predicted diagnosis"))
Results:
The machine learning model achieved an accuracy of 98%, indicating a high level of performance.
