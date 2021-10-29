# in class 10/25/2021

# a) Read in YERockfish.csv and call it Yelloweye.

Yelloweye <- read.csv('YERockfish.csv')

# b) Write a function called Length.Age.Mat() that takes at least (i.e, you may add more for plotting) three parameters (arguments): length, age, and maturity. The function will:

Length.Age.Mat <- function(length, age, maturity){
  Length_Means <- tapply(length, maturity, mean)
  Age_Means <- tapply(age, maturity, mean)  
  plotz <- plot(x=age, y=length, xlab='Age', ylab='Length', pch=16)
  abline(h=Length_Means['Immature'], col='grey')
  abline(h=Length_Means['Mature'], col='blue', lty=2)
  text(x=(max(age)-min(age))*.6666, y=Length_Means['Immature']+2, labels = 'Immature')
  text(x=(max(age)-min(age))*.6666, y=Length_Means['Mature']+2, labels = 'Mature')
  
  return(list(plotz, Length_Means, Age_Means))
}

Length.Age.Mat(Yelloweye$length, Yelloweye$age, Yelloweye$maturity)

##   plot the length (y-axis) at age (x-axis) data with proper labels
## HINT!: In part c) you will reuse this function for a different species that has a different range of length and ages. This will cause issues with your xlim and ylim specifications. Think of a way to make setting the limits of your plot generalizable.

## calculate the mean length and mean age for each stage of maturity (Immature, Mature, and Unknown) and store them as vectors called Length_Means and Age_Means

## plot the Length_Means for Immature and Mature as horizonal lines (e.g., abline() function) on the length at age plot. Format the plot to match the plot provided below.

## return Length_Means and Age_Means as a list.

# c) Read in Cabezon.csv and call it Cabezon. Use Length.Age.Mat()to create a length at age plot and find the mean lengths and mean ages for Cabezon!

Cabezon <- read.csv('Cabezon.csv')

Length.Age.Mat(Cabezon$length, Cabezon$age, Cabezon$maturity)

#   d) Create a multi-panel plot using Cabezon and Yelloweye’s length at age plots using layout() or par(mfrow).