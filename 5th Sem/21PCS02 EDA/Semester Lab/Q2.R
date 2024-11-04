#2.Perform data preprocessing for the sales data.

sales<-read.csv("SalesData.csv")
head(sales)
#View(sales)
summary(sales)
str(sales)

calculate_mode<-function(x){
  x<-x[x!="Not Specified"]
  if(length(x)==0){
    return(NA)
  }
  else{
    ux<-unique(x)
    ux[which.max(tabulate(match(ux,x)))]
  }
}

calculate_NA<-function(x){
  x<-na.omit(x)
  if(length(x)==0){
    return(NA)
  }
  else{
    ux<-unique(x)
    ux[which.max(tabulate(match(ux,x)))]
  }
}

mode_op<-calculate_mode(sales$Order.Priority)
sales$Order.Priority[sales$Order.Priority=="Not Specified"]<-mode_op
sales$Order.Priority[is.na(sales$Order.Priority)]<-mode_op
#View(sales)
summary(sales)

library(ggplot2)

ggplot(sales,aes(x=Sales,y=Profit))+geom_point()+
            geom_smooth(method = "lm",se=TRUE,color="black")+
            ggtitle("Relation between Sales and Profit")

shapiro.test(sales$Sales)
shapiro.test(sales$Profit)

cor(sales$Sales,sales$Profit,use = "complete.obs")
cortest<-cor.test(sales$Sales,sales$Profit,method = "pearson")
cortest
