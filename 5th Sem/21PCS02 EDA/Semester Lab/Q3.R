#3.	Perform Data Summary and Exploration of  Groceries dataset and Generate association rules from the Groceries dataset with a minimum support of 0.002 and a confidence of 0.5?

library(arules)

data("Groceries")
View(Groceries)
summary(Groceries)

inspect(Groceries[1:5])

num_transactions<-length(Groceries)
print(num_transactions)
num_items<-length(itemLabels(Groceries))
print(num_items)

#itemFrequencyPlot(Groceries,topN=10,type="relative",main="Top 10 Frequent Items")

rules<-apriori(Groceries, parameter = list(supp=0.002,conf=0.5))
summary(rules)
inspect(sort(rules,by = "lift")[1:5])
