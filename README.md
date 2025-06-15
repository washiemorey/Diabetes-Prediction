# Diabetes-Prediction
### Early Diabetes Risk Prediction Tool for Primary Healthcare in Africa
Diabetes is often diagnosed too late in Africa, 
leading to complications and early deaths. This project aims to build a lightweight, ML-powered tool that predicts the risk of diabetes early using minimal, 
easily collected clinical data. The goal is to empower primary healthcare workers to triage patients more effectively.

Obtained the data from kaggle. Here is the [Pima Indians Diabetes Dataset](https://www.kaggle.com/datasets/mathchi/diabetes-data-set)
Features available:

Pregnancies

Glucose

Blood Pressure

Skin Thickness

Insulin

BMI

Diabetes Pedigree Function

Age

Outcome (0 = No Diabetes, 1 = Diabetes)

### Project Workflow
1. Checked for missing or zero values in glucose, insulin, BMI, BloodPressure, SkinThickness.These are values that can never be 0 in any human being.

2. Replaced 0s with NAs then replaced NAs further with median values.

3. Peformed Exploratory data Analysis on Outcome the see the distribution of diabetes and No Diabetes Cases.

4. Used correlation matrix to identify key features.To find out if there was multicollenearity among any of the indipendent variables.
   
5. Visualized  feature distributions  boxplots of Outcome with Glucose and BMI.Very important factors to consider while diagnozing someone for diabetes.

### Model Building (Logistic Regression)
Splited the data into two. Training set for training the Model and Testing Set for testing the Model build.
After building the model found that some variables like BloodPressure,SkinThickness,Insulin and Age are not significant predictors of Diabetes.
Fine tunned the model further by removing the insignificant variables.

### Key Metrics of the Model
1. Accuracy	76.86% implyng that :The model correctly predicts about 77 out of every 100 patients.
2. Precision	61.80%	implying that Of all patients predicted to have diabetes, approximately 62% actually do — avoids false alarms.
3. Recall (Sensitivity)	68.75%	The model catches nearly 7 out of 10 true diabetic cases — very important in healthcare.
4. F1 Score	0.651	Balance of  precision and recall — the  model is reliable and not biased.
5. AUC-ROC of 0.825 is strong implying that the model does an excellent job distinguishing between diabetic and non-diabetic patients.


# Diabetes Risk Prediction Web App

A simple, AI-powered Shiny web application that predicts the likelihood of diabetes based on key patient indicators using a logistic regression model trained on healthcare data.

Here is the [Application](https://washiemorey.shinyapps.io/sapp/)
##  Problem It Solves

In Africa and other underserved regions, access to affordable and quick medical diagnostics is a major challenge. This tool helps healthcare providers, especially in clinics and local health centers, quickly assess a patient's risk of developing diabetes using readily available health metrics — without needing complex lab tests or equipment.

##  Who It's For

- **Healthcare Providers** looking to triage or monitor patients more effectively.
- **Public Health Officers** aiming for scalable screening tools in underserved regions.
- **Students & Data Scientists** exploring  ML and AI solutions in healthcare.
- **Tech-for-Good Developers** seeking open, replicable tools that serve real-world needs.

##  How It Works

This app uses a **logistic regression model** trained on historical health data to predict the probability that a patient is at risk of diabetes. The model takes in the following inputs:

- Number of Pregnancies
- Glucose Level
- Body Mass Index (BMI)
- Diabetes Pedigree Function

Based on these, it outputs:
- Predicted Outcome 0 or 1
- Probability of Diabetes

##  Tech Stack

- **R**
- **Shiny**
- **Machine Learning (Logistic Regression)**
- **Healthcare Dataset (e.g. Pima Indians Diabetes Dataset)**
