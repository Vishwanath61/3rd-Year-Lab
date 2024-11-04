#8.	Develop R code to perform outlier analysis using boxplot and Construct a histogram to interpret the car sales in a particular year and analyze the same.

library(dplyr)
library(ggplot2)

set.seed(123)
car_sales_data<-data.frame(
  Year=rep(2020:2022,each=100),
  Sales=c(rnorm(100,mean = 2000,sd= 300),
          rnorm(100,mean = 2500,sd= 500),
          rnorm(100,mean = 2200,sd= 400))
)

sales_year<-2022
yearly_sales<-car_sales_data %>% filter(Year==sales_year)

#Outlier Using Boxplot

ggplot(yearly_sales,aes(y=Sales))+
  geom_boxplot(fill="lightblue",color="darkblue")+
  labs(title=paste("Outlier Analysis of Car Data in Year",sales_year))+
  theme_minimal()

#Outlier Using Histogram

ggplot(yearly_sales,aes(x=Sales))+
  geom_histogram(binwidth = 100, fill="lightgreen", color="black")+
  labs(title = paste("Distribution of Car Sales in Year",sales_year),x="sales",y="frequency")+
  theme_minimal()
