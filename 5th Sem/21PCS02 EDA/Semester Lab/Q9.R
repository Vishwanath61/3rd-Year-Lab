#9.	Make use of logistic regression to model the probability of admission based on GPA, and what insights can be drawn from the model summary regarding the significance and strength of GPA as a predictor of admission likelihood?

library(ggplot2)

admission_data<-read.csv("admissions.csv")
head(admission_data)

model<-glm(admitted~gpa,data = admission_data, family = "binomial")
summary(model)

ggplot(admission_data,aes(y=gpa, x=admitted))+
  geom_jitter(width = 0.1, height = 0.02, alpha= 0.4)+
  labs(title = "GPA vs Admitted Rate")
