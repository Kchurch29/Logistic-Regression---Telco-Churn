#install libraries

library(caret)
library(ggcorrplot)
library(ggplot2)
library(car)
library(gridExtra)
library(Boruta)
library(corrplot)

#import data set
churn_clean <- read.csv("C:/Users/HP/Desktop/D208 Multiple Regression/churn_clean.csv")

#create data set with continuous variables to check for correlation
numeric <- churn_clean[,c(11,15:17,21:24,40:42)]

#check correlations
cor <- cor(numeric, method="s")

#plot correlations
corrplot(cor, method="number",type="upper")

#create data set with all variables minus Bandwidth_GB_Year
data <- churn_clean[,c(11,12,15:41)]

#change character variables to factors
data[sapply(data, is.character)] <- lapply(data[sapply(data, is.character)], as.factor)

#create seed to be able to reproduce results
set.seed(980)

#create partition
index <- createDataPartition(data$Churn, p=.70, list=FALSE)

#create training set
train <- data[index,]

#create test set
test <- data[-index,]

#create full model
model1 <- glm(Churn ~ Population + Area + Children + Age + Income + 
                Marital + Gender + Outage_sec_perweek + Email + Contacts + Yearly_equip_failure + 
                Techie + Contract + Port_modem + Tablet + InternetService + Phone + Multiple + OnlineSecurity + OnlineBackup + DeviceProtection + TechSupport + StreamingTV + StreamingMovies + PaperlessBilling + PaymentMethod + Tenure + 
                MonthlyCharge, data=train, family=binomial)

#summary of first model
summary(model1)

#check Variance Inflation Factor
vif(model1)

#model 2 created without MonthlyCharge
model2 <- glm(Churn ~ Population + Area + Children + Age + Income + Marital + Gender + Outage_sec_perweek + Email + Contacts + Yearly_equip_failure + Techie + 
                Contract + Port_modem + Tablet + InternetService + Phone + Multiple + OnlineSecurity + 
                OnlineBackup + DeviceProtection + TechSupport + StreamingTV + StreamingMovies + PaperlessBilling + 
                PaymentMethod + Tenure, data=train, family=binomial)

#check VIF of model 2
vif(model2)

#run Boruta to get most relevant variables
boruta <- Boruta(Churn ~ .-MonthlyCharge,data=train, doTrace = 2, maxRuns = 250)

#plot results of Boruta
plot(boruta, las=2, xlab="", cex.axis=0.7)

#get stats of Boruta to see most relevant variables
attStats(boruta)

#create new reduced model with confirmed variables
reduced_model <- glm(Churn ~ Techie + Contract + InternetService + Multiple + OnlineBackup + DeviceProtection + StreamingMovies + 
                       StreamingTV + PaymentMethod + Tenure, data=train, family = binomial)

#summary of reduced model
summary(reduced_model)

#comparing original model to reduced

#predicted values of original model
predicted <- predict(model2, test, type = "response")

#confusion matrix of original model predicted values
confmatrix <- table(Actual=test$Churn, Predicted = predicted > 0.5)

confmatrix

#find accuracy of original model
accuracy <- (619 + 2089) / (2089+176+116+619)
accuracy

#find specificity of original model (true negative rate)
specificity <- 2089 / (2089+176)
specificity

#find sensitivity for original model (true positive rate)
sensitivity <- 619/(619+116)
sensitivity

#create confusion matrix for reduced model
reduced_predicted <- predict(reduced_model, test, type = "response")

#confustiuon matrix for reduced model
reduced_confmatrix <- table(Actual=test$Churn, Predicted = reduced_predicted > 0.5)
reduced_confmatrix

#accuracy for reduced model
reduced_accuracy <- (626 + 2094) / (2094+169+111+626)
reduced_accuracy

#sensitivity for reduced model
reduced_sensitivity <- 626/(626+111)
reduced_sensitivity

#specificity for reduced model
reduced_specificity <- 2094 / (2094+169)
reduced_specificity

#checking actual vs predicted
test$predictedChurn <- predict(reduced_model, test, type = "response")
test[,c("Churn", "predictedChurn")]