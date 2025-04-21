#7. Analyze sales trends over time using scatter plots and regression models. Fit linear and quadratic regression, compare their R-squared and RMSE values,
#and interpret results. Identify the best-fitting model and predict sales for the next 6 months (Months: 61-66) to assess future trends and decision-making insights.

library(ggplot2)

#1. Dataset Loading

# Dataset given
sd <- read.csv("sales_data.csv")
sales_data <- sd
head(sales_data)

# Dataset not given
#set.seed(61)
#month <- 1:60
#sales <- 100 + 3 * month + rnorm(60, mean = 0, sd = 15)
#sales_data <- data.frame(Month = month, Sales = sales)
#head(sales_data)

#2. Scatter Plot
ggplot(sales_data, aes(x = Month, y = Sales)) +
  geom_point(color = "red")

#3. Fitting Linear Regression
linear_model <- lm(Sales ~ Month, data = sales_data)
summary(linear_model)

#4. Fitting Quadratic Regression
quadratic_model <- lm(Sales ~ Month + I(Month^2), data = sales_data)
summary(quadratic_model)

#5. Calculating R-squared and RMSE values
r_squared_lm <- summary(linear_model)$r.squared
r_squared_qm <- summary(quadratic_model)$r.squared
rmse_lm <- sqrt(mean(residuals(linear_model)^2))
rmse_qm <- sqrt(mean(residuals(quadratic_model)^2))

cat('Linear Model:', '\nR-Squared: ', r_squared_lm, '\nRMSE: ', rmse_lm, '\n')
cat('Quadratic Model:', '\nR-Squared: ', r_squared_qm, '\nRMSE: ', rmse_qm, '\n')

#6. Comparing Linear and Quadratic regression model
ggplot(sales_data, aes(x=Month, y=Sales)) +
  geom_point(size = 2) +
  geom_line(aes(y = predict(linear_model, sales_data)), colour = "green", linetype = "dashed", size = 1) +
  geom_line(aes(y = predict(quadratic_model, sales_data)), colour = "red", size = 1) +
  labs(title = "Linear vs Quadratic")

cat('R-squared measures how much of the variance in the dependent variable is explained by the model.', '\nHigher is better.', '\n')
cat('RMSE measures the average prediction error (how far off the predictions are).', '\nLower is better.', '\n')

#7. Predicting
future_months <- data.frame(Month = 61:66)
predicted_lm <- predict(linear_model, future_months)
predicted_qm <- predict(quadratic_model, future_months)

result <- data.frame(Month = 61:66, Sales = predicted_qm)
print(result)

combined <- rbind(sales_data[, c("Month", "Sales")], result)
rownames(combined) <- NULL
print(combined)
