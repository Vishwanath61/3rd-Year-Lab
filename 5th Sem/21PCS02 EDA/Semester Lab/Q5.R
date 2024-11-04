#5.	Develop K-Means clustering using R to group iris flowers based on sepal and petal measurements. The task involves preprocessing the Iris dataset, selecting relevant features, and applying K-Means clustering to identify natural groupings. The resulting clusters will be analyzed and visualized to understand species differentiation.

library(ggplot2)
library(cluster)

iris_data<-read.csv("Iris.csv")
head(iris_data)

iris_features<-iris_data[,c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")]

kmean_cluster<-kmeans(iris_features,centers = 3)

set.seed(123)

print(kmean_cluster)

iris_data$Cluster<-as.factor(kmean_cluster$cluster)
ggplot(iris_data,aes(x= Sepal.Length, y= Sepal.Width, colour = Species, shape = Cluster))+geom_point()+
  ggtitle("Clustering Using Sepal Length and Sepal Width")
ggplot(iris_data,aes(x= Petal.Length, y= Petal.Width, colour = Species, shape = Cluster))+geom_point()+
  ggtitle("Clustering Using Petal Length and Petal Width")
