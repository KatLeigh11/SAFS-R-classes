#=====Lecture 6 r code: 
#which code runs the fastest? Why? From in-class exercise
X <- sample(1:100, size=10000000, replace=T)
system.time( unique(X)                     )
system.time( X[!duplicated(X)]             )  
system.time( X[!duplicated(X) == TRUE]     )  
system.time( X[duplicated(X) == FALSE]     )  
system.time( X[which(!duplicated(X))]      )   
system.time( as.numeric(levels(factor(X))) )

#===merge()
station1 <- cbind(time1=1:100, data=rnorm(100))

#note: a common mistake when using seq is to get 
#the length of the resulting vector wrong. Here it is 
#length 21.
station2 <- cbind(time2=seq(0,100,5), 
                  category=sample(1:3,replace=T,size=21))
station1
station2

merge(station1, station2, by.x="time1", by.y="time2")
merge(station1, station2, by.x="time1", 
      by.y="time2", all=T)

#behind the scenes of merge()
intersect(x=1:10, y=7:20) #returns values that are in both x and y
match(x=1:10, table=c(1,3,5,9)) #returns positions in your table argument

##=======Hands-on exercise 1

#====Using dates in R
as.Date("2013/10/15")

as.Date("9/22/1983", format = "%m/%d/%Y")
as.Date("September 22, 1983", format = "%B %d, %Y")
as.Date("22SEP83", format = "%d%b%y")
as.Date("22sep83", format = "%d%b%y")

weekdays(as.Date("2013/10/15"))
months(as.Date("2013/10/15"))
quarters(as.Date("2013/10/15"))
julian(as.Date("2013/10/15"), origin=as.Date("2013/01/01"))

#====POSIX dates
?strptime()

x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
z <- strptime(x, "%d%b%Y")
class(z)

dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
times <- c("23:03:20", "22:29:56", "01:03:30", "18:21:03", "16:56:26")
x <- paste(dates, times)
strptime(x, "%m/%d/%y %H:%M:%S")

# note it auto applies local timezone unless specified with tz

as.POSIXlt("1983-9-22 23:20:05")
aDate <- as.POSIXlt("1983-9-22 23:20:05")
as.POSIXct("1983-9-22 23:20:05")
aDate <- as.POSIXct("1983-9-22 23:20:05")

#===common functions
min(c(as.Date("2013/10/15"), as.Date("2010/06/15")))
max(c(as.Date("2013/10/15"), as.Date("2010/06/15")))
mean(c(as.Date("2013/10/15"), as.Date("2010/06/14")))

difftime(as.Date("2013/10/15"), as.Date("2010/06/14"))

#Dates as factors
everyday <- seq(from=as.Date("2013-01-01"), 
                to=as.Date("2013-12-31"), by="day")
class(everyday) #date
month <- months(everyday)
class(month) #character
month <- factor(month, levels=unique(month), ordered=TRUE)
class(month) #ordered factor
table(month)


#=========Hands on exercise 2: dates


#==vignettes and packages
vignette(all=FALSE)   #vignettes for all installed *and* loaded packages 
vignette(all=TRUE)    #vignettes for all installed packages
vignette("googleVis") #package googleVis that does Hans Rosling GapMinder plots
edit(vignette("hcl-colors"))

#========Hands-on exercise 3: Birthday problem


#========== Make up data with and without duplicates
birthdays <- as.Date(c("4/23/2015", "1/7/2015", "4/7/2015", 
                       "4/9/2015"), format = '%m/%d/%Y' )
any(duplicated(birthdays))

#check for dates where there is a duplicate
birthdays <- as.Date(c("4/23/2015", "1/7/2015", "4/7/2015", "4/7/2015"), format = '%m/%d/%Y' )
birthdays
any(duplicated(birthdays))
birthdays[duplicated(birthdays)]
#longest gap
max(diff(sort(birthdays)))
#shortest gap
min(diff(sort(birthdays)))

######Solving the birthday problem
#case with 365 days, ignoring leap years
birthday.prob <- function(N=36, niterations=10000) {
   data <- 1:365
   nduplicates <- 0
   for (i in 1:niterations) {
      if (any(duplicated(sample(x=data, size=N, replace = T)))) {
         nduplicates <- nduplicates+1
      }
   }
   return(nduplicates/niterations)
}
birthday.prob(N=36)

library(swirl)
swirl()
