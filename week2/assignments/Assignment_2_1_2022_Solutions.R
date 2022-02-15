## Assignment 2.1 Solutions - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 17-Jan-22       Michael Nunez               Original code
# 22-Jan-22       Enrico Erler              Solution additions
# 27-Jan-22       Michael Nunez           More solution additions

## Q2.1.1 

# this solution was given by a student
# does not run properly
# missing "=" in if statement

best_sport <- "voetbal" 
if (best_sport == "soccer") {
  print(TRUE)
}

## Q2.1.2

# shot to "right" leads to goal = 0 as if statement is not fulfilled (shot unequal to jumped)
# jumped to "forward" leads to goal = 1 because if statement is fulfilled again (shot unequal to jumped)
# jumped to "Left" leads to goal = 1 because "left" != "Left" (comparison is case sensitive)

## Q2.1.3

# multiple possible solutions. Make sure "missed" shots do not add a goal.

# this solution was given by a student
shot <- "missed"
jumped <- "right"
our_goals <- 1
their_goals <- 1
if (shot == "missed") {
  print("Coach OUTRAGED")
} else if (shot != jumped) {
  our_goals <- our_goals + 1
} else {
  our_goals <- our_goals + 0
  print("Sad sport fans.")
}
print(our_goals)

#By putting it as the first if statement, so that it does not get cancelled
#by shot != jumped. 

## Q2.1.4

# One problem is that an equals sign is missing in the line 
# } else if (shot = "missed") {
# Another problem is that the fixed function never prints "Everyone confused!"
# This is because one of the other statements will always be true.

# There are a few different solutions. Make sure "missed" shots do not add a goal.

# One solution
# Notice that this works well for all cases
# This is because of the SPECIFIC order of the if else statements
shot <- "left"
jumped <- "right"
our_goals <- 1
their_goals <- 1
if (!any(shot == c("right","left","missed"))) {
  print("Everyone confused")
} else if (shot == "missed") {
  print("Coach OUTRAGED")
} else if (shot != jumped) {
  our_goals <- our_goals + 1
} else if (shot == jumped) {
  our_goals <- our_goals + 0
  print("Sad sport fans.")
}

print(our_goals)

## Q2.1.5

#problem is that (small_numbers < 1.1) is a VECTOR of logicals (TRUE & FALSE statements). 
#easily changeable with all() function in if statement

small_numbers <- seq(0, 1, by=.001)
they_are_small <- FALSE
if (all(small_numbers > 1.1)) {
  they_are_small <- TRUE
}

## Q2.1.6
StudentID = 77777777 # Change to your student ID
set.seed(StudentID)
ages <-  runif (100,min=0,max=100)

IsWorking <- ifelse(ages < 66.33, "working", "retried")
print(IsWorking)
WorkingLogic <- (ages < 66.33)
print(WorkingLogic)

## Q2.1.7

# this solution was given by a student
#Replacing with loop
data_obs <- c(6, 7, 8, 9, -3000, 5, 1, 7, -4000)
for (i in 1:length(data_obs)) { #or 1:9
  if (data_obs[i]< 0) {
    data_obs[i] <- NA
  }
}
print(data_obs)

#Replacing without loop
data_obs = c(6, 7, 8, 9, -3000, 5, 1, 7, -4000)
data_obs <- replace(data_obs, data_obs < 0, NA)
print(data_obs)

#OR (there are few ways to do this)
data_obs = c(6, 7, 8, 9, -3000, 5, 1, 7, -4000)
data_obs[data_obs < 0] = NA
print(data_obs)

## Q2.1.8

# this solution was given by a student
two_dices <- sample(1:6, 2, replace=TRUE)
print(two_dices)
if ((sum(two_dices) %% 2) == 0) {
 wallet <- min(two_dices)*sum(two_dices)
}else{
 wallet <- -3*sum(two_dices)
}
print(wallet)

## Q2.1.9


my_num <- rnorm(1) #Random draw from rnorm
print(my_num)
if (my_num < 0){ #if-else statement
  my_num <- abs(my_num)
} else {
  my_num <- my_num + 1000
}
print(my_num)

## Q2.1.10
double_plus <- numeric()
for (i in 1:8) {
  double_plus[i] = 2*i + 1
}
print(double_plus)

