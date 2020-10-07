# Apriori

dataset <- read.csv('Market_Basket_Optimisation.csv', header = FALSE)

# Data Preprocessing
# Transfer Dataset into Sparse Martix
#install.packages('arules')
library(arules)
dataset <- read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE) #Removing Duplicates 
summary(dataset)
itemFrequencyPlot(dataset, topN = 100)

# Training Apriori on the dataset
# Support = item sold per day*days of week / Total transaction in a week = 3*7/7500
rules <- apriori(dataset, parameter = list(support = 0.003, confidence = 0.4)) 

# Visualize the Apriori Model
inspect(sort(rules, by = 'lift')[1:10])