## Exam Solutions (R Part) - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 30-Jan-22       Hannes Rosenbusch             Original code
# 08-Feb-22     Michael D. Nunez           Addition of new problems
# 11-Feb-22     Michael D. Nunez           Extra grading rubric comments
# 15-Feb-22     Michael D. Nunez             Add libraries, extra comments
# 21-Feb-22     Michael D. Nunez           Comment fix
# 02-Feb-23     Michael D. Nunez          Fixing solution for E.R2


library(titanic)
library(ggplot2)
library(dplyr)

#  Paper copy also submitted. -Michael

# -0.25 points if missing brackets
# -0.25 points if new variable names broke a function

# E.R1
?median
#x and na.rm

# E.R2
is_tensor <- function(x) {
  if(!is.array(x)){
    stop("Input must be an array")
  }
  if(sum(length(dim(x)) <= 2))  {
    return(FALSE)  }
  else { 
    return(TRUE) 
  }
}
# Tests for all student answers
test_array1 <- array(c(2,4))
is_tensor(test_array1) # FALSE
test_array2 <- array(1:3, c(2,4,3,4))
is_tensor(test_array2) # TRUE
not_array <- list()
is_tensor(not_array) # ERROR

# E.R3
library(titanic)
was_there_a <- function(search_term) {
  check <- grepl(search_term, titanic_data$Name[titanic_data$Sex == "male"])
  return (sum(check) > 0)
}
# We used these test cases for every answer
was_there_a("Karolina") # FALSE
was_there_a("Owen") # TRUE
was_there_a("Mr") # TRUE, unless students have a special stop function
was_there_a("James") # TRUE
was_there_a("Hippopotamus") # FALSE



#I awarded half points if they attempted. 0.25 awarded for some pseudocode. 
# 0.75 points if they were extremely close. This is an example of extremely close:

was_there_a <- function(search_term){
  male_titanic <- subset(titanic_train,Sex == "male") 
  for (i in male_titanic){ 
    name <- grepl(search_term, male_titanic$Name, fixed = TRUE) 
  }
  print(name) # any() was missing from this students' solution
}

# E.R4
nfirst <- 132
nsecond <- 5
nthird <- 360
normal_draws <- rnorm(nfirst*nsecond*nthird)
huge_array <- array(normal_draws, dim = c(nfirst, nsecond, nthird))
subset_array <- huge_array[,,c(101:343)]
dim(subset_array)

# Alternate one line
my_subset <- array(rnorm(132*5*360),360)[101:343]
dim(my_subset)

# Half points if some rnorm() values are repeating but it returns the correct array size
# E.g. comment: "Half points because some rnorm() values are repeating in the elements of my_array. rnorm(132*5*360) would avoid repetition."
# 0.5 points only if no indexing but everything else correct

# E.R5
df <- titanic::titanic_train
sum(df$Age < 30, na.rm = TRUE) / sum(!is.na(df$Age)) * 100
# 53.78151
# This is also full points, the wording of the question does not make it clear what to use in the denom:
sum(df$Age < 30, na.rm = TRUE) / sum(length(df$Age)) * 100
# 43.09764

# Multiplying by 100 not necessary for full points

# E.R6
# The comment line is too detailed.
# The one line with a function within function within function within function is difficult to read

# Using dplyr pipes in the solution to change the one-liner is fine
# Half points if not mentioning the comment

# E.R7

library(ggplot2)
chick_weight  <- ChickWeight

# filter for time point 21
chick21 <- chick_weight  %>% filter(Time == 21)

# Converting Time to factor variable
chick21$Time <- as.factor(chick21$Time)

# Create violin plot
ggplot(chick21, aes(x = Time, y = weight)) + geom_violin() 
# Full points if x-axis and y-axis are flipped


a <- length(unique(chick_weight$Chick))
b<- length(chick21$Chick)
a-b
# 5 missing


# -0.25 points if incorrect number of chickens
# Comment example: "Note that a single chicken had multiple rows, so the number of chickens is incorrect."

# E.R8
year <-seq(-60 , 0, 20)
people <- rep(c("Roman"), 4)
government <- rep(c("republic","empire"), each=2)
data.frame(year,people,government)

# E.R9
# Base R way
df <- titanic::titanic_train
df$leo <- df$Survived == 0 & df$Pclass == 3
sum(df$leo)
#327 

# One dplyr way:
titanic_df <- titanic_train %>%
  mutate(leo = Pclass == 3 & Survived == 0)
sum(titanic_df$leo) # answer is 372

# Half points if the sum is left out

# E.R10
vec <- paste0("Student", 1:5) #paste() without argument gives a space
vec <- gsub("Student", "Master", vec)
#OR
student_string <- paste("Student", 1:5, sep = "")
master_string <- gsub("Student", "Master", student_string)

# 0.5 points for a space between Student and the number / Master and the number
# 0.25 for a space and only the first part of the question answered. 

# E.R11
library(dplyr)
1000 %>% rnorm() %>% abs() %>% sqrt() %>% hist()

# 0.5 points for the first missing pipe

# E.R12

# Answer: they are using `set.seed(1234)` within the for loop, meaning that
# at every iteration, `set.seed(1234)` is called before `sample(...)`.
# Because of this, the output of `sample()` will always be the same,
# in this case `c(2, 4, 6)`, which is not c(5, 5, 5), and so `all_five`
# always remains `0.`

# Fix:
num_rolls <- 1000
all_five <- 0
set.seed(1234)
for(index in 1:num_rolls){
  dice_roll <- sample(1:6, 3, replace = TRUE)
  if(all(dice_roll == 5)){
    all_five <- all_five + 1
  }
}

# Half points if set.seed is missing.
# Example: "set.seed(1234) should be outside the for loop in order to get the same values as your friend. However everything else is correct."

# E.R13
new_data <- titanic_train %>%
  filter(Pclass == 3) %>%
  arrange(desc(Fare))
new_data

# E.R14

set.seed(11)
x <- rnorm(20)
r <- rnorm(20)
y <- 1 + x + r

plot(x, y, xlab="Independent variable", ylab="Dependent variable")

#E.R15

draws <- rnorm(100) # No points deducted if this line is missing, due to wording of question
while (min(draws) > -5) {
  draws <-rnorm(100)
  if (max(draws) > 5) {
    print("Positive outlier found!")
  }
}
min(draws)
# It is easy to test this by running the student solution a couple of times and 
# also testing what the min(draws) is
# However most student solutions look like the code above.

# Half points if using two different random normal draws

#E.R16
# The variable names are uninformative. = is used for variable assignments instead of <-

# Half points if only <- mentioned



