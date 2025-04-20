#10. A real estate company aims to predict house prices based on factors such as square footage, number of bedrooms, and location. 
#Formulate the problem as a multiple linear regression equation and express it in matrix form. Using the normal equation, calculate the regression coefficients to fit the model.
#Discuss how multicollinearity among predictor variables affects the reliability of the regression model and 
#explain how Principal Component Regression (PCR) can be used to address multicollinearity issues while improving predictive accuracy.

library(pls)
library(ggplot2)
library(scales)

#1. Sample Dataset
re <- read.csv("real_estate_prices.csv")
data <- re
head(data)

#2. Expressing in matrix form
x <- as.matrix(cbind(Intercept = 1, data$Square_Feet, data$Bedrooms, data$Location_Score))
y <- as.matrix(data$House_Price)

#3. Normal Equation
beta <- solve(t(x) %*% x) %*% t(x) %*% y

cat("Coeficients from Normal Equation:\n")
print(beta)

#4. Interpretations
cat("Intercept: ", beta[1], "\n")
cat("Per square foot adds about: ", beta[2], "\n")
cat("Each extra bedroom adds: ", beta[3], "\n")
cat("Effect of location score: ", beta[4], "\n")

#5. PCR
pcr_model <- pcr(House_Price ~ Square_Feet + Bedrooms + Location_Score, data = data, scale = TRUE, validation = "CV")
summary(pcr_model)
pred <- predict(pcr_model, ncomp = 2)
data$Predicted_PCR <- as.vector(pred)
cat("\nPCR Predictions:\n")
print(pred)

#6. Visualization
plot(pcr_model, ncomp = 3, asp = 1, line = TRUE)

ggplot(data, aes(x = House_Price, y = Predicted_PCR)) +
  geom_point(color = "darkgreen") +
  geom_abline(slope = 1, intercept = 0, color = "red") +
  scale_x_continuous(labels = label_comma())
