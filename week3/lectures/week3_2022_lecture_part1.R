## Week 2, Part 1 Lecture code - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 20-Jan-2022     Michael Nunez                Original code

my_sample <- rnorm(1000)
hist(my_sample)

plot(my_sample)

my_other_sample = 10 -2*my_sample + rnorm(1000)
plot(my_sample, my_other_sample)
?plot

plot(my_sample, my_other_sample, type="l")

x = seq(0, 2*pi, by=.1)
plot(x, sin(x), type="l")

# NOT line(x, cos(x))  # This is different function
lines(x, cos(x), col='red')


# Boxplots
my_data = rpois(1000, lambda = 1)
boxplot(my_data)
?boxplot

#Another way to save plots
#A script per plot is very useful for research and conducting reproducible science
setwd("C:/Users/mnunez/OneDrive - UvA/Programming_in_Psychological_Science/Week3")
getwd()
png('Some_sine_waves.png')
x = seq(0, 2*pi, by=.1)
plot(x, cos(x), type="l", col="blue")
lines(x, sin(x), col='red')

# Close device
dev.off() # Notice it did not make a nice plot in my graphics window

#See also:
?png
?jpeg
?pdf
?svg

x11()
x = seq(0, 2*pi, by=.1)
plot(
  x, 
  cos(x), 
  type = "l", 
  col = "blue",
  xlab = "Time", 
  ylab = "Position") 
lines(x, sin(x), col='red')
title("Pendulum")

# More help on function arguments to plot, lines, histogram, etc.
?par

x11()
x = seq(0, 2*pi, by=.1)
plot(
  x, 
  cos(x), 
  type = "l",
  lwd = 3,
  lty = "dotdash",
  col = "blue",
  xlab = "Time", 
  ylab = "Position",
  cex.lab = 2)
lines(x, sin(x), col='red', lwd = 2, lty = "dashed")
title("Pendulum", cex.main=0.5)

# Subplots in base R
?par # par() does a lot
par(mfrow = c(2,2)) # 2-by-2 grid of plots

# Now make some plots after par
plot( exp( seq(-2,2,by=0.1) ), type = 'b', col = 'red' )
hist( rexp(1000, rate = .5) )
boxplot( rpois(1000, lambda=1) )
plot( sin(seq(0, 2*pi, by=.1)) , col='red', lwd = 2, lty = "dashed")

# Remove default x-labels and y-labels
par(mfrow = c(2,2)) # 2-by-2 grid of plots
plot( exp( seq(-2,2,by=0.1) ), type = 'b', col = 'red' , ylab = "")
hist( rexp(1000, rate = .5), ylab = "")
boxplot( rpois(1000, lambda=1), ylab = "")
plot( sin(seq(0, 2*pi, by=.1)), col='red', lwd = 2, lty = "dashed", ylab = "")

# How to make room? See ?par
# I see that mar is the numerical vector for the margins
# Then I used google
par(mfrow = c(2, 2)) # 2-by-2 grid of plots
par(mar = c(2, 2, 1, 1)) # decreases margins around each subplot
plot( exp( seq(-2,2,by=0.1) ), type = 'b', col = 'red' , ylab = "")
hist( rexp(1000, rate = .5), ylab = "")
boxplot( rpois(1000, lambda=1), ylab = "")
plot( sin(seq(0, 2*pi, by=.1)), col='red', lwd = 2, lty = "dashed", ylab = "")

# how do I remove the title of a histogram in R?
# Googling... "R remove histogram title"
# Ah here it is: https://stackoverflow.com/questions/736541/plots-without-titles-labels-in-r
# Stack Overflow is your friend

dev.off() # Run to get rid of current par, or x11() etc.
hist( rexp(1000, rate = .5), main = "")

install.packages('ggplot2')
library(ggplot2)

# Or install the entire tidyverse, which we will also use next week
install.packages('tidyverse')
library(tidyverse)

# The next few examples follow alone Chapter 3: Data visualisation of
# https://r4ds.had.co.nz/data-visualisation.html

# ggplot and tidyverse coding sometimes has a different function structure
?mpg # Classic ggplot2 example
mpg
head(mpg)
glimpse(mpg)
colnames(mpg)
# More next week

ggplot(data = mpg) #Noting happens!

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
# ggplot() creates a coordinate system to which you add layers

# In general this is the format
# ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

# Color all dots
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# Color some dots by class
unique(mpg$class)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "class")) # Wrong!

# Don't use quotes so that ggplot() functions know you want to reference mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# This + won't work here:
ggplot(data = mpg)
+ geom_point(mapping = aes(x = displ, y = hwy, color = class))
# You have to put the plus on the first line

# Let's plot a best fit smoothed line to the data
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = class))
# Many warnings
# Hmmm, maybe just one smoothed line:
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# One more concise way is to put the "aesTHETIC mappings" in ggplot()
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

# now I could color only the dots by class:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

#Look it recognizes British English as well:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = class)) + 
  geom_smooth()


# Other packages:
install.packages('patchwork')
library(patchwork)
# Google patchwork
# https://statisticsglobe.com/patchwork-r-package
