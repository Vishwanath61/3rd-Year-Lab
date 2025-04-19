#Load the Titanic dataset using read.csv(), explore it with str(), summary(), and head(). 
#Identify numerical/categorical variables and handle missing values by imputing with mean, median, or mode. 
#Convert categorical data into factors, scale numerical features, engineer new features, and save the preprocessed data using write.csv().

library(dplyr)

#1. Dataset Loading
data <- read.csv("titanic.csv")
titanic = data

#2. Dataset Exploration
str(titanic)
summary(titanic)
head(titanic)

#3. Handling Missing Values
colSums(is.na(titanic))

titanic$Age[is.na(titanic$Age)] <- median(titanic$Age, na.rm = TRUE)

mode_embarked <- names(sort(table(titanic$Embarked), decreasing = TRUE))[1]
titanic$Embarked[titanic$Embarked == ""] <- mode_embarked

titanic <- titanic %>% select(-Cabin)

head(titanic)

#4. Conversion of categorical data (Survived, Pclass, Sex, Embarked)
titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)

#5. Scaling numerical features
titanic$Age <- scale(titanic$Age)
titanic$Fare <- scale(titanic$Fare)

#6. Engineer new features
titanic$familySize <- titanic$SibSp + titanic$Parch + 1
titanic$isAlone <- ifelse(titanic$familySize == 0, 1, 0)
titanic$isAlone <- as.factor(titanic$isAlone)

#7. Saving the preprocessed data
write.csv(titanic, "titanic_preprocessed.csv", row.names = FALSE)
