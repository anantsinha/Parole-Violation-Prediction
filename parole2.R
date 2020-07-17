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


m1 <- glm(violator~., data = train, family = "binomial")
summary(m1)
prediction <- predict(m1, newdata = test, type = "response")
max(prediction)

# show confusion matrix
table(test$violator, prediction > 0.5)
# sensitivity - 0.5217
# specificity - 0.9329
# accuracy - 0.886

# baseline model
table(test$violator)
# accuracy of baseline modelis also 0.886