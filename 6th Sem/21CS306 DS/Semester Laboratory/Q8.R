#8. A medical researcher is studying the relationship between various blood test parameters, such as glucose levels, cholesterol, and blood pressure,
#to identify potential risk factors for diabetes. Compute the Pearson and Spearman correlation coefficients for a given dataset and analyze the relationships between variables. 
#Explain how correlation matrices assist in feature selection and why highly correlated features might lead to redundancy in predictive models. 
#Using linear algebra, describe how the correlation matrix can be decomposed using eigenvalues and eigenvectors to understand the data structure.

library(ggplot2)

#1. Sample Dataset
set.seed(61)
n <- 100
glucose = rnorm(n, mean = 100, sd = 15)
chol = glucose * 0.5 + rnorm(n, mean = 150, sd = 20)
bp = rnorm(n, mean = 80, sd = 10)
df <- data.frame(
  Glucose = glucose,
  Cholestrol = chol,
  BP = bp
)
head(df)

#2. Correlation 
cat("Pearson Correlation:\n")
cor_pearson <- cor(df, method = "pearson")
print(cor_pearson)

cat("Spearman Correlation:\n")
cor_spearman <- cor(df, method = "spearman")
print(cor_spearman)

#3. Correlation Visualization
corrplot(cor_pearson, method = "color", addCoef.col = "black")
corrplot(cor_spearman, method = "number", addCoef.col = "black")

#4. Eigen Decomposition
eig <- eigen(cor_pearson)
cat("Eigen Values:\n")
print(eig$values)
cat("Eigen Vectors:\n")
print(eig$vectors)

#5. Visualization
scree_data <- data.frame(Component = 1:length(eig$values), Eigenvalue = eig$values)

ggplot(scree_data, aes(x = Component, y = Eigenvalue)) +
  geom_line() +
  geom_point(size = 2, color = "red")
