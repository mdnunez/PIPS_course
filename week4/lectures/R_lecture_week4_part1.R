## Week 4, Monday Lecture code - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 30-Jan-2022     Michael Nunez                Original code


#install.packages('tidyverse')
library(tidyverse)

# OR

#install.packages('gapminder')
library(gapminder)
#install.packages('dplyr')
library(dplyr)
#install.packages('ggplot2')
library(ggplot2)

# The first part of this R code that follows along
# the Introduction to the tidyverse on DataCamp lecture
# https://campus.datacamp.com/courses/introduction-to-the-tidyverse



# Look at your data
?gapminder  # R help file
gap_data <- gapminder # Place in R environment
head(gapminder)
dim(gapminder)
slice(gapminder, 3:nrow(gapminder)) # Look at the 3rd row to the last row
slice(gapminder, 3:n()) # Special n() command to index last element

#One way to filter the data
filter(gapminder, year == 2007)

#dplyr has a nice pipe function instead: https://dplyr.tidyverse.org/articles/dplyr.html?q=pipe
gapminder %>% filter(year == 2007)  # Notice that both give the same output


# The pipe command example
my_norm_data <- rnorm(1000)
mean(abs(my_norm_data))
my_norm_data %>% abs() %>% mean()


my_norm_data[1000] = NA
mean(abs(my_norm_data), na.rm=TRUE)
my_norm_data %>% abs() %>% mean(na.rm=TRUE)

#Again one way to filter the data using normal behaviour of R functions
filter(gapminder, country == "United States")
# The dplyr pipe way
gapminder %>% filter(country == "United States")

#One final time for two filters
filter(gapminder, country == "United States", year == 2007)
# The dplyr pipe way
gapminder %>% filter(country == "United States", year == 2007)

#arange is like the SORT button in Excel. Many programming languages have SORT functions

#The traditional way
arrange(gapminder, desc(gdpPercap))
#Pipe method
gapminder %>% arrange(desc(gdpPercap))

#The traditional way, function in a function
arrange(filter(gapminder, year == 2007), desc(gdpPercap))
#The pipe method
gapminder %>% filter(year == 2007) %>% arrange(desc(gdpPercap))

#The traditional way
arrange(gapminder, lifeExp)
#The pipe method
gapminder %>% arrange(lifeExp)

#The traditional way
arrange(filter(gapminder, year == 1957), desc(pop))

#The pipe method (read traditional way backwards)
gapminder %>% filter(year == 1957) %>% arrange(desc(pop))

#The traditional way
mutate(gapminder, lifeExpMonths = 12*lifeExp)

#The pipe method
gapminder_month <- gapminder %>% mutate(new_var = 12*lifeExp)


#The traditional way
arrange(mutate(filter(gapminder, year==2007),lifeExpMonths = 12*lifeExp),desc(lifeExpMonths))

#The pipe method
gapminder %>% 
  filter(year == 2007) %>% 
  mutate(lifeExpMonths = 12*lifeExp) %>% 
  arrange(desc(lifeExpMonths))

#The base R pipe method |>
gapminder |> 
  filter(year == 2007) |> 
  mutate(lifeExpMonths = 12*lifeExp) |> 
  arrange(desc(lifeExpMonths))

#Plotting
x11()
gapminder_2007 <- gapminder %>% filter(year == 2007)
ggplot(gapminder_2007, aes(x = gdpPercap, y=lifeExp)) + geom_point()


# See: https://www.r-bloggers.com/2019/10/data-pivoting-with-tidyr/
# Let's make some LONG data
gapminder_long <- gapminder %>%
  pivot_longer(
    lifeExp:gdpPercap,
    names_to = "measure",
    values_to = "value"
  )
dim(gapminder)
head(gapminder_long)
dim(gapminder_long)

# Make gapminder_long tidy data
gapminder_tidy <- gapminder_long %>% pivot_wider(names_from=measure, values_from=value)
dim(gapminder_long)
dim(gapminder_tidy)

# Used pivot_wider
gapminder_wide <- gapminder %>% 
  pivot_wider(
    names_from = year,
    values_from = c(lifeExp, pop, gdpPercap)
  )
dim(gapminder)
head(gapminder_wide)
colnames(gapminder_wide)
dim(gapminder_wide)


# Some help with Assignment 4.1

# Let's try to import this data
# https://github.com/hannesrosenbusch/schiphol_class

# Ways to import data:
incorrect_data <- read.csv2('https://github.com/hannesrosenbusch/schiphol_class/blob/master/1.csv')
# DO NOT RUN THIS:
# incorrect_data
head(incorrect_data) # Usually it is a better idea to print head
dim(incorrect_data) # Hmmm 643 rows and 1 column. That cannot be right.

# Still not correct...
mysterious_data1 <- read.csv2(
  'https://raw.githubusercontent.com/hannesrosenbusch/schiphol_class/master/1.csv',
  sep = ",")
head(mysterious_data1) # Hmmm
summary(mysterious_data1)
colnames(mysterious_data1)
dim(mysterious_data1) # This looks reasonable. 
# Let's also use RStudio to view the data table in the environment window


# See also fread from package data.table
# install.packages('data.table')
library(data.table)
mysterious_data1 <- fread(
  'https://raw.githubusercontent.com/hannesrosenbusch/schiphol_class/master/1.csv')

# Let's remove some specific rows
shorter_data1 <- mysterious_data1 %>% slice(3:n())
dim(shorter_data1)
# Now the dimension is 313 77

# Let's look again in RStudio 

# Let's do the same thing for a different data set
mysterious_data2 <- fread(
  'https://raw.githubusercontent.com/hannesrosenbusch/schiphol_class/master/2.csv')
shorter_data2 <- mysterious_data2 %>% slice(3:n())

# Let us attach the two data sets together by rows
both_data <- bind_rows(list(shorter_data1, shorter_data2))
both_data <- list(shorter_data1, shorter_data2) %>% bind_rows()
