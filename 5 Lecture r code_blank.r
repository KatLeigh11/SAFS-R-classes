#=====Lecture 5 r code: 
nums <- c(12,9,8,14,7,16,3,2,9)
any(nums > 10)
all(nums > 10)
which(nums > 10)
nums[which(nums > 10)]
nums[nums > 10]

#unique and duplicated
plates <- c("WA","WA","OR","RI","WA","WA","CA","WA","WA")
unique(plates)

duplicated(plates)

#testing modes
y <- rnorm(6)
x <- sample(factor(1:6))
(xy <- data.frame(x,y))
is.numeric(xy$x)
is.factor(xy$x)
attributes(xy$x)

#using cut to create a new factor
ages <- c(47,14,24,33,74)
cut(ages, breaks=c(0,18,65,Inf), 
    labels=c("Kid","Adult","Senior"))

#constants in R
pi    #constant 3.141593...
letters
LETTERS
month.abb
month.name

#unknowns and errors and missings
Inf    #e.g. 1/0
-Inf   
NaN    #e.g. sqrt(-1)
sqrt(-1)
NULL   #nothing there, empty, blank
NA     #missing data, error in data, wrong number
x <- NA
(x <- c(x,1,2,3))
x <- NULL
(x <- c(x,1,2,3))



#subsetting when NAs are present
x <- data.frame(a=c(11,13,12,15,17,20),
                b=c(8,NA,6,4,NA,15))
x[x$b>5,]
subset(x, b>5)
subset(x, b>7, a)

###======Hands-on exercise 1


#Part 2 of Exercise 1


#using apply()
m <- matrix(1:12,nrow=3)
apply(X=m, MARGIN=2, FUN=mean)
apply(X=m, MARGIN=1, FUN=mean)
quantile(m[1,], c(0.05,0.5,0.95))  #5%, 50%, 90% of first row
apply(X=m, MARGIN=1, FUN=quantile, c(0.05,0.5, 0.95))
apply(X=m, MARGIN=2, FUN=quantile, c(0.05))

#more using apply()
rownm <- paste("Patient",1:20)
colnm <- paste("Yr",1:5)
subj <- matrix(rnorm(n=100),ncol=5,dimnames=list(rownm,colnm))
round(subj,3)
round(apply(subj, MARGIN=1, mean),3)
round(apply(subj, MARGIN=2, mean),3)

round(rowMeans(subj),3)
round(colMeans(subj),3)

#using tapply
(lengths <- sample(1:100,size=20, replace=T))
(genders <- sample(c("Male","Female","Unknown"), 
              size=20, replace=T))
tapply(X=lengths, INDEX=genders, FUN=mean)

(weights <- sample(200:250, size=20, replace=T))
tapply(X=lengths, INDEX=weights, FUN=mean)
(tapply(X=weights, INDEX=lengths, FUN=mean))
 ?tapply
 

XX <- data.frame(lengths, genders)
XX
tapply(X=XX$lengths, INDEX=list(XX$genders,weights), FUN=max)

#ordering elements in vectors
(cards <- sample(1:10))
sort(cards)
rev(sort(cards))  #reverse the order
order(cards) # index of the location in the vector (from low to high)

#reordering a matrix
cards[order(cards)] # re order from low to high based on the indexes
YY <- data.frame(ID=sample(1:10),dev=round(rnorm(10),3))
YY[order(YY$ID),] # reorder from low to high all the rows based on the indexes of column ID
sort(YY$ID)

#ordering within sub-ordering
ZZ <- data.frame(laws=sample(1:3,replace=T, size=10),
                 year=sample(2010:2012,replace=T,size=10),
                 state=c("WA","OR","CA","VT","NY","RI","FL","UT","AZ","TX"))
ZZ
ZZ[order(ZZ$laws, ZZ$year, ZZ$state),]

###======Hands-on exercise 2
