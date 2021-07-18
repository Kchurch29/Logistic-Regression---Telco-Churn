# Logistic Regression

<B>Logistic Regression with Telecommunications Data<B>

---
  
# <B>Table of Contents<B>
  
 1. [Introduction](https://github.com/Kchurch29/Logistic-Regression---Telecommunications-Churn#introduction)
 3. [Data](https://github.com/Kchurch29/Logistic-Regression---Telecommunications-Churn/blob/main/README.md#data)
 2. [Data Preparation](https://github.com/Kchurch29/Logistic-Regression---Telecommunications-Churn/blob/main/README.md#data-preparation)
 3. [Visualizations](https://github.com/Kchurch29/Logistic-Regression---Telecommunications-Churn#visualization)
 4. [Feature Selection](https://github.com/Kchurch29/Logistic-Regression---Telecommunications-Churn/blob/main/README.md#feature-selection)
 5. [Model Creation](https://github.com/Kchurch29/Logistic-Regression---Telecommunications-Churn#model-creation)
 6. [Summary and Results](https://github.com/Kchurch29/Logistic-Regression---Telecommunications-Churn#summary-and-results)
 7. [Conclusion](
  
---
  
# <B>Introduction<B>
  
&ensp; Companies who lose customers obviously lose the money that comes with the customers. When a customer leaves a company, it is called churning. By doing a churn analysis the company can predict what factors are involved and use them to reduce churn.  The goal of this project is to use the telecommunication data and logistic regression to show the most valuable variables and predict whether a customer will churn or not. 
 
  
---
  
# <B>Data<B>
---
  
* CaseOrder - Integer 
* Customer_id - Character
* Interaction - Character
* UID - Character
* City - Character
* State - Character
* County - Character
* Zip - Integer
* Lat - Numeric
* Lng - Numeric
* Population - Integer
* Area - Character
* TimeZone - Character
* Job - Character
* Children - Integer
* Age - Integer
* Income - Number
* Marital - Character
* Gender - Character
* Churn - Character
* Outage_sec_perweek - Numeric
* Email - Integer
* Contacts - Integer
* Yearly_equip_failure - Integer
* Techie - Character
* Contract - Character
* Port_modem - Character
* Tablet - Character
* InternetService - Character
* Phone - Character
* Multiple - Character
* OnlineSecurity - Character
* OnlineBackup - Character
* DeviceProtection - Character
* TechSupport - Character
* StreamingTV - Character
* StreamingMovies - Character
* PaperlessBilling - Character
* PaymentMethod - Character
* Tenure - Numeric
* MonthlyCharge - Numeric
* Bandwidth_GB_Year - Numeric
* Item1 - Integer
* Item2 - Integer
* Item3 - Integer
* Item4 - Integer
* Item5 - Integer
* Item6 - Integer
* Item7 - Integer
* Item8 - Integer
  
# <B>Data Preparation<B>
  
&ensp; After the dataset is imported into R, the summary stats show there are no missing or invalid values. A new dataset is created with the variables to be used for analysis. The features in the new dataset that are in character format are changed to factors for analysis. 
&ensp; A correlation plot is created with the numeric variables to check for high correlations.
  
![Correlation Plot](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/corrplot.png)
  
&ensp; The variables "Bandwidth_GB_Year" and "Tenure" have a very high correlation. For this study, the variable "Bandwidth_GB_Year" will be dropped before further analysis.
  
  
---
  
# <B>Visualization<B>
  
&ensp; The following graphs show the univariate statistics of the variables:
  
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/univariate/1.%20pop_area_child_age.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/univariate/2.%20income_marital_gender_outage.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/univariate/3.%20email_contact_yearlyfail_techie.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/univariate/4.%20contract_portmodems_tablet_internetservice.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/univariate/5.%20phone_multiple_onlinesec_onlineback.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/univariate/6.%20deviceprotection_techsupport_streamingtvs_streamingmovies.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/univariate/7.%20paperlessbilling_paymentmethod_monthlycharges_bandgbyear.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/univariate/8.%20churn.png)
  
&ensp; The following graphs show the bivariate statistics of the variables with the response variable Churn:
  
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/bivariate/1.%20pop_area_children_age.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/bivariate/2.%20income_marital_gender_outage.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/bivariate/3.%20email_contacts_yearlyfailure_techie.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/bivariate/4.%20contract_portmodem_tablet_internetservice.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/bivariate/5.%20phone_multiple_onlinesecurity_onlinebackup.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/bivariate/6.%20deviceprotection_techsupport_streamingtv_streamingmovies.png)
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/bivariate/7.%20paperlessbilling_paymentmethod_monthlycharge_bandwidth.png)
  
---
  
# <B>Feature Selection<B>

&ensp; A table with the Variance Inflation Factor scores shows high collinearity between the two variables "StreamingMovies" and "MonthlyCharge". 
  
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/FirstVIFScores.png)
  
For the purposes of this study, the variable "MonthlyCharge" will be dropped.
A new VIF graphic shows there is no mulitcollinearity present.
  
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/SecondVIFScores.png)
  
&ensp;The Boruta Package in R picks the variables based on importance. It is an improvement of random forest, a very popular method for variable selection (Rasool, 2019). Using Boruta takes more time to run in R but will help modeling and computer resource usage in the long term. After the algorithm is run, the results are plotted as seen below:
  
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/borutathisplot.png)
  
The green variables in the plot clearly show what variables are the most important, and will be used in model creation.
  
Using the attStats command, a list of variables and scores can be produced, with a decision on whether or not the variable should be included for further analysis.
  
![](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn/blob/main/images/attStats.png)
  
---
  
# <B>Model Creation<B>
 
&ensp; Using the results of the Boruta algorithm, a model is created and the results are shown below:
  
![](https://github.com/Kchurch29/Logistic-Regression---Telecommunications-Churn/blob/main/images/model1.png)
  
---
  
# <B>Summary and Results<B>

A model created with features before using Boruta is created to compare with a model created using the most important features determined by the Boruta algorithm. A confusion matrix shows the results:
	
![](https://github.com/Kchurch29/Logistic-Regression---Telecommunications-Churn/blob/main/images/Conf_Matrix_All.png)
	
&ensp; The accuracy of the model is calculated with the following formula: (True Positives + True Negatives) / (True Positives + True Negatives + False Positives + False Negatives). Filling the information, the output is a rate of 0.9027.  The sensitivity is the proportion of actual positives which are correctly identified. The sensitivity for this model is 0.842.  The specificity is the proportion of negatives that are correctly predicted.  The specificity of the initial model is 0.922. 
	
&ensp; A model created with the features from Boruta is created and a confusion matrix shows the the results:

![](https://github.com/Kchurch29/Logistic-Regression---Telecommunications-Churn/blob/main/images/Conf_Matrix_Reduced.png)
	
This confusion matrix shows almost the same results with far fewer features.
	
---
	
# <B>Conclusion<B>
	
	
&ensp; The Techie coefficient tells us that if the customer is a Techie, they are more likely to churn. Customers with a one- or two-year contract are less likely to churn than customers with a month-to-month contract as shown with a negative coefficient.  Customers with Fiber Optic or No Internet Service are less likely to churn than customers with DSL. If have customer has Multiple services, Online Backup or Device Protection, they are more likely to churn given their coefficient is positive. Customer who streams TV and Movies have a high positive coefficient, showing they are more likely to churn than customers who do not have those options. For Tenure, the longer the customer is with the company, the less likely they are to leave since the coefficient is negative. Telecommunications customers have many options in the present time, the quality of service and content available could be a key factor in keeping or losing customers.
	The practical significance of the model is to determine what customers would churn given the options they subscribe too. Being able to predict the factors that cause a customer to churn, a company could put time and resources into meeting the needs most used by customers to reduce churn. 
	From the data collected and model created customers who have a longer Tenure are more likely to stay. To increase tenure, customers with short term month-to-month contracts should be focused on to get them on longer term contracts. Customers with DSL are more likely to churn as well. The quality of DSL service should be investigated further to see if changes in quality can be made. Customers who have streaming services are more likely to churn, and since many options are available to customers, this should be an area of focus.

  

