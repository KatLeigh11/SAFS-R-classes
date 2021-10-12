# Name: Kat Leigh
# Homework 1

#== Question 1a ####
# 100 regularly spaced values from -1 to 1. Call this vector
x <- seq(from=-1, to=1, length.out = 100)
x

#==Question 1b ####
# The functiony=exp(x/2), evaluated for all the values in vector x
# created in part a. Call this vector y.
y <- exp(x/2)
y

#==Question 1c ####
# How many values in y (created in part b) are greater than 1?
y_abv_1 <- length(y[y>1])
y_abv_1
# answer is 50

#==Question 1d ####
# 5 entries of "Small","Medium","Large", encoded as a factor.
# Call this vector size.
size <- factor(rep(c("Small","Medium","Large"),5))
size

#==Question 1e ####
# Take the results of part d and append 2 entries of "Unknown".
# Call this vector observed Size.
observed_size <- c(size,rep("Unknown",2))
observed_size

#==Question 2a ####
# Read the data into RStudio as an object named fishPassage
fishPassage <- read.csv("./fishPassage.csv")

#==Question 2b ####
# Calculate the maximum and minimum number of wild steelhead to pass
# Bonneville Dam (BON) and show the years in which each occurred
fpass_bon <- which(fishPassage[,'Dam']=="BON")
fpass_bon_yrs <- fishPassage[fpass_bon,c('Dam','Year', 'Wild.Steelhead')]

fpass_max_min_wshead <- fpass_bon_yrs[c(which(fpass_bon_yrs[,'Wild.Steelhead'] == max(fpass_bon_yrs$Wild.Steelhead, na.rm = TRUE)), which(fpass_bon_yrs[,'Wild.Steelhead'] ==  min(fpass_bon_yrs$Wild.Steelhead, na.rm = TRUE))),]
fpass_max_min_wshead

#==Question 2c ####
# Calculate the total number of fish counted at Bonneville Dam (BON) in 2007.

tot_fish_bon_07 <- sum(fishPassage[fishPassage$Dam=="BON" & fishPassage$Year=='2007',]$Chinook.Adult:fishPassage[fishPassage$Dam=="BON" & fishPassage$Year=='2007',]$Lamprey)

#==Question 2d ####
# Create a new data.frame called fishPassage1995BON that contains only observations from Bonneville Dam (BON) from 1995 on wards.

fishPassage1995BON <- fishPassage[fishPassage$Dam=='BON' & fishPassage$Year >= 1995,]

#==Question 2e ####
# Create a matrix with 3 columns from the data fishPassage1995BON that contains counts of Coho adults, Coho jacks, and the ratio of Coho jacks to adults. Name this matrix cohoPassage.

cohoPassage <- as.matrix(cbind(fishPassage1995BON[,c('Coho.Adult', 'Coho.Jack')], ratio_JtA= fishPassage1995BON$Coho.Jack/fishPassage1995BON$Coho.Adult))
cohoPassage

#==Question 2f ####
# compute the mean of each of the variables in cohoPassage.

mean_cohoP <- cbind(Av_Adlt= mean(cohoPassage[,1]), Av_Jck= mean(cohoPassage[,2]), Av_rat= mean(cohoPassage[,3]))
mean_cohoP

#==Question 2g ####
# round the output in part f to two decimal places. You may need to search the help files.

round_mean_cohoP <- round(mean_cohoP, 2)
round_mean_cohoP

#==Question 2h ####
# display all the observations (i.e., the whole row) associated with the largest Chinook adult count from fishPassage data.

max_chin_adlt <- fishPassage[fishPassage$Chinook.Adult == max(fishPassage$Chinook.Adult),]
max_chin_adlt
