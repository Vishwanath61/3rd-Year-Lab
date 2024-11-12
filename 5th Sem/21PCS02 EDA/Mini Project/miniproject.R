# Load required libraries
if (!require(dplyr)) install.packages("dplyr")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(caret)) install.packages("caret")
if (!require(rpart)) install.packages("rpart")
if (!require(rpart.plot)) install.packages("rpart.plot")

library(dplyr)
library(ggplot2)
library(caret)
library(rpart)
library(rpart.plot)

# Load the Titanic dataset
titanic_data <- read.csv("train.csv")

# Step 1: Data Cleaning
# Check the structure of the dataset
head(titanic_data)
summary(titanic_data)
str(titanic_data)

# Check for missing values
missing_values <- colSums(is.na(titanic_data))
print(missing_values)

# Impute missing Age values with the median
titanic_data$Age[is.na(titanic_data$Age)] <- median(titanic_data$Age, na.rm = TRUE)

# Drop the Cabin column due to excessive missing values
titanic_data <- titanic_data %>% select(-Cabin)

# Convert relevant columns to factors
titanic_data$Survived <- factor(titanic_data$Survived)
titanic_data$Pclass <- factor(titanic_data$Pclass)
titanic_data$Sex <- factor(titanic_data$Sex)

# Step 2: Exploratory Data Analysis (EDA)
# Summary statistics
summary(titanic_data)

# Visualize the distribution of survival rates
ggplot(titanic_data, aes(x = Survived)) +
  geom_bar(fill = "blue") +
  labs(title = "Survival Counts", x = "Survived", y = "Count")

# Visualize survival by gender
ggplot(titanic_data, aes(x = Sex, fill = Survived)) +
  geom_bar(position = "fill") +
  labs(title = "Survival by Gender", x = "Gender", y = "Proportion")

# Visualize survival by passenger class
ggplot(titanic_data, aes(x = Pclass, fill = Survived)) +
  geom_bar(position = "fill") +
  labs(title = "Survival by Passenger Class", x = "Passenger Class", y = "Proportion")

# Age distribution by survival
ggplot(titanic_data, aes(x = Age, fill = Survived)) +
  geom_density(alpha = 0.5) +
  labs(title = "Age Distribution by Survival Status", x = "Age", y = "Density")

# Step 3: Implement Algorithms
# Splitting the data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(titanic_data$Survived, p = .8, list = FALSE)
train_data <- titanic_data[trainIndex, ]
test_data <- titanic_data[-trainIndex, ]

# Decision Tree Model
dt_model <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare, data = train_data)
rpart.plot(dt_model, type = 3, extra = 101, main = "Decision Tree for Titanic Survival")

# Make predictions on the test set
dt_predictions <- predict(dt_model, test_data, type = "class")

# Performance Analysis for Decision Tree
conf_matrix_dt <- confusionMatrix(dt_predictions, test_data$Survived)
print(conf_matrix_dt)

# K-Means Clustering
# Select relevant features for clustering
cluster_data <- titanic_data %>% select(Age, Fare) %>% na.omit()

# Determine the optimal number of clusters using the Elbow Method
wss <- numeric(10)
for (i in 1:10) {
  kmeans_model <- kmeans(cluster_data, centers = i, nstart = 25)
  wss[i] <- kmeans_model$tot.withinss
}
plot(1:10, wss, type = "b", xlab = "Number of Clusters", ylab = "Within groups sum of squares", 
     main = "Elbow Method for Optimal Clusters")

# Applying K-Means with optimal clusters (e.g., k = 3)
set.seed(123)
optimal_clusters <- 3
kmeans_model <- kmeans(cluster_data, centers = optimal_clusters, nstart = 25)

# Add cluster information to the dataset
titanic_data$cluster <- as.factor(kmeans_model$cluster)

# Visualize the clusters
ggplot(titanic_data, aes(x = Age, y = Fare, color = cluster)) +
  geom_point(alpha = 0.5) +
  labs(title = "K-Means Clustering of Titanic Passengers", x = "Age", y = "Fare")

# Step 4: Summary of Findings
cat("Decision Tree Performance:\n")
cat("Accuracy:", conf_matrix_dt$overall['Accuracy'], "\n")
cat("Sensitivity:", conf_matrix_dt$byClass['Sensitivity'], "\n")
cat("Specificity:", conf_matrix_dt$byClass['Specificity'], "\n")

cat("K-Means Clustering Summary:\n")
cat("Optimal number of clusters determined by Elbow method is:", optimal_clusters, "\n")

# Performance comparison between the models
cat("Summary of key findings from EDA and algorithms:\n")
cat("- Decision Trees provide a clear interpretation of factors affecting survival rates.\n")
cat("- K-Means Clustering helps in identifying distinct groups among passengers based on age and fare.\n")
cat("- The decision tree accuracy can guide model selection for further analysis.\n")
