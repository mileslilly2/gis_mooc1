setwd("Where you save your data")
getwd()

install.packages('ggplot2')
install.packages("lattice")
library(ggplot2)
library(lattice)
voting = read.csv("Income_Voting.csv")
head(voting)
plot(voting$MEDIAN_INC, voting$Percent_Yes)
plot(voting$Percent_Yes, voting$MEDIAN_INC)


#some Lattice plots
xyplot(Percent_Yes ~ MEDIAN_INC, voting)
xyplot(Percent_Yes ~ MEDIAN_INC, voting, grid = TRUE,  
       type = c("p", "r"), 
       col.line = "darkorange", lwd = 2, pch = 18, 
       main = "Median Income vs Percent Yes Vote Prop 37",
       xlab = "Percent Yes Vote",
       ylab = "Median Income",
       sub = "R^2= 0.1695112")

reg_model = lm(Percent_Yes ~ MEDIAN_INC, data=voting)
summary(reg_model)$r.squared 
