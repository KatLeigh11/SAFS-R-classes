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


#==Q2

#==Q3


#==Q4 advanced
