#5. Analyze outliers in the mtcars dataset using IQR and Z-score methods. Compute probabilities of selecting outlier cars based on mpg, hp, and wt.
#Explore conditional probabilities, independence, and expected outliers. Examine distribution shapes, skewness, correlations, 
#and compare different outlier detection methods to assess consistency and insights.

library(e1071)

#1. Dataset Loading
data("mtcars")
df = mtcars
head(df)
str(df)
summary(df)

#2. Detecting Outliers

#IQR
detect_iqr <- function(x) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR_val <- Q3 - Q1
  lower <- Q1 - 1.5 * IQR_val
  upper <- Q3 + 1.5 * IQR_val
  return(which(x < lower | x > upper))
}

#Z-Score
detect_z <- function(x, threshold = 3) {
  z <- scale(x)
  return(which(abs(z) > threshold))
}

#Applying IQR and Z-Score
cols <- df[c("mpg", "hp", "wt")]
outliers_iqr <- lapply(cols, detect_iqr)
print(outliers_iqr)
outliers_z <- lapply(cols, detect_z)
print(outliers_z)

#3. Probability of Selecting Outlier Cars
n <- nrow(df)
prob_iqr <- sapply(outliers_iqr, function(x) length(x)/n)
prob_z <- sapply(outliers_z, function(x) length(x)/n)

data.frame(Method = c("IQR", "Z-Score"),
           Mpg = c(prob_iqr["mpg"], prob_z["mpg"]),
           Hp = c(prob_iqr["hp"], prob_z["hp"]),
           Wt = c(prob_iqr["wt"], prob_z["wt"]))

#4. Conditional Probability
common_outliers <- intersect(outliers_iqr$mpg, outliers_iqr$wt)
cond_prob <- length(common_outliers) / length(outliers_iqr$wt)
print(cond_prob)

#5. Independence Check
p_mpg <- prob_iqr["mpg"]
p_hp <-  prob_iqr["hp"]
p_joint <- length(intersect(outliers_iqr$mpg, outliers_iqr$mpg)) / n

independent <- abs(p_joint - (p_mpg * p_hp)) < 0.05
print(independent)

#6. Distribution Shape & Skewness
apply(cols, 2, skewness)
hist(df$mpg, breaks = 10)

#7. Correlations & Patterns
cor_matrix <- cor(cols)
print(cor_matrix)

#8. Compare IQR vs Z-score
compare_outliers <- function(iqr_outlier, z_outlier) {
  iqr_only <- setdiff(iqr_outlier, z_outlier)
  z_only <- setdiff(z_outlier, iqr_outlier)
  both <- intersect(iqr_outlier, z_outlier)
  list(IQR_Only = iqr_only, Z_Only = z_only, Both = both)
}

comparison <- lapply(names(outliers_iqr), function(var) {
  compare_outliers(outliers_iqr[[var]], outliers_z[[var]])
})
names(comparison) <- c("mpg", "hp", "wt")
comparison

#9. Visualization
boxplot(df$wt)
points(rep(1, length(outliers_iqr$wt)), df$wt[outliers_iqr$wt], col = "red", pch = 19)
