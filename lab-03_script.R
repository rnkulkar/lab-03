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

elmhurst <- elmhurst %>%
  mutate(resid = residuals(model))

ggplot(data=elmhurst, aes(x=family_income, y=resid) ) + geom_point() + 
  xlab('Family Income in thousands') + ylab('Residuals') + 
  ggtitle("Residuals of LR on Family Income and Gift Aid")

hist(elmhurst$resid)
