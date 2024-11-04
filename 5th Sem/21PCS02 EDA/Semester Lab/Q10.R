#10.	Perform trend analysis for the given sales data.

library(dplyr)
library(zoo)
library(ggplot2)

sales_data<-read.csv("SalesData.csv")
#View(sales_data)
head(sales_data)

sales_data$Order.Date<-as.Date(sales_data$Order.Date,format = "%m/%d/%Y")
head(sales_data)

daily_sales<-sales_data %>%
  group_by(Order.Date) %>%
  summarise(Daily.Sales=sum(Sales,na.rm = TRUE)) %>%
  arrange(Order.Date)

daily_sales<-daily_sales %>%
  mutate(Moving_Average = rollmean(Daily.Sales,k=7,fill=NA,align = "right"))

model<-lm(Daily.Sales~Order.Date, data = daily_sales)
daily_sales$Trend<-predict(model)

ggplot(daily_sales, aes(x=Order.Date))+
  geom_line(aes(y=Daily.Sales),color= "lightgreen")+
  geom_line(aes(y=Trend),color= "lightpink", linetype= "dashed")+
  geom_line(aes(y=Moving_Average),color= "lightblue")+
  theme_minimal()
  
