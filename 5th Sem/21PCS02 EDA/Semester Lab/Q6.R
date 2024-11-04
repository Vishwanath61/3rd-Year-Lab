#6.	Perform various statistical analysis for the mtcars dataset.

data("mtcars")
head(mtcars)

#Univariate

uni<-table(mtcars$cyl)
barplot(uni,xlab = "Number of Cylinders", ylab = "Frequency", main = "Distribution of Cylinders", col = "lightblue")
pie(uni,col = c("lightblue","lightpink","lightgreen"))
hist(mtcars$mpg)

#Bivariate

biv<-table(mtcars$cyl,mtcars$gear)
barplot(biv,xlab = "Number of Gears", ylab = "Number of Cylinders", main = "Cylinders vs. Gears", col = c("lightblue","lightpink","lightgreen"))

#Multivariate

pairs(mtcars[,c("mpg","hp","wt")],col= mtcars$cyl,pch=19, main = "Pair Plot of mpg, hp, wt")
