#4.	Develop a Decision Tree model using R to classify iris species based on sepal and petal measurements. The task involves preprocessing the Iris dataset, selecting relevant features, and building a Decision Tree to differentiate between Setosa, Versicolor, and Virginica. The model's decision tree will be plotted for analysis

iris_data<-read.csv("Iris.csv")
head(iris_data)

sample_data<-sample(1:nrow(iris_data),0.7*nrow(iris_data))

train_data<-iris_data[sample_data,]
test_data<-iris_data[-sample_data,]

library(rpart)

model<-rpart(data = train_data,Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,
             method = "class")

library(rpart.plot)

rpart.plot(model,main="Decision tree")

prediction<-predict(model,test_data,type="class")
confusion_matrix<-table(test_data$Species,prediction)
print(confusion_matrix)

accuracy<-sum(diag(confusion_matrix))/sum(confusion_matrix)
print(accuracy*100)
