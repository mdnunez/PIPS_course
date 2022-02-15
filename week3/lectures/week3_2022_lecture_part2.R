## Week 3, Part 2 Lecture code - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 24-Jan-2022     Michael Nunez                Original code

# Introduction to coding style ---------------------------

# https://style.tidyverse.org

# Two quick ways to check SOME style:

# styler addin to RStudio:
# https://styler.r-lib.org/

# lintr
# https://github.com/r-lib/lintr
install.packages("lintr")
library(lintr)
setwd("C:/Users/mnunez/OneDrive - UvA/Programming_in_Psychological_Science/
      Week3/lectures")
lint('week3_2022_lecture2.R')

# Line 20 Only use double-quotes
# Line 22 Lines should not be more than 80 characters
# Line 23 Only use double-quotes

# Change to:
install.packages("lintr")
library(lintr)
setwd("C:/Users/mnunez/OneDrive - UvA/Programming_in_Psychological_Science/
      Week3/lectures")
lint("week3_2022_lecture2.R")

# Variable names  ---------------------------

# Possible the most important thing you can do to make your code readable:
# Informative variable, function, and file names
# Even more important that comments
# What if Q2.1.29 looked like this?

# Bad Q2.1.29
# Notice lint() does not produce an error in the bad variable names
x <- "green"
y <- function(z, w) {
  w <- x
  z <- "blue"
  x <- "blue"
  v <- c(z, w)
  return(v)
}
u <- "grey"
t <- "brown"
s <- y(u, t)
u2 <- s[1]
t2 <- s[2]

# Better Q2.1.29

grass <- "green"
color_it <- function(color_me, grass_me) {
  grass_me <- grass
  color_me <- "blue"
  grass <- "blue"
  colorful_items <- c(color_me, grass_me)
  return(colorful_items)
}
sky <- "grey"
ground <- "brown"
these_items <- color_it(sky, ground)
sky2 <- these_items[1]
ground2 <- these_items[2]


# camelCase versus snake_case  ---------------------------

# Good file name: fit_models.R
# Bad file name: fitModels.R
# Bad file name fit models.R

# I was confused on this myself.
# You may notice that I used camelCase in scripts for Week 1,
# and then snake_case for other weeks.
# Tidyverse style now recommends snake_case.
# I believe Google used to recommend camelCase.
# But more people follow Tidyverse recommendations now.

# Good
norm_samples <- rnorm(1000, mean = 10, sd = 100)

# Bad
normSamples <- rnorm(1000, mean = 10, sd = 100)

# Comments   ---------------------------

# Comments are interesting because they are helpful
# However too long of comments about code make the code difficult to read
# Be concise
# The Tidyverse style recommends explaining the "why" not the "what" or "how"

# Good

# An action is chosen for each fish
what_do <- switch(caught_fish,
                  large_trout = "eat",
                  small_trout = "return",
                  carp = ,
                  perch = "return",
                  shoe = )

# Bad
# This is the switch function with takes the variable "caught_fish" and then 
# assigns a value to variable what_do. These values assigned to what_do are
# "eat" for large_trout & "return" for small_trout, carp and perch.
# Shoe returns a NULL
what_do <- switch(caught_fish,
                  large_trout = "eat",
                  small_trout = "return",
                  carp = ,
                  perch = "return",
                  shoe = )

# Spacing  ---------------------------
# Refer to https://style.tidyverse.org/index.html
# Especially about spacing!

# Good
mean(c(1, 1, 2, 3))

# Bad 
mean (c(1,1,2,3))

# Functions within functions  ---------------------------

# In general it is easier to read variable assignments 
# then functions within functions.

# Compare to Q1.1.24

# Good
set.seed(1234)
n_brain_funcs <- 8
interact_sims <- rbeta(n_brain_funcs^2, shape1 = 2, shape2 = 10)
interactions <- matrix(interact_sims, n_brain_funcs, n_brain_funcs)

# Bad
set.seed(1234)
n_brain_funcs <- 8
interactions <- matrix(rbeta(n_brain_funcs^2, shape1 = 2, shape2 = 10),
                       n_brain_funcs, n_brain_funcs)

# Making packages with good documentation  ---------------------------

# Place on github.com, gitlab.com, or etc.
# Write good documentation with Markdown & RMarkdown
# Learn how to use version control with git

# Example:
# https://github.com/mdnunez/PIPS_class_example