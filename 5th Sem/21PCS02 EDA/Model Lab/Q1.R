#Question 1
#Given the following data for Age, Diastolic pressure, and Systolic pressure:
# Age: 35, 65, 49, 30, 20, 40, 90, 54, 78, 45
# Systolic pressure: 122, 120, 120, 115, 130, 131, 118, 122, 120, 115
# Diastolic pressure: 83, 79, 78, 72, 90, 90, 82, 80, 82, 75

#1. Create vectors for Age, Diastolic pressure, and Systolic pressure.

age<-c(35, 65, 49, 30, 20, 40, 90, 54, 78, 45)
sp<-c(122, 120, 120, 115, 130, 131, 118, 122, 120, 115)
dp<-c(83, 79, 78, 72, 90, 90, 82, 80, 82, 75)

#2. Calculate the following statistics for each variable: Number of samples, Minimum value, Maximum value, Median, Mean, Variance, Standard deviation
calculate_stats<-function(x){
  stats<-data.frame(
    len=length(x),
    mini=min(x),
    maxi=max(x),
    med=median(x),
    mn=mean(x),
    variance=var(x),
    std=sd(x)
  )
  return(stats)
}

age_stats<-calculate_stats(age)
sp_stats<-calculate_stats(sp)
dp_stats<-calculate_stats(dp)


#3.Present the results in a table format.
result<-rbind(Age=age_stats,Systolic_pressure=sp_stats,Diastolic_pressure=dp_stats)
print(result)