## Q2.1.11
my_vector = c(3)
for (i in 1:9) {
  my_vector[i+1] = my_vector[i] + 2^i
}
print(my_vector)

## Q2.1.12

# this solution was given by a student
numeric_vec <- 1:10
print(numeric_vec)
final_sum <- 0
for (i in numeric_vec){
  if (i %% 2 == 0){
    final_sum <- final_sum - numeric_vec[i]
  }else {
    final_sum <- final_sum + numeric_vec[i]
  }
}
print(final_sum) 

# This is a solution without an if statement
numeric_vec <- 1:10 
print(numeric_vec)
final_sum <- 0
for (i in numeric_vec){
  one_or_negative_one <- 2*(i %% 2)-1
  final_sum <- final_sum + one_or_negative_one*numeric_vec[i]
}
print(final_sum) 

## Q2.1.13

# Technically permutations of dice should not matter
# so 1-2-3 is the same as 2-1-3. Noticed we use the sort() function

# The logic in the while loop can be a bit confusing
# There are a few different ways to do this
# I like to think rolling while NOT 6-6-6 AND NOT 1-2-3
# Notice I use the all() command

dice <- sample(1:6, 3, replace = TRUE)
while(!all(dice == c(6,6,6)) & !all(sort(dice) == c(1,2,3))) {
  dice <- sample(1:6, 3, replace = TRUE)
  print(dice)
}


## Q2.1.14

# Solution derived from a students' solution

money_made <- 0
roll <- 0

# Playing the game
while((money_made > -1000) & (money_made < 20) & (roll < 300)) {
  # Updating round info
  roll <- roll + 1
  
  # Playing the dice game
  dice <- sample(1:6, 3, replace = TRUE)
  # You could use ifelse() instead here:
  # Here is some commented code
  # ifelse(length(unique(dice)) == 3,
  #        money_made <- money_made + 1,
  #        money_made <- money_made - 3)
  if (length(unique(dice)) == 3) {
    money_made <- money_made + 1
  } else {
    money_made <- money_made -3
  }
}
print(roll) 
print(money_made)

# Usually you will lose money and roll 300 times.
# Never play this game.

## Q2.1.15

# hannes is the running index of the loop. A typical assignment is "i"
# "hannes" is a bad running index name as it is confusing since it is also a name (similar to the list)
# and does not convey easily that it is a running index. 

# this solution was given by a student
names <- c("Clara", "Bence", "Enrico", "Leonhard", "Michael")
for (i in names) {
  print(i)
}

# Alternatively you could use something like "name" for the index. 
# Although often coders use single letters for indices.
# This is a style choice for R
names <- c("Clara", "Bence", "Enrico", "Leonhard", "Michael")
for (who in names) {
  print(who)
}


## Q2.1.16
these_numbers = c(1,1,2,3,4,5,6,7,7,7)
# Bad code below
special <- numeric()
for (i in 1:length(these_numbers) ) {
  if (sum(these_numbers[1:i] == these_numbers[i]) == 1) {
    special <- c(special, i)
  }
}
print(special)

# Good code below
these_numbers = c(1,1,2,3,4,5,6,7,7,7)
# Bad code below, note we changed "i" to these_numbers[i]
special <- numeric()
for (i in 1:length(these_numbers) ) {
  if (sum(these_numbers[1:i] == these_numbers[i]) == 1) {
    special <- c(special, these_numbers[i]) # Note the change here
  }
}
print(special)

## Q2.1.17
#Bad code below
integers <- 2:1000
primes <- c()
for (i in integers) {
  is_prime <- TRUE
  for (j in 2:(i-1)) {
    if (i %% j == 0) {
      is_prime <- FALSE
    }
  }
  if (is_prime) {
    primes <- c(primes, i)
  }
}
primes
1 %% 0 == 0
# The integer 1 does not work in this code.
# 2:(i-1) results in 2:0, giving vector c(2, 1, 0). 
# Then line 1 && 0 == 0 gives a NA

2 %% 2 == 0
# The integer 2 does not return because 2:(i-1) returns as c(2, 1). 
# Then line 2 && 2 == 0 is true.

## Q2.1.18

