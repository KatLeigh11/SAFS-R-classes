# Name: Kat Leigh
# Homework 3

#==Question 1a ####
# a) Read in the three data sets

mack.black <- read.table('MACKBLACK.txt', col.names = c("Year", "spawners", "recruits", "catch", "fishMortality"), na.strings = '.', colClasses = c('numeric','numeric','numeric','numeric','numeric'))

mack.nafo <- read.table('MACKNAFO.txt', col.names = c("Year", "spawners", "recruits", "catch", "fishMortality"), na.strings = '.', colClasses = c('numeric','numeric','numeric','numeric','numeric'))

mack.ices <- read.table('MACKICES.txt', col.names = c("Year", "spawners", "recruits", "catch", "fishMortality"), na.strings = '.', colClasses = c('numeric','numeric','numeric','numeric','numeric'))

# b) Create a single data set from mack.black and mack.nafo that contains all of the variables in each data set (spawners recruits catch fishMortality), but is restricted to years that the two data sets have in common.
mack.partial <- merge(mack.black, mack.nafo, by="Year", suffixes = c('.black', '.nafo'))


# c) Create a single data set from mack.partial and mack.ices that contains all of the variables in each data set, but is restricted to years that the two data sets have in common.
mack <- merge(mack.partial, mack.ices, by= 'Year')

# d) Change the column names in mack that are uninformative to "spawners.ices" "recruits.ices" "catch.ices" "fishMortality.ices".

names(mack) <- c(names(mack)[1:9], "spawners.ices", "recruits.ices", "catch.ices", "fishMortality.ices")

# e) Create this graph with the data in mack. Use plot() and then lines().

### TO DO!!! ###



#==Question 2a ####
# Create a data frame named temperature which has 2 columns: the dates Jan 1 2010 through Jun 30 2010 and a randomly generated temperature for each day. Use rnorm to generate the temperatures with the means listed below and a standard deviation of 5, then round to the nearest whole number. Hint: you only have to call rnorm once if you first create a vector of means.

meanz <- c(rep(40,31), rep(42, 28), rep(51, 31), rep(55, 30), rep(58,31), rep(62, 30))
datez = seq(as.Date('01-01-2010', format= '%m-%d-%Y'),as.Date('06-30-2010', format= '%m-%d-%Y'), by= 'days')
set.seed(11)

temperature <- data.frame(
  date = datez,
  temperatures = round(rnorm(n=181, mean=meanz, sd=5),0))

#==Question 2b ####
# Calculate the observed means for each month (based on the data you generated) and compare to the values specified in part a.
dblchkmn <- tapply(temperature$temperatures, INDEX = months(temperature$date), mean)
dblchkmn
# note the observed are quite similar to the specified values (see below)
diff_obs_spec <- c(40,42,51,55,58,62)-c(dblchkmn)
diff_obs_spec

#==Question 2c ####
# Check if you have any duplicate temperatures. On which days does this happen?
duplicated(temperature$temperatures)
dup_days <- temperature[which(duplicated(temperature$temperatures)),] # days containing duplicates are listed alongside their respective temperature values in the data frame 'dup_days'

#==Question 2d ####
# Create a second data frame named observations which has 3 columns: the dates Jan 1 2010 through Jul 31 2010, but only every other day, the conditions (sunny, cloudy, or partly cloudy) as a factor (how you assign conditions to days is up to you), and the wind speed. Use rnorm to generate the wind speed with a mean of 5 and a standard deviation of 3, but change any negative values to 0.

observations <- data.frame(date= datez[seq(1,by=2, len=length(datez)/2)-1],
                           conditions= c('sunny', 'cloudy', 'partly_cloudy'),
                           wind_speed= round(abs(rnorm(n=length(datez)/2, mean=5, sd=3)),2))

#==Question 2e ####
# Combine the 2 data frames into a single data frame weather, omitting any rows that don’t match.

weather <- merge(observations, temperature)

#==Question 2f ####
# Calculate the min and max temperature for each of the conditions, as well as how many days of each condition there were.
min_max_per_condition <- tapply(weather$temperatures, weather$conditions, range)
min_max_per_condition

mytbl <- table(weather$conditions, weather$temperatures)
dayz_per_condition <- margin.table(mytbl, 1)
dayz_per_condition
