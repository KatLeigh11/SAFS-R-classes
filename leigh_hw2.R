# Name: Kat Leigh
# Homework 2

#==Question 1a ####
# Use one function to compute the mean temperature for inside and outside the retreat.

# read in data
beaver1 <- beaver1
# look at data
head(beaver1)
# get means
av_temps <- tapply(beaver1$temp, beaver1$activ, mean)

#==Question 1b ####
#Recreate the plot

beaver1k <- cbind(beaver1, rowz=row(beaver1)[,1])

plot(x=beaver1k$rowz, y=beaver1k$temp, 'l', xaxt='n', xlim = c(1,114), xlab = 'observation #', ylab = 'temperature', main = 'Beaver 1 body temperature')
axis(side = 1, at=c(1,seq(20,100, by=20), 114))
points(x=beaver1k$rowz[beaver1k$activ==1], y=beaver1k$temp[beaver1k$activ==1], col='green', pch=16)
lines(x=c(-3,beaver1k$rowz,120), y=rep(av_temps[1], 2+length(beaver1k$rowz)), lty= 5, col='darkgrey')
lines(x=c(-3,beaver1k$rowz,120), y=rep(av_temps[2], 2+length(beaver1k$rowz)), lty= 3, col='darkgrey')
legend(x='topleft', legend = c('inside mean temperature', 'outside mean temperature'), lty = c(3,5), bty = 'n', col='darkgrey')

#==Question 1c ####
# Create a new data frame that includes an additional observation with a temperature of 37.3 and activity outside the retreat at 22:20.

new_df_d <- append(beaver1$day, 346, after = which(beaver1$time==2210))
new_df_t <- append(beaver1$time, 2220, after = which(beaver1$time==2210))
new_df_temp <- append(beaver1$temp, 37.3, after = which(beaver1$time==2210))
new_df_a <- append(beaver1$activ, 0, after = which(beaver1$time==2210))

new_df <- as.data.frame(cbind(new_df_d, new_df_t, new_df_temp, new_df_a))
names(new_df) <- names(beaver1)
new_df

#==Question 1d ####
# How much did the mean temperature during periods of activity outside the retreat change? (i.e. compare beaver1 and your new data frame)

pcnt_chng <- round((mean(new_df$temp[new_df$activ==0])-mean(beaver1$temp[beaver1$activ==0]))/mean(beaver1$temp[beaver1$activ==0]) * 100,3)
pcnt_chng <-paste(pcnt_chng, '%')
pcnt_chng # 0.011 %

#==Question 2a ####
library(MASS)
?crabs
head(crabs)

# Use one function to compute the mean of frontal lobe size for blue and orange purple rock crabs.
av_flobe <- tapply(crabs$FL, crabs$sp, mean)

# Compute the standard deviation of frontal lobe size for blue and orange purple rock crabs.
sd_flobe <- tapply(crabs$FL, crabs$sp, sd)

#==Question 2b ####
# Run this line of code and explain what's going on:
spsex <- crabs$sp:crabs$sex # creating a new factor based on the combined values in the 'sp' and 'sex' columns in the data frame 'crabs', and then storing the corresponding values as a new factor vector called 'spsex'.

#==Question 2c ####
# Change the levels of spsex so that they are more informative. So B:F might be called 'Blue Female'.
levels(spsex) <- c('Blue Female', 'Blue Male', 'Orange Female', "Orange Male")

#==Question 2d ####
# Use one function to compute the mean of frontal lobe size for each sex and color combination of purple rock crab.
av_flobe_sc <- tapply(crabs$FL, spsex, mean)

#==Question 2e ####
# Use one function with the vector spsex to compute the total number of each sex and color combination of purple rock crab. Call this vector crab.counts. Hint: ?table.
crab.counts <- table(spsex)

#==Question 2f ####
# Create an informative plot using the crabs data with appropriate labeling. You may plot part of the data or all of the data, but you are required to create a multipanel plot with at least two dimensions using layout() or par(mfrow). Be creative!

par(mfrow=c(2,2))
plot(crabs$sex, crabs$FL,
     xlab= 'Sex', ylab= 'Frontal Lobe Size (mm)', main= 'Frontal Lobe by Sex')
mtext("Distribution of Frontal Lobe Sizes by Sex and Varietal for L.variegatus", side = 3, line = -1, outer = T)
plot(crabs$sp, crabs$FL,
     xlab= 'Varietal (Blue or Orange)', ylab= 'Frontal Lobe Size (mm)', main= 'Frontal Lobe Sizes by Varietal',
     col= c('lightblue', 'orange'))
