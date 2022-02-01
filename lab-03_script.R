library(tidyverse)
library(knitr)
library(broom)
library(modelr)
library(openintro)

data(elmhurst)

hist(elmhurst$gift_aid)

summary(elmhurst$gift_aid)

hist(elmhurst$family_income)

summary(elmhurst$family_income)

ggplot(data=elmhurst, aes(x=family_income, y=gift_aid) ) + geom_point() + 
  xlab('Family Income in thousands') + ylab('Gift Aid in thousands') + 
  ggtitle("Gift Aid by Family Income")

model <- lm(gift_aid ~ family_income, data = elmhurst)
tidy(model) %>%
  kable(digits = 3)
