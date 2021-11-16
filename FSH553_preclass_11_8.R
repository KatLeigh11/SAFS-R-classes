# function to add an inset tag to a plot.
## 'xtrm_coords' defines the max/min x and y values of the plot.
## 'inst_lab' is the text label you want to appear for the inset.
## 'injst' is a vector of the adjustment for the label inside the plot. The first item shifts the label to the right from the y axis, while the second item shifts the label up from the x axis.
## the function scales the adjustment specified in injst to the plot, creating the two variables 'x_loc' and 'y_loc' which specify the x and y coordinates, respectively, for the inset to appear.

inst_fxn <- function(inst_lab, injst, ...){
  xtrm_coords <- par("usr")
  x_loc <- xtrm_coords[1] + injst[1]*diff(xtrm_coords[1:2])
  y_loc <- xtrm_coords[3] + injst[2]*diff(xtrm_coords[3:4])
  text(x=x_loc, y=y_loc, l=inst_lab, ...)
}

plot(1,1)
inst_fxn(inst_lab= "(a)", injst= c(.05,.95))
