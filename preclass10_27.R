# pre-class 10/27

#### Distributions
help("Distributions")

# For every distribution there are four commands. The commands for each distribution are prepended with a letter to indicate the functionality:
 
# “d”	returns the height of the probability density function
# “p”	returns the cumulative density function
# “q”	returns the inverse cumulative density function (quantiles)
# “r”	returns randomly generated numbers

#### Normal Distributions
help("Normal")

# dnorm. Given a set of values it returns the height of the probability distribution at each point

# pnorm. Given a number or a list it computes the probability that a normally distributed random number will be less than that number. AKA CDF.
##  find the probability that a number is larger than the given number. use the lower.tail option.
pnorm(0,mean=2,lower.tail=FALSE)

# qnorm. give it a probability, and it returns the number whose cumulative distribution matches the probability.
## if mean=0, sd=1, then associated Z-score

# rnorm. generate random numbers whose distribution is normal.

#### T distributions
help("TDist")

# commands assume that the values are normalized to mean zero and standard deviation one, and must specifiy degrees of freedom.

# distribution function, dt
# CDF, pt
# inverse cumulative probability distribution function, qt
# random numbers generated according to the t distribution, rt

#### Binomail Distribution
help("Binomial")
# require the number of trials and the probability of success for a single trial.

# dbinom. distirbution function.
# pbinom. cumulative probability distribution function
# qbinom. inverse cumulative probability distribution function
# rbinom. randm numbers generated according to the binomial distribution

#### Chi-Squared Distribution
help("Chisquare")

# dchisq
# pchisq
# qchisq
# rchisq

# assumed that you have normalized the value so no mean can be specified. also have to specify the number of degrees of freedom. 

#### Set seed
# set.seed() function in R is used to reproduce results i.e.  it produces the same sample again and again

set.seed(123)
rnorm(5)

set.seed(321)
sample(LETTERS, 6)

# can use to get the same sample of items from within a dataframe
set.seed(123)
index <- sample(1:nrow(iris), 10) # 10 random rows
index
iris[index, ]

#### Sampling

set.seed(123)
sample(1:20, 10, replace=TRUE)

set.seed(123)
index<-sample(1:nrow(mtcars), 5) # no replacement
index
mtcars[index,]

library(dplyr)
mtcars %>% group_by(vs) %>% slice_sample(n = 2) # group by one of the columns, then take a sample that has 2 of the categories available in vs

#### Histograms
str(airquality)
Temperature <- airquality$Temp
hist(Temperature) # count the number of times each temperature bin appears
# use freq= FALSE to change the y-axis to density

# creates an object with 6 values:
# breaks-places where the breaks occur,
# counts-the number of observations falling in that cell,
# density-the density of cells, mids-the midpoints of cells,
# xname-the x argument name
# equidist-a logical value indicating if the breaks are equally spaced or not.

h <- hist(Temperature,ylim=c(0,40))
text(h$mids,h$counts,labels=h$counts, adj=c(0.5, -0.5))

# non-uniform widths
hist(Temperature,
     main="Maximum daily temperature at La Guardia Airport",
     xlab="Temperature in degrees Fahrenheit",
     xlim=c(50,100),
     col="chocolate",
     border="brown",
     breaks=c(55,60,70,75,80,100)
)

# can add normal curves

x <- mtcars$mpg
h<-hist(x, breaks=10, col="red", xlab="Miles Per Gallon",
        main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)

## Histograms can be a poor method for determining the shape of a distribution because it is so strongly affected by the number of bins used.

# Kernal Density instead

d <- density(mtcars$mpg) # returns the density data
plot(d)
d

# sm.density.compare( ) function in the sm package allows you to superimpose the kernal density plots of two or more groups. The format is sm.density.compare(x, factor) where x is a numeric vector and factor is the grouping variable.

# install.packages('sm')
library(sm)
attach(mtcars)

# create value labels
cyl.f <- factor(cyl, levels= c(4,6,8),
                labels = c("4 cylinder", "6 cylinder", "8 cylinder"))

# plot densities
sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
title(main="MPG Distribution by Car Cylinders")

# add legend via mouse click
colfill<-c(2:(2+length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill=colfill)

# https://www.statmethods.net/stats/index.html
# this resource is amazing!
# descriptive stats, freqs & crosstabs, correlations, ttests, nonparametric stats. mult regression, regression diagnostics, ANOVA/MANOVA, (M)ANOVA Assumptions, Resampling Stats, Power Analysis, Using with and By


