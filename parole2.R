# Predict parole violator and generator AUC curve
setwd("~/Developer/Analytics Edge/Week 3 Logistic Regression/Parole")
# Explore data
parole <- read.csv("parole.csv")
str(parole)
nrow(subset(parole, violator ==1))
summary(parole)
head(parole)

# convert state and crime to factors
parole$state <- as.factor(parole$state)
parole$crime <- as.factor(parole$crime)
summary(parole$state)

# split data to testing and training sets
set.seed(144)
library(caTools)
split <- sample.split(parole$violator, SplitRatio = 0.7)
train <- subset(parole, split == TRUE)
test <- subset(parole, split == FALSE)