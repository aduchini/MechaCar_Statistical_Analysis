library(dplyr)
car_df <- read.csv("MechaCar_mpg.csv", check.names = F, stringsAsFactors = F)

# Perform linear regression considering mpg as the dependent variable
car_correlations <- lm(mpg ~ vehicle_length + vehicle_weight+ spoiler_angle + ground_clearance + AWD,data=car_df)
# determine the p-value and the r-squared value for the linear regression model
summary(car_correlations)

suspension_df <- read.csv("Suspension_Coil.csv", check.names = F, stringsAsFactors = F)

# get the mean, median, variance, and standard deviation of the suspension coil's PSI column
total_summary <- suspension_df %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
# group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil's PSI column
lot_summary <- suspension_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') 

#
t.test(suspension_df$PSI, mu=mean(suspension_df$PSI))
#
t.test(subset(suspension_df$PSI, suspension_df$Manufacturing_Lot == 'Lot1'), mu=mean(suspension_df$PSI))

t.test(subset(suspension_df$PSI, suspension_df$Manufacturing_Lot == 'Lot2'), mu=mean(suspension_df$PSI))

t.test(subset(suspension_df$PSI, suspension_df$Manufacturing_Lot == 'Lot3'), mu=mean(suspension_df$PSI))