# in class 10/25/2021

#==Question 1a ####
# Generate 1000 random variables from a Cauchy distribution with a location parameter 5 and scale parameter 1. Store these values in randomCauchy.
# What are the minimum and maximum values?  What is the mean value?
set.seed(100)
randomCauchy <- rcauchy(n=1000, location = 5, scale = 1)
min_max <- range(randomCauchy)
names(min_max) <- c('min','max')
min_max # min: -113.4176; max: 123.4277
meanz <- mean(randomCauchy)
meanz # 5.483589

#==Question 1b ####
# Create a sequence of numbers from 0.01 to 0.985 in increments of 0.025. Call this vector x.
x <- seq(.01,.985,by=.025)

#==Question 1c ####
# For each value in x, find the density, assuming a Beta distribution with shape parameters equal to 5 and 2 respectively. Name this vector betaDensity.
betaDensity <- dbeta(x, shape1 = 5, shape2 = 2)

#==Question 1d ####
# Renormalize the vector betaDensity by dividing every observation in the vector by the sum of all the observations. Call this new vector betaDensityNorm. The sum of all the observations should now be 1. Check this.
betaDensityNorm <- betaDensity/sum(betaDensity)
sum(betaDensityNorm) # equals 1

#==Question 1e ####
# Create a sequence of integers from 12 to 90 in increments of 2. Call this vector lengths.
lengths <- seq(12,90,by=2)

#==Question 1f ####
# The vectors betaDensityNorm, and lengths should all be of length 40 (check!). Create a random sample of 1000 lengths from the vector lengths with weighted probabilities for each length given by the vector betaDensityNorm. Call this vector lengthsSample.

length(betaDensityNorm) # = 40
length(lengths) # = 40
lengthsSample <- sample(x= lengths, size= 1000, prob = betaDensityNorm, replace = TRUE)

#==Question 1g ####
# Create a histogram from the vector lengthsSample. Add a density curve. Change the default plot to make your histogram “pretty” (This is subjective so you can add a title, color, . . . or anything that you feel this plot needs).

hist(lengthsSample, freq = FALSE,
     col='salmon', border = 'white')
lines(density(lengthsSample), col = 'black')

#==Question 2a ####
# Read in YERockfish.csv and call it Yelloweye.

Yelloweye <- read.csv('YERockfish.csv')

#==Question 2b ####
# Write a function called Length.Age.Mat() that takes at least (i.e, you may add more for plotting) three parameters (arguments): length, age, and maturity. The function will:

Length.Age.Mat <- function(length, age, maturity){
  Length_Means <- tapply(length, maturity, mean, na.rm=TRUE)
  Age_Means <- tapply(age, maturity, mean, na.rm=TRUE)  
  plotz <- plot(x=age, y=length, xlab='Age', ylab='Length', pch=16)
  abline(h=Length_Means['Immature'], col='grey')
  abline(h=Length_Means['Mature'], col='blue', lty=2)
  text(x=(max(age, na.rm = TRUE)-min(age, na.rm = TRUE))*.75, y=Length_Means['Immature']+2, labels = 'Immature')
  text(x=(max(age, na.rm = TRUE)-min(age, na.rm = TRUE))*.75, y=Length_Means['Mature']+2, labels = 'Mature')
  
  return(list(plotz, Length_Means, Age_Means))
}

Length.Age.Mat(Yelloweye$length, Yelloweye$age, Yelloweye$maturity)

##   plot the length (y-axis) at age (x-axis) data with proper labels

## calculate the mean length and mean age for each stage of maturity (Immature, Mature, and Unknown) and store them as vectors called Length_Means and Age_Means

## plot the Length_Means for Immature and Mature as horizonal lines (e.g., abline() function) on the length at age plot. Format the plot to match the plot provided below.

## return Length_Means and Age_Means as a list.

#==Question 2c ####
# Read in Cabezon.csv and call it Cabezon. Use Length.Age.Mat()to create a length at age plot and find the mean lengths and mean ages for Cabezon!

Cabezon <- read.csv('Cabezon.csv')

Length.Age.Mat(Cabezon$length, Cabezon$age, Cabezon$maturity)

#==Question 2d ####
# Create a multi-panel plot using Cabezon and Yelloweye’s length at age plots using layout() or par(mfrow).

par(mfrow=c(1,2))
Length.Age.Mat(Yelloweye$length, Yelloweye$age, Yelloweye$maturity)
Length.Age.Mat(Cabezon$length, Cabezon$age, Cabezon$maturity)