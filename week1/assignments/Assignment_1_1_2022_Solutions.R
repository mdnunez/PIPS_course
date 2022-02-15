## Assignment 1.1 Solutions - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 14-Jan-22        Michael Nunez               Original code

## Q1.1.1
# Michael's current working directory is in his memes folder on his Desktop.

## Q1.1.2
setwd("C:/Users/mnunez/Desktop/PIPS")

## Q1.1.3
help("rbinom")
# OR
help(rbinom)
# OR
?rbinom

## Q1.1.4
numeric_var <- 2022.2
StringVar <- "This is my string"
NewVar <- NumericVar + StringVar
# Error in NumericVar + StringVar : non-numeric argument to binary operator
# No you cannot add a numeric variable to a string variable

## Q1.1.5
a <- b <- ab <- ba <- c <- 1
ls()
# Variables a, b, ab, ba, and c were created, all equal to 1.
# There are 5 additional variables in the workspace

## Q1.1.6
FamousCode <- "Hellow world."
FamousCode
print(FamousCode)

## Q1.1.7
ThisVec <- c(2, FALSE, -1.243, "test")

## Q1.1.8
?rm
rm(list = ls())

## Q1.1.9
SampleScores <- c(1, 6, 7, 8, 9, NA)
mean(SampleScores)
# The sum of a NA value returns a NA value
?mean
mean(SampleScores, na.rm = TRUE)
# [1] 6.2

## Q1.1.10
?mvrnorm
install.packages("MASS")
library(MASS)
?mvrnorm

## Q1.1.11
apples <- 5
oranges <- 3
pineapples <- 6 # Try:
apples + pineapples
apples + Oranges
# Error: object 'Oranges' not found
# We cannot add apples and Oranges because no variable Oranges exists.
# Only the lowercase variable 'oranges' exists

## Q1.1.12
a1 <- "1"
a2 <- 1
a3 <- TRUE
b1 <- c(a1, a2)
b2 <- c(a1, a3)
b3 <- c(a2, a3)
b4 <- c(a1, a2, a3)
mode(a1)
# "character"
mode(a2)
# "numeric"
mode(a3)
# "logical"
mode(b1)
# "character"
mode(b2)
"character"
mode(b3)
"numeric"
mode(b4)
"character"
# R will convert a logical to a numeric if it is in the same vector as a numeric
# R will convert a logical to a character if it is in the same vector 
# as a character.
# R will convert a numeric to a character if it is in the same vector
# as a character.

## Q1.1.13
TheseNumbers <- seq(-10, 0)
TheseNumbers[3:6]

## Q1.1.14
?letters
length(letters)

## Q1.1.15
EqualIt <- letters
EqualIt <- letters
letters -> EqualIt
EqualIt == letters
# The first 3 lines assign letters to a variable named "EqualIt".
# The last line is a logical operator that tests whether each value of EqualIt is
# equal to each value of letters

## Q1.1.16
TestIt <- "wow"
TestIt[10] <- "doge"
TestIt
TestIt[2:9]
# Values are NA
# R fills missing values with NA

## Q1.1.17
sideA <- 4
sideB <- 5
angleAB <- pi / 3
sideC <- sqrt(sideA^2 + sideB^2 - 2 * sideA * sideB * cos(angleAB))
# [1] 4.582576

## Q1.1.18
prod(seq(1, 200, by = 2)) # Find the first 100 odd numbers then take the product
# 6.666309e+186

## Q1.1.19
set.seed(1234)
NRows <- sample(2:200, 1) # Find a random number of rows
NCols <- sample(2:200, 1) # Find a random number of columns
# Make a matrix (array)
MyArray <- matrix(data = seq(1, NRows * NCols), nrow = NRows, ncol = NCols) 
dim(MyArray)
# [1] 29 81
# 29 rows, 81 columns

## Q.1.1.20
set.seed(1234) # Replace with your student ID or special seed
# Find a random number from 1 to 10^(9) = 1000000000
MySpecialNum <- sample(1:10^9, 1) 
MySpecialNum
# Your answer will depend on your random seed

not_special <- sample(1:10^9, 1) # Find a random number from 1 to 10^(9) = 1000000000
not_special
not_special <- sample(1:10^9, 1) # Find a random number from 1 to 10^(9) = 1000000000
not_special
not_special <- sample(1:10^9, 1) # Find a random number from 1 to 10^(9) = 1000000000
not_special
# My random seed is changing each time

## Q.1.1.21
set.seed(1234) # Set the random seed
NTimepoints <- 1325
NElectrodes <- 201
EEGData1 <- matrix(runif(NTimepoints * NElectrodes), ncol = NElectrodes, nrow = NTimepoints)
dim(EEGData1)
EEGData2 <- matrix(runif(NTimepoints * NElectrodes), NTimepoints, NElectrodes)
dim(EEGData2)
EEGData3 <- matrix(runif(NTimepoints * NElectrodes), NElectrodes, NTimepoints)
dim(EEGData3)
EEGData4 <- matrix(ncol = NElectrodes, nrow = NTimepoints, data = runif(NTimepoints * NElectrodes))
dim(EEGData4)
# The third line is incorrect because when the variable assignments are out of order in a function,
# we must use the naming convention

## Q1.1.22
set.seed(1234) # Set the random seed
NRows <- 20 -> NCols # This is not a recommended way of writing R code, but fun
M <- matrix(runif(NRows * NCols), NRows, NCols)
colMeans(M)
# Unnecessary output for points:
# [1] 0.4719301 0.4449401 0.4833523 0.3740339 0.4132300 0.3734092 0.6236372 0.5748017 0.4500257
# [10] 0.6235001 0.5696341 0.4708097 0.4909029 0.4162937 0.5582784 0.5377373 0.4937143 0.5688638
# [19] 0.5425110 0.4573430

## Q1.1.23
matrix(c("string1", "string2"), 4, 4)

## Q1.1.24
# Only 3 lines
set.seed(1234) # Set the random seed
NBrainFuncs <- 8
InteractionMatrix <- matrix(rbeta(NBrainFuncs^2, shape1 = 2, shape2 = 10), NBrainFuncs, NBrainFuncs)

## Q1.1.25
set.seed(1234) # Set the random seed
NBrainFuncs <- 8
BetaSims <- rbeta(NBrainFuncs^2, shape1 = 2, shape2 = 10)
InteractionMatrix <- matrix(BetaSims, NBrainFuncs, NBrainFuncs)
interaction_matrix[7, 2]

## Q1.1.26
set.seed(1234) # Set the random seed
NBrainFuncs <- 8
BetaSims <- rbeta(NBrainFuncs^2, shape1 = 2, shape2 = 10)
InteractionMatrix <- matrix(BetaSims, NBrainFuncs, NBrainFuncs)
DiagIndex <- (diag(NBrainFuncs) == 1) # Create an index matrix of zeros and ones and find where the elements are 1 in the diagonal.
InteractionMatrix[DiagIndex] <- 0 # Set this index to zero in the interaction_matrix

## Q1.1.27
ThisIsATest <- c("This", "is", "a", "test")
rep(ThisIsATest, each = 2)

## Q1.1.28
set.seed(1234) # Set the random seed
SpeedSec <- rep(0, 10)
SimSpeed <- runif(5) # Speed simulation in seconds
SpeedSec[seq(1, 10, by = 2)] <- SimSpeed * 10
SpeedSec[seq(0, 10, by = 2)] <- SimSpeed
data.frame(
  Language = rep(c("R", "Python"), 5),
  CodeType = rep(c("forloop1", "forloop2", "forloop3", "forloop4", "forloop5"), each = 2),
  SpeedSec = SpeedSec
)

## Q1.1.29
set.seed(1234)
NStudents <- 50
Grades <- data.frame(1:NStudents, matrix(sample(8:20, NStudents * 2, TRUE) / 2, , 2))
names(Grades) <- c("student", "grade1", "grade2")
# One method
averageGrades <- rowMeans(Grades[, 2:3])
Grades$average <- averageGrades
passStudents <- subset(Grades, grade1 > 5 & grade2 > 5 & average >= 5.5)
passStudents$student

## Q1.1.30
FruitVec <- c("bananas", "apples")
gsub("a", ".", FruitVec)
# [1] "b.n.n.s" ".pples"

## Q1.1.31
BigArray <- array(seq(1, 16)^2, dim = c(2, 2, 2, 2))
dim(BigArray)

## Q1.1.32
setwd("C:/Users/me/Documents/PIPS")
write.csv(InsectSprays, "InsectSprays.csv", row.names = FALSE)