# Answers will depend on your own style
# More informative variable name example:
verhulst <- function(x, rate_in, cap) rate_in*x*(cap-x)/cap
rabbits <- c(.001)
rate <- 2
capacity <- 1000
for (time in 2:50) rabbits[time] <- verhulst(rabbits[time-1], rate, capacity)
plot(rabbits, type='l', xlab='time', bty='n')

## Q2.1.19
exponential_array = array(dim = c(5, 5, 100))
for (i in 1:100) {
  exp_draws <- rexp(25, rate = i)
  exponential_array[, , i] = matrix(exp_draws, nrow = 5, ncol = 5)
}

## Q.1.1.20
exponential_array <- array(dim = c(5, 5, 100))
for (i in 1:100) {
  exp_draws <- rexp(25, rate = i)
  exponential_array[, , i] = matrix(exp_draws, nrow = 5, ncol = 5)
}
maximum_draws <- apply(exponential_array, 3, max)


## Q.1.1.21
t_tests <- replicate(100, t.test(rnorm(100, mean = 0.1)), simplify = FALSE)
p_values <- sapply(t_tests, function(i) i$p.value)

## Q2.1.22
marty_mcfly <- function(my_list) {
  print('Doc! Doc!')
  rm(list = my_list, pos = 1)
}
marty_mcfly('marty_mcfly')
# The marty_mcfly function prints "Doc! Doc!" 
# and then removes itself from the workspace
# You must mention the second part of the function

# Note that Marty McFly almost deletes himself in movie Back to Future

## Q2.1.23

# You never get the last print statement.
# This is because in the modulo we are dividing by 4, therefore, 
# there can never be a remainder of 4 because it is divisible by 4.


## Q2.1.24
caught_fish = "large_trout"
what_do <- switch(caught_fish,
                  large_trout = "eat",
                  small_trout = "return",
                  carp = ,
                  perch = "return",
                  shoe = )
print(what_do)
#"eat", switch statement indicates "eat" for large_trout

caught_fish = "unknown"
what_do <- switch(caught_fish,
                  large_trout = "eat",
                  small_trout = "return",
                  carp = ,
                  perch = "return",
                  shoe = )
print(what_do)
#NULL, the switch statement does not include unknown as an argument 

caught_fish = "carp"
what_do <- switch(caught_fish,
                  large_trout = "eat",
                  small_trout = "return",
                  carp = ,
                  perch = "return",
                  shoe = )
print(what_do)
#"return", 
# if an argument is missing the switch statement finds the next non-missing  element 
# See also help(switch)

caught_fish = "shoe"
what_do <- switch(caught_fish,
                  large_trout = "eat",
                  small_trout = "return",
                  carp = ,
                  perch = "return",
                  shoe = )
print(what_do)
#NULL, the argument is missing at the end of the arguments

## Q2.1.25

count <- function(number) {
  if (mode(number) != "numeric") {
    stop("`number` must be numeric." )
  }
  if (length(number) > 1) {
    stop("`number` must be of length 1" )
  }
  if (number < 0) {
    while (number > -100) {
      print(number)
      number <- number - 1
    }
  } else {
    while (number < 100) {
      if (number == 42) {
        print("I don't know the meaning of the universe")
        break
      }
      print(number)
      number <- number + 1
    }
  }
  return(invisible(number))
}

# This function counts up by one whole number when given a number greater than 0
# This function counts down by one whole number when given a number less than 0
# It stops counting when the number is greater than 100 or less than -100
# It stops counting if it reaches the number 42 exactly and prints
# "I don't know the meaning of the universe"

## Q2.1.26

count <- function(number) {
  if (mode(number) != "numeric") {
    stop("`number` must be numeric." )
  }
  if (length(number) > 1) {
    stop("`number` must be of length 1" )
  }
  if (number  != round(number)) {
    stop("`number` must be an integer." )
  }
  if (number  == 42) {
    warning("Will not start counting from 42." )
  }
  if (number < 0) {
    while (number > -100) {
      print(number)
      number <- number - 1
    }
  } else {
    while (number < 100) {
      if (number == 42) {
        print("I don't know the meaning of the universe")
        break
      }
      print(number)
      number <- number + 1
    }
  }
  return(invisible(number))
}

