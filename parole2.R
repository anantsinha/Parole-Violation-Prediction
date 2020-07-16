# Predict parole violator and generator AUC curve
setwd("~/Developer/Analytics Edge/Week 3 Logistic Regression/Parole")
# Explore data
parole <- read.csv("parole.csv")
str(parole)
nrow(subset(parole, violator ==1))
summary(parole)
head(parole)