#========================================
#Lecture 2, FISH553 Advanced R
#loops and conditions
#========================================

for (i in seq(from=1,to=5,by=1)) { print(i) }
for (i in c(1,4,5,8,8,8)) { print(i) }
for (i in c("1","N","L")) { print(i) }

for (i in c(1,4,5,8)) {
   print(i) 
}
print(i)

#======looping through species in iris
#first check what the data set looks like
head(iris)
names(iris)
str(iris)
unique(iris$Species)  #find the unique species names

#loop through the species names
for (i in unique(iris$Species)) {
   print(i)   
}

#loop through the species names and calculate stuff
for (i in unique(iris$Species)) { # for each species
   meanSepalLength <- mean(iris[iris$Species==i,]$Sepal.Length)   # for the subset all rows matching i species, get the mean sepal length
   meanPetalLength <- mean(iris[iris$Species==i,]$Petal.Length)   # for the subset all rows matching i species, get the mean petal length
   cat(i, meanSepalLength, meanPetalLength, "\n") # stick results together separated by a line break
}

#convert to a function
loop.iris <- function (data=iris) {
  for (i in unique(iris$Species)) {
     meanSepalLength <- mean(iris[iris$Species==i,]$Sepal.Length)   
     meanPetalLength <- mean(iris[iris$Species==i,]$Petal.Length)   
     cat(i, meanSepalLength, meanPetalLength, "\n")
  }
}
loop.iris()

#This is the most common way that I use for loops in this context
#because you get a counter that is useful for other operations
species <- sort(unique(iris$Species)) # get unique species ordered alphabetically
nspecies <- length(species) #count species
mean.lengths <- vector(length=nspecies) # create an empty vector to store your results same length as number of species
for (i in 1:nspecies) { # for each species
   cat("Running species ", i,"\n") #create a title
   species.data <- iris[iris$Species==species[i],] #subset for the just species i
   plot(hist(species.data$Sepal.Length)) # plot histogram of sepal lengths for species i
   mean.lengths[i] <- mean(species.data$Sepal.Length) # stick the mean length for that species into the empty spot in the length vector to store it
   print(mean.lengths[i]) # print the mean length to the console
}

#=====while loop
#rarely used, since for-loops can do almost all
#looping, but while-loops are sometimes essential
#while loops execute for as long as some statement remains true

#== when will polar bears fall below 500?
polar.loop <- function(N, year=2015) {
   while(N>500) { # as long as N is above 500...
      N <- N*0.91
      year <- year+1
      cat(N,year,"\n")
   }
   return(year)
}
polar.loop(N=5000)

#===== For loops are similar to the apply functions.
#The sapply function is most closely related
x1 <- sapply(1:3, print)
x1
x2 <- sapply(1:3, function(i) {i^2})
x2

#===== If statement
plotxy <- function(x, y) {
   if (length(x) == length(y)) {
      plot(x,y)
   }
   else {
      print("Lengths of x and y are different")
   }
}
plotxy(x=1:5, y=5:1)
plotxy(x=1:5, y=4:1)

#====complicated if-then-else statement
sum.bigger <- function(x, y) {
   if(length(x) != length(y)) {
      print("not equal lengths")
   }
   else {
      if (sum(x) > sum(y)) {
         print("x bigger")
      }
      else {
         print("x smaller or equal")
      }
   }
}
sum.bigger(x=1:5, y=6:10)

#Example using else if.
require(stats)
centre <- function (x, type) {
  if (type=="mean") {
     temp <- mean(x)
  } else if (type=="median") {
     temp <- median(x)
  } else if (type=="trimmed") {
     temp <- mean(x, trim=.1)
  } else {
     temp <- "No function matches"
  }
  return(temp)
}
x <- rcauchy(10)  #ten values from a cauchy distribution
centre(x, "mean")
centre(x, "median")
centre(x, "unknown")

#===switch statement as alternative to complicated "else if" statements
# woah so cool!
centre2 <- function(x, type) {
   return(switch(type,
          mean = mean(x),
          median = median(x),
          trimmed = mean(x, trim = .1),
          "No function matches") )
}
centre2(x, "mean")
centre2(x, "median")
centre2(x, "unknown")

#Switch statement using numbers
alternatives <- function(x, value) {
   return(switch(value,    # depending on what is entered for value...
                 "You chose option 1",
                 x^3,
                 "Option 3") )
}
alternatives(x=3,value=1)
alternatives(x=3,value=2)
alternatives(x=3,value=3)
alternatives(x=3,value=10)

#===numerical switch statement: no default allowed
for(i in 0:6) {
   print(switch(i, 1, 2, 3, 4))
}

for(i in 0:6) {   #return the 0th element, first element, second...
   print(switch(i, 
                "Help",       #first element
                "Too hard",   #second element
                "OK",         #third element 
                "Really?"))   #fourth element
}
#===useful RStudio features
#choose Code->Reindent Lines ctrl+I
#code->Comment/Uncomment ctrl+shift+C
#rerun code ctrl+shift+P
polar.loop <- function(N, year=2012) {
   while(N>500) {
      N<-N*0.92
      year<-year+1
   }
   return(year)
}
polar.loop(N=10000)
