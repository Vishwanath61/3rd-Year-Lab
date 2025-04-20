#3. Load a mtcars dataset, identify numerical and categorical variables, and visualize distributions using box plots, histograms, and violin plots. 
#Use scatter plots with trend lines to analyze relationships. Create facets, bar plots, and heatmaps to explore patterns and correlations. 
#Provide insights on distributions, outliers, and variable relationships.

library(ggplot2)
library(corrplot)

#1. Dataset Loading
data("mtcars")
df <- mtcars
head(df)

#2. Conversion
cat_cols <- c("cyl", "vs", "am", "gear", "carb")
df[cat_cols] <- lapply(df[cat_cols], as.factor)

num_cols <- c("mpg", "disp", "hp", "drat", "wt", "qsec")
df[num_cols] <- lapply(df[num_cols], as.numeric)

#3. Visualization

#Box Plot
ggplot(df, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot()

#Histogram
hist(df$hp, breaks = 10)

#Violin Plot
ggplot(df, aes(x = am, y = wt, fill = am)) +
  geom_violin()

#Scatter Plot
ggplot(df, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

#Faceting
ggplot(df, aes(x = hp, y = mpg)) +
  geom_point() +
  facet_wrap(~gear)

#Bar Plot
ggplot(df, aes(x = cyl, fill = cyl)) +
  geom_bar()

#Correlation Heatmap
cor_matrix <- cor(df[num_cols])
print(cor_matrix)
corrplot(cor_matrix, method = "color", addCoef.col = "black")
