# pre-class assignment for 10/13

# The Exercise (do not answer these questions for this quiz):
#   The PlantGrowth data frame is built into R. Using this dataset:
#   
# Examine the data thoroughly
 
data("PlantGrowth")
class(PlantGrowth)
dim(PlantGrowth)
attributes(PlantGrowth)

# Calculate the mean and standard deviation for each treatment and the control

meanz_c <- mean(subset(PlantGrowth, group == levels(PlantGrowth$group)[1])$weight)
meanz_t1 <- mean(subset(PlantGrowth, group == levels(PlantGrowth$group)[2])$weight)
meanz_t2 <- mean(subset(PlantGrowth, group == levels(PlantGrowth$group)[3])$weight)

sdz_c <- sd(subset(PlantGrowth, group == levels(PlantGrowth$group)[1])$weight)
sdz_t1 <- sd(subset(PlantGrowth, group == levels(PlantGrowth$group)[2])$weight)
sdz_t2 <- sd(subset(PlantGrowth, group == levels(PlantGrowth$group)[3])$weight)

df_mean_sd <- data.frame(group= levels(PlantGrowth$group),
                         mean= round(c(meanz_c, meanz_t1, meanz_t2),3),
                         stnd_dev= round(c(sdz_c, sdz_t1, sdz_t2),3))

# Create a factor for small and large based on the weights

f_sml_lrg <- cut(PlantGrowth$weight, breaks = quantile(PlantGrowth$weight, c(0,0.5,1)),
                 labels = c('small', 'large'))

# Create a new data frame that just contains the control data

cntrl_df <- PlantGrowth[PlantGrowth$group == 'ctrl',]

# Sort the weights

sorted_weight <- sort(PlantGrowth$weight)

# Now display the entire data frame sorted by weight

df_sorted_weight <- PlantGrowth[order(PlantGrowth$weight),]


# Your Quiz Questions (answer these questions for the quiz):

#   What functions can you use to examine a new data set? (see swirl() activity 12 for a brief refresher)
## class, dim, attributes, view, plot

# What are the functions calls for finding the mean and standard deviation?
## mean()
## sd()

#   How many treatments are present in the data?
## 2 treatments

#   What are some functions you can use to decide which plant observations are small vs. large?
## quantile()
## mean()
## median()

#   Which methods are available for creating a new data frame of just the control data? 
## use brackets, $, or subset() to filter just for where group == 'ctrl'.

#   Pick the method you want to try first.
## brackets

# Which method that you identified in #5 do you think you want to try first for displaying the entire data frame sorted by weight?
## a version of brackets and $ that uses the order() function.

# What to turn in:
#   The answers to the above questions (no code!).