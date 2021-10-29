#=====Lecture 7 r code
help.search("logarithm")
apropos("log")
help("log")
?log

#load data
speciesCode <- read.csv("speciesCode.csv")
speciesData <- read.csv("speciesData.csv")
tripData <- read.csv("tripData.csv")
tripData$Date

#====tripData examination
head(tripData, n=3)
tripData$Date <- as.Date(tripData$Date)
( min.date <- min(tripData$Date) )      #start date
( max.date <- max(tripData$Date) )      #end date 
( range.date <- range(tripData$Date) )  #min and max dates
difftime(max.date, min.date)
hist(tripData$Date, breaks="months", col="grey") #hist for day data, see ??hist.date

#===longest time difference in data
#order the tripData by the Date column
tripData <- tripData[order(tripData$Date),] 
diff(c(1,2,4,5,6))

#=======In-class exercise 1


#===visualizing trip dates
plot(x=tripData$Date, y=tripData$TotalMinutes/60, 
     type="h", ylim=c(0,5), xaxs="i", yaxs="i",
     xlab="Trip date", ylab="Trip length (hr)")

#===species code data
head(speciesCode, n=4)
head(speciesData, n=4)

#===most frequently caught species
speciesCounts <- table(speciesData$SpeciesCode) # this will count the number of times each code shows up
speciesCounts
sort(speciesCounts) # this will sort the codes by their frequencies
temp <- speciesCounts[which.max(speciesCounts)] # returns the max frequency code based on the index of the max frequency found in speciesCounts
temp
names(temp) # note it's named cuz that's what the table fxn did earlier
maxCode <- as.numeric(names(temp)) # can save this code to a value to call later
maxCode
maxCode <- as.numeric(names(speciesCounts[which.max(speciesCounts)])) # do it all at once
maxCode
max.spp <- speciesCode[speciesCode$SpeciesCode==maxCode,] # get the data associated with that max code
max.spp

#=====bocaccio dataset
grep("a", c("a","b","a","c","a","d")) # find the indicies that are 'a'
which(c("a","b","a","c","a","d") %in% "a") # other way to do it using %in% (yay! :)  )
bocaccioRows <- grep("Bocaccio",speciesCode$Common) # find all the indicies that have 'bocaccio'
speciesCode[bocaccioRows,] # just get the data for the bocaccio rows

bocaccioCode <- speciesCode[bocaccioRows, "SpeciesCode"] # just get the code(s) that correspond to bocaccio
names(speciesData)
#bocaccioData <- subset(speciesData, 
#      speciesData$SpeciesCode==bocaccioCode)
bocaccioData <- subset(speciesData, 
      SpeciesCode==bocaccioCode) # get just the bocaccio data based on the corresponding code
head(bocaccioData)

#merge with the trip data 
bocTrip <- merge(bocaccioData, tripData[,-1],
                 by.x="TripNum", by.y="SimplifiedTripNum") # merge to just get the trips that correspond to bocaccio (this is intersect, not union cuz all=F by default)
head(bocTrip, n=4)

#=======In-class exercise 2
#==Q1
# Find the maximum difference in successive dates

tripData <- tripData[order(tripData$Date),]
biggest_gap <- max(diff(tripData$Date))

# Find the row index of this biggest gap
tmp <- diff(tripData$Date)
row_inx_biggest_gap <- which(tmp ==biggest_gap)

which.max(diff(tripData$Date)) # or this way too

check_gap <- difftime(tripData[row_inx_biggest_gap+1,]$Date, tripData[row_inx_biggest_gap,]$Date)

# Display rows of tripData immediately before (three rows) and after (three rows) the biggest gap
tripData[c(row_inx_biggest_gap -3, row_inx_biggest_gap -2, row_inx_biggest_gap -1, row_inx_biggest_gap +3, row_inx_biggest_gap +2, row_inx_biggest_gap +1),]

difftime(tripData[c(2:length(tripData$Date)),'Date'], tripData[c(1:length(tripData$Date)-1), 'Date'])

  

#==Q2

# 1. Create a data frame by subsetting speciesData to include all rockfish species (scientific name Sebastes) using speciesCode to find the corresponding codes

rockFishCode <- speciesCode[grep('Sebastes', speciesCode$Scientific),'SpeciesCode'] # search for matching string 'rockfish' in common column pf speciescode dataframe; return the indices of these matches; return all rows matching these indicies and only the speciescode column. 

rockFish <- speciesData[speciesData$SpeciesCode %in% rockFishCode,] # subset the speciesdata dataframe to just include the rows where the speciescode matches those corresponding to the codes for 'Sebastes' found in the previous line.
 
# 2. Provide a table() of the fates of rockfish by species code

rockFishTable <- table(rockFish$SpeciesCode, as.character(rockFish$Fate)) # get frequency summaries for each value in the fate column for all the rockfish entries. But remove the blank value in the fate column by converting to character.

# 3. Calculate the minimum and maximum length recorded for each rockfish species

min_max_rockFish <- tapply(rockFish$Length, as.factor(rockFish$SpeciesCode), range, na.rm=TRUE) # apply the range function (calculates the min and max) across all the rockfish data, grouping by species code so that the ranges returned are per species.

# Advanced (repeat but obtain a table of fate vs. common name)

rockFish_common <- merge(rockFish, speciesCode, all=FALSE)

rockFishTable_common <- table(rockFish_common$Common, as.character(rockFish$Fate)) # get frequency summaries for each value in the fate column for all the rockfish entries. But remove the blank value in the fate column by converting to character.

# 3. Calculate the minimum and maximum length recorded for each rockfish species

min_max_rockFish_common <- data.frame(ranges = tapply(rockFish_common$Length, droplevels(rockFish_common$Common), range))


try <- min_max_rockFish_common[!is.na(unlist(min_max_rockFish_common)),]

#==Q3


#==Q4 advanced
 