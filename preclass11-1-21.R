# pre-class 11/1/21

# Plot the two plots in the same figure as a multi-panel plot arranged in one row. Use mfrow.
par(mfrow=c(2,2))
plot(crabs$sex, crabs$FL,
     xlab= 'Sex', ylab= 'Frontal Lobe Size (mm)', main= 'Frontal Lobe by Sex')
mtext("Distribution of Frontal Lobe Sizes by Sex and Varietal for L.variegatus", side = 3, line = -1, outer = T)

plot(crabs$sp, crabs$FL,
     xlab= 'Varietal (Blue or Orange)', ylab= 'Frontal Lobe Size (mm)', main= 'Frontal Lobe Sizes by Varietal',
     col= c('lightblue', 'orange'))

# Plot the two plots in the same figure as a multi-panel plot arranged in one column. Use mfrow .
par(mfrow=c(2,1))
plot(crabs$sex, crabs$FL,
     xlab= 'Sex', ylab= 'Frontal Lobe Size (mm)', main= 'Frontal Lobe by Sex')
mtext("Distribution of Frontal Lobe Sizes by Sex and Varietal for L.variegatus", side = 3, line = -1, outer = T)

plot(crabs$sp, crabs$FL,
     xlab= 'Varietal (Blue or Orange)', ylab= 'Frontal Lobe Size (mm)', main= 'Frontal Lobe Sizes by Varietal',
     col= c('lightblue', 'orange'))


# Repeat step 1 with mfcol.

par(mfcol =c(1,2))
plot(crabs$sex, crabs$FL,
     xlab= 'Sex', ylab= 'Frontal Lobe Size (mm)', main= 'Frontal Lobe by Sex')
mtext("Distribution of Frontal Lobe Sizes by Sex and Varietal for L.variegatus", side = 3, line = -1, outer = T)

plot(crabs$sp, crabs$FL,
     xlab= 'Varietal (Blue or Orange)', ylab= 'Frontal Lobe Size (mm)', main= 'Frontal Lobe Sizes by Varietal',
     col= c('lightblue', 'orange'))

# Repeat step 2 with mfcol.

par(mfcol =c(2,2))
plot(crabs$sex, crabs$FL,
     xlab= 'Sex', ylab= 'Frontal Lobe Size (mm)', main= 'Frontal Lobe by Sex')
mtext("Distribution of Frontal Lobe Sizes by Sex and Varietal for L.variegatus", side = 3, line = -1, outer = T)

plot(crabs$sp, crabs$FL,
     xlab= 'Varietal (Blue or Orange)', ylab= 'Frontal Lobe Size (mm)', main= 'Frontal Lobe Sizes by Varietal',
     col= c('lightblue', 'orange'))

# Paste these 4 multi-panel figures into a Word Document and upload to this assignment.

