#6. Perform correlation analysis on the mtcars dataset to evaluate relationships between mpg and other features using Pearson and Spearman methods.
#Identify key influencing variables and visualize insights using heatmaps, scatter plots, box plots, bar plots, and clustering dendrograms,
#ensuring a comprehensive understanding of mpg dependencies and trends.

library(corrplot)
library(ggplot2)
library(dplyr)

#1. Dataset Loading
data("mtcars")
df <- mtcars
head(df)
str(df)

#2. Correlation analysis
cor_pearson <- cor(df, method = "pearson")
print(cor_pearson)

cor_spearman <- cor(df, method = "spearman")
print(cor_spearman)

#3. Correlation with mpg
cor(df$mpg, df[, -1], method = "pearson")
cor(df$mpg, df[, -1], method = "spearman")

#4. Visualization

#Heatmap
corrplot(cor_pearson, method = "color", addCoef.col = "black")
corrplot(cor_spearman, method = "color", addCoef.col = "black")

#scatter plot
ggplot(df, aes(x = wt, y = mpg)) +
  geom_point()+
  geom_smooth(method = "lm")

ggplot(df, aes(x = hp, y = mpg)) +
  geom_point()+
  geom_smooth(method = "lm")

#Box plot
ggplot(df, aes(x = factor(cyl), y = mpg, fill = factor(cyl))) +
  geom_boxplot()

#Bar plot
df %>%
  group_by(gear) %>%
  summarise(mean_mpg = mean(mpg)) %>%
  ggplot(aes(x = factor(gear), y = mean_mpg, fill = factor(gear))) +
  geom_bar(stat = "identity")

#Clustering Dendrogram
dist_matrix <- dist(1 - abs(cor(df)))
hc <- hclust(dist_matrix, method = "complete")
plot(hc)
