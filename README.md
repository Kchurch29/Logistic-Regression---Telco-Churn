# Logistic Regression

<B>Logistic Regression with Telecommunications Data<B>

---
  
# <B>Table of Contents<B>
  
 1. [Introduction](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn#introduction)
 3. [Data](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn#data)
 2. [Data Preparation](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn#data-preparation)
 3. [Visualizations](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn#visualization)
 4. [Feature Selection](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn#feature-selection)
 5. [Model Creation](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn#model-creation)
 6. [Summary and Results](https://github.com/Kchurch29/Logistic-Regression---Telco-Churn#summary-and-results)
  
---
  
# <B>Introduction<B>
  
&ensp; Companies who lose customers obviously lose the money that comes with the customers. When a customer leaves a company, it is called churning. By doing a churn analysis the company can predict what factors are involved and use them to reduce churn (Martin, 2020).  The goal of this project is to use the telecommunication data and logistic regression to show the most valuable variables and predict whether a customer will churn or not. 
 
  
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
  
![]
---
  
# <B>Model Creation<B>
  
---
  
# <B>Summary and Results<B>
  

