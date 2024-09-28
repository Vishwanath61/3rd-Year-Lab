#Question 8
#Data preparation
#Number of Records: 100 students.
#Fields and Values:
#Gender: Randomly assign "Male" or "Female".
#Study Hours Per Week: Generate values following a normal distribution with a mean of 10 hours and a standard deviation of 2 hours. Ensure all values are at least 5 hours.
#Math Score: Generate integer scores based on a normal distribution with a mean of 75 and a standard deviation of 10. Ensure scores are between 0 and 100.
#English Score: Generate integer scores based on a normal distribution with a mean of 70 and a standard deviation of 12. Ensure scores are between 0 and 100.
#Science Score: Generate integer scores based on a normal distribution with a mean of 72 and a standard deviation of 11. Ensure scores are between 0 and 100.
#Using R, perform the following tasks:


#Step 1: Data Preparation

set.seed(123)
n<-100
gender<-sample(c("Male","Female"),n,replace = TRUE)
study_hours<-pmax(round(rnorm(n,mean = 10,sd=2)),5)
math_scores<-pmax(pmin(round(rnorm(n,mean = 75,sd=10)),100),0)
english_scores<-pmax(pmin(round(rnorm(n,mean = 70,sd=12)),100),0)
science_scores<-pmax(pmin(round(rnorm(n,mean = 72,sd=11)),100),0)

student<-data.frame(
  Gender = gender,
  Study = study_hours,
  Maths = math_scores,
  Eng = english_scores,
  Sci = science_scores
)

head(student)

#Step 2: Univariate Analysis

#Generate summary statistics for each variable (e.g., mean, median, quartiles).
summary(student)

#Create histograms to explore the distribution of the study hours and exam scores.
hist(student$Study,main = "Study Hours per Week",xlab = "Hours",col = "lightblue")
hist(student$Maths,main = "Math Scores",xlab = "Math",col = "lightgreen")
hist(student$Eng,main = "English Scores",xlab = "Eng",col = "lightpink")
hist(student$Sci,main = "Science Scores",xlab = "Sci",col = "lightyellow")

#Provide boxplots to detect any potential outliers in the exam scores.
boxplot(student$Maths,main = "Maths Score",col = "lightblue")
boxplot(student$Eng,main = "English Score",col = "lightblue")
boxplot(student$Sci,main = "Science Score",col = "lightblue")

#Step 3: Bivariate Analysis

#Create scatter plots to examine the relationship between study hours and math scores, English scores, and science scores, respectively.
plot(student$Study,student$Maths,main = "Study Hours VS Maths Score",xlab = "Study Hours",ylab = "Maths Score",col = "blue",pch=19)
plot(student$Study,student$Eng,main = "Study Hours VS English Score",xlab = "Study Hours",ylab = "English Score",col = "red",pch=19)
plot(student$Study,student$Sci,main = "Study Hours VS Science Score",xlab = "Study Hours",ylab = "Science Score",col = "green",pch=19)

#Compute the correlation between study hours and each of the exam scores.
cor(student$Study,student$Maths)
cor(student$Study,student$Eng)
cor(student$Study,student$Sci)

#Create boxplots to visualize differences in Math, English, and Science scores based on gender.
boxplot(Maths~Gender,data = student,main = "Maths Scored based on Gender",col = c("lightblue", "lightgreen"))
boxplot(Eng~Gender,data = student,main = "English Scored based on Gender",col = c("lightblue", "lightgreen"))
boxplot(Sci~Gender,data = student,main = "Science Scored based on Gender",col = c("lightblue", "lightgreen"))

#Step 4: Multivariate Analysis

#Perform a multiple linear regression to predict Math scores using study hours, gender, English scores, and science scores as predictors.
model<-lm(Maths~Study+Gender+Eng+Sci,data = student)
print(model)

#Interpret the significance of each predictor and provide insights from the model.
summary(model)

#Visualize the correlation matrix for study hours and the three exam scores.
cor_matrix<-cor(student[,c("Study", "Maths", "Eng", "Sci")])
print(cor_matrix)
library(corrplot)
corrplot(cor_matrix,method = "color",addCoef.col = "black")