## Q2.1.27



# The debug(count) line will mean that it will debug that function every time
# count is run. 
# debug() opens the script if there is an error
# The undebug(count) line will turn of this behavior
# Try running debug(count) and then the bad line multiple times before turning
# off debug with undebug(count).


# This answer derived by an answer from a student

#It runs through chunks of code to find where is the error produced
#It can be helpful if we have an uninformative error message, or 
#if our function is super complex, and we want to find out where it breaks.


## Q2.1.28

# Answer derived from a student solution

# Writing possibly ordered function
vect_order <- function(vect_check) {
  # Get the length of the vector, e.g. the last element
  len <- length(vect_check)
  # Getting the minimum of the vector
  vect_min <- min(vect_check)
  # Getting the maximum of the vector
  vect_max <- max(vect_check)
  
  # Checking if possibly sorted
  if ((vect_check[1] == vect_min)  & (vect_check[len] == vect_max)) {
    print("Possibly sorted!")
  } else {
    print(FALSE)
  }
}

# Checking if the function works
vect_order(c(1,4,2,8,8))
vect_order(c(2,3,1,9))
vect_order(c(1))
vect_order(c(2,3,9,8))

## Q2.1.29

grass <- "green"
colorit <- function(color_me, grass_me) {
  grass_me <- grass
  color_me <- "blue"
  grass <- "blue"
  colorful_items = c(color_me, grass_me)
  return(colorful_items)
}
sky = "grey"
ground = "brown"
these_items = colorit(sky, ground)
sky2 = these_items[1]
ground2 = these_items[2]

# Answer derived from a student

#Grass is green, sky is grey, sky2 is blue, ground is brown, ground2 is green.
#Global grass stays green, and grass_me is called
#before local grass is defined.
#Even though local grass is assigned to blue, it doesn't matter because global grass was already assigned to grass_me
#The colorful items are essentially = c("blue", global_grass) == c("blue","green")
#The reason why is because there are different environments for variable names within
#a function and outside of it. If the variable is not 
#defined in the local environment (of the function),
#the function will scan the global environment first to see if there is such a variable
#before saying the variable does not exist. As such, the value of grass_me becomes the global variable grass, being "green".

## Q2.1.30

# The function does not work when sourced because the global variable grass does not exist.
colorit <- function(color_me, grass_me) {
  grass_me <- "green"
  color_me <- "blue"
  grass <- "blue" # Note that this line is unnecessary
  colorful_items = c(color_me, grass_me)
  return(colorful_items)
}
sky = "grey"
ground = "brown"
these_items = colorit(sky, ground)
sky2 = these_items[1]
ground2 = these_items[2]

## Q2.1.31

#student answer:
fibonacci <- function(n){
  fibonacci <- numeric(n)
  fibonacci[1:2] = c(0,1)
  if (n == 1){
    return(0)
  }
  if (n == 2){
    return(c(0,1))
  }
  else for(i in 3:n){  
    fibonacci[i]= fibonacci[i-1] + fibonacci[i-2]
  }
  return(fibonacci)
}
fibonacci(20)

## Q2.1.32

#student answer, note that ** is the same operation as ^
nthroot <- function(number, n, steps, guess = 1){
  for(i in 1:steps){ #steps indicates how often we iterate for the approximation
    guess[i+1] <- guess[i] - (guess[i]**n - number)/(n*guess[i]**(n-1))
  }
  guess[length(guess)] #print last element of iterated approximation
}

# Test the function
nthroot(10, 4, 1000)
10^(1/4)

# Test the function
nthroot(4, 10, 1000)
4^(1/10)

# Better way:

# Answer derived from the same student. This one potentially uses less steps
nthroot_new <- function(number, n, guess = 1){
  next_guess <- guess - (guess^n - number)/(n*guess^(n-1))
  while( abs(next_guess - guess) > .000001 ){ #run until a precision of .000001
    guess <- next_guess # This line keeps track of what guess comes first
    next_guess <- guess - (guess^n - number)/(n*guess^(n-1))
  }
  guess
}

# Test the function
nthroot_new(10,4)
10^(1/4)

# Test the function
nthroot_new(4,10)
4^(1/10)