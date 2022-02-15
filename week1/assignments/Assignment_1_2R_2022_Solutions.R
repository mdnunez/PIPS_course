## Assignment 1.2R Solutions - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 03/02/22        Michael Nunez      Derived from students solutions

## Q1.2R.1

# Some helpful websites:

# https://gallery.rcpp.org/articles/simulate-multivariate-normal/
# https://en.wikipedia.org/wiki/Multivariate_normal_distribution#Computational_methods
# https://stackoverflow.com/questions/35026560/r-chol-and-positive-semi-definite-matrix
# https://en.wikipedia.org/wiki/Cholesky_decomposition

# This solution was derived from students' solutions


mu <- c(1, 2, 3)  # Pick at random

Sigma <- matrix(data = c(2, -1, 0, -1, 2, 1, 0, 1, 2), 3)  # Pick and random
#BUT
#Check if it is a "positive definite" matrix
isSymmetric(Sigma) #To test whether Sigma is symmetric 
min(eigen(Sigma)$values) < 1 #To test whether Sigma is positive definite

matrix_L <- chol(Sigma)
standard_normal <- rnorm(3)
mv_samples <- mu + matrix_L %*% standard_normal # This is the key step
mv_samples

# For mvrnorm install and load the MASS package

# install.packages("MASS")
library(MASS)

# Compare your code to mvrnorm from the MASS package

# Note it is better to write your own code in a R function,
# but we didn't get to functions yet before this assignment.

start_time_myscript <- Sys.time()
matrix_L <- chol(Sigma)
standard_normal <- rnorm(3)
mv_samples <- mu + matrix_L %*% standard_normal # This is the key step
stop_time_myscript <- Sys.time()
run_time_myscript <- stop_time_myscript - start_time_myscript
run_time_myscript 

#Run time for mvrnorm:
start_time_mvrnorm <- Sys.time()
mvrnorm(n = 1, mu, Sigma)
stop_time_mvrnorm <- Sys.time()
run_time_mvrnorm <- stop_time_mvrnorm - start_time_mvrnorm
run_time_mvrnorm

#I ran the codes for a few times, and found that mvrnorm is much faster than my scripts.
