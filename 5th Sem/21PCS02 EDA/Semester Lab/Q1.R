#1.	Perform one sample and two sample hypothesis testing using uptake and treatment for the CO2 dataset.

co2_data<-read.csv("CO2.csv")
str(co2_data)
head(co2_data)

hypotenuse_mean<-20
one_sample_test<-t.test(co2_data$uptake,mu=hypotenuse_mean)
print(one_sample_test)

uptake_chilled<-co2_data$uptake[co2_data$Treatment=="chilled"]
uptake_nonchilled<-co2_data$uptake[co2_data$Treatment=="nonchilled"]
two_sample_test<-t.test(uptake_chilled,uptake_nonchilled,var.equal=TRUE)
print(two_sample_test)

# Boxplot to compare uptake between treatments
ggplot(co2_data, aes(x = Treatment, y = uptake, fill = Treatment)) +
  geom_boxplot() +
  labs(title = "CO2 Uptake by Treatment Type", x = "Treatment", y = "Uptake") +
  theme_minimal()
