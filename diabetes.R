#.....PRODUCED BY WASHINGTONE MOREY..........#
#....0N 14TH JUNE, 2025.........#
#.........DIABETES INFECTION PREDICTION .........#

#Loading necessary libraries in R
library(tidyverse)
library(caret)
library(ggplot2)
library(corrplot)
library(e1071)

# Importing data into R
data <- read.csv("C:\\Users\\hp\\OneDrive\\Desktop\\PDC\\diabetes.csv", header = T)

#Data Cleaning and pre-processing
# Counting zeros
sapply(data, function(x) sum(x == 0))

# Replacing zeros with NA for specific columns
data1 <- data %>%
  mutate(across(c(Glucose, BloodPressure, SkinThickness, Insulin, BMI),
                ~na_if(., 0)))
# Viewing missing values
colSums(is.na(data1))

# Imputing missing values with median
data1 <- data1 %>%
  mutate(across(everything(), ~ifelse(is.na(.), median(., na.rm = TRUE), .)))

#Exploratory Data Analysis (EDA) Class distribution
table(data1$Outcome)

#Correlation between Indipendent Variables
cor <- data1 %>% select(-Outcome) %>% cor
#Visualizing Correlation
corrplot(cor,addCoef.col = "black")
#....The is no strong correlation between the indipendent variables hence no multicollenearity

#Boxplots for key variables
ggplot(data1, aes(x = factor(Outcome), y = Glucose)) + 
  geom_boxplot(fill = "lightblue") + labs(title = "Glucose by Outcome")

ggplot(data1, aes(x = factor(Outcome), y = BMI)) + 
  geom_boxplot(fill = "pink") + labs(title = "BMI by Outcome")

#Splitting the data into testing and training sets
set.seed(123)
library(caTools)
split <- sample.split(data1,SplitRatio = 0.7)
training <- subset(data1,split == TRUE)
testing <- subset(data1,split == FALSE)

#Building model
model <- glm(Outcome~. , data = training,family = "binomial")
#Removing insignificant factors from the model
model_log <- glm(Outcome~. -BloodPressure-SkinThickness-Insulin-Age,data = training,
                 family = "binomial")
#Predicting Probabilities using the model 
predicted_probs <- predict(model_log,newdata = testing,type = "response")

#Finding predicted Outcome by the model either 0 0r 1
predicted_class <- ifelse(predicted_probs > 0.5,1,0)

#Dataframe of Actual and Predicted Outcome
table <- data.frame(Actual_Outcome = testing$Outcome,Predicted_Outcome = predicted_class)

#Creating confusion matrix
matrix <- confusionMatrix(as.factor(table$Actual_Outcome),as.factor(table$Predicted_Outcome),
                          positive = "1")


#Important Metrics from the model 
accuracy  <- matrix$overall["Accuracy"]
precision <- matrix$byClass["Pos Pred Value"]
recall    <- matrix$byClass["Sensitivity"]
f1_score  <- 2 * ((precision * recall) / (precision + recall))

cat("Accuracy: ", accuracy, "\n")
cat("Precision: ", precision, "\n")
cat("Recall (Sensitivity): ", recall, "\n")
cat("F1 Score: ", f1_score, "\n")


# Calculate AUC
library(pROC) 
roc_obj <- roc(as.factor(table$Actual_Outcome), predicted_probs)
auc_val <- auc(roc_obj)

cat("AUC-ROC: ", auc_val, "\n")

# Plot ROC curve
plot(roc_obj, main = "ROC Curve - Logistic Regression", col = "blue")
