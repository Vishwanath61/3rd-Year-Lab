#9. Analyze the Heart Disease dataset by exploring its structure, target variable, and missing values. Visualize correlations, split data, and train a Logistic Regression model. 
#Evaluate using accuracy, precision, recall, and F1-score. Apply PCA for dimensionality reduction and assess if performance improves for better heart disease prediction.

library(corrplot)
library(caret)

#1. Dataset Loading
heart_disease <- read.csv("heart.csv")
heart = heart_disease
head(heart)
str(heart)

#2. Missing Values
colSums(is.na(heart))

#3. Visualizing Correlations
cor_matrix <- cor(heart)
print(cor_matrix)
corrplot(cor_matrix, method = "color", addCoef.col = "black")

#4. Splitting data
set.seed(61)
data_split <- createDataPartition(heart$target, p = 0.8, list = FALSE)
train_data <- heart[data_split, ]
test_data <- heart[-data_split, ]

#5. Training Logistic Model
model <- glm(target ~ ., data = heart, family = "binomial")
summary(model)

#6. Model Evaluation
pred <- predict(model, test_data, type = "response")
pred_class <- ifelse(pred > 0.5, 1, 0)

conf_matrix <- confusionMatrix(as.factor(pred_class), as.factor(test_data$target))
print(conf_matrix)

#8. Applying PCA
pca <- prcomp(train_data[, -14], center = TRUE, scale. = TRUE)
summary(pca)
plot(pca)

#9. Training Logistic Regression on PCA
pca_train <- data.frame(pca$x[, 1:6], target = train_data$target)
pca_test <- predict(pca, test_data[, -14])
pca_test <- data.frame(pca_test[, 1:6], target = test_data$target)

pca_model <- glm(target ~ ., data = pca_train, family = "binomial")
pca_pred <- predict(pca_model, pca_test, type = "response")
pca_pred_class <- ifelse(pca_pred > 0.5, 1, 0)

conf_matrix_pca <- confusionMatrix(as.factor(pca_pred_class), as.factor(pca_test$target))
print(conf_matrix_pca)
