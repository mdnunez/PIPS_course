# Assignment 2.2P Solutions - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 28-01-2022       Michael Nunez               Original code

import numpy as np
from time import time, perf_counter

# Q2.2P.1

# solution given by a student
two_dice = np.random.choice(np.arange(1, 7), 2, replace=True)

if sum(two_dice) % 2 == 0:
    score = sum(two_dice) * min(two_dice)
else:
    score = -3 * sum(two_dice)

# Q2.2P.2
# There are a few correct solutions

# solution given by a student
double_plus = np.array([])
for i in range(3, 18, 2):
    double_plus = np.append(double_plus, i)
print(double_plus)

# my solution
double_plus = np.array([])
for i in range(0, 8):
    double_plus = np.append(double_plus, 2 * i + 3)
print(double_plus)


# Q2.2P.3
# This function does not run. Python CAN see global variables in a function. However because the line
# grass = "blue"
# is in the function. The global variable is not recognized.
# In R this would be possible because the global variable is found even when the variable grass is defined later
# Read more: https://www.w3schools.com/python/gloss_python_global_variables.asp

# Just remove the global variable. I edited a line to keep the intended behavior.
def color_it(color_me, grass_me):
    color_me = "blue"
    grass_me = "green"  # This could be "blue"
    colorful_items = np.array([(color_me, grass_me)])
    return colorful_items


sky = "grey"
ground = "brown"
these_items = color_it(sky, ground)
print(these_items)


# Q2.2P.4
# answer derived from a student:
# With a class, one can create a new type of object. One can create attributes for this object,
# like variables and functions. One can create new variables that are assigned to this class.
# Read more: https://docs.python.org/3/tutorial/classes.html

# Complex number class
class ComplexNum:
    """Creates a complex number"""
    numtype = 'complex'

    def __init__(self, realpart, imagpart):
        self.r = realpart
        self.i = imagpart

    def vec_length(self):
        return np.sqrt(self.r ** 2 + self.i ** 2)

    def phase_angle(self):
        return np.arctan2(self.i, self.r)  # np.arctan() may not choose the correct quadrant


my_num = ComplexNum(3.0, 4.0)
print(my_num)
print((my_num.r, my_num.i))
print(my_num.numtype)
print(my_num.vec_length())
print(my_num.phase_angle())


# Q2.2P.5
# See also solution to Q2.1.32 in the R assignment
def nthroot(number, n, guess=1):
    next_guess = guess - ((guess ** n - number) / (n * guess ** (n - 1)))
    while np.abs(next_guess - guess) > .000001:  # Run until a precision of .000001
        guess = next_guess  # This line keeps track of what guess comes first
        next_guess = guess - ((guess ** n - number) / (n * guess ** (n - 1)))
    return guess


# Test the function
print(nthroot(10, 4))
print(10 ** (1 / 4))

print(nthroot(274985, 52))
print(274985 ** (1 / 52))

# Q2.2P.6

# Solution derived from a student, note that time.perf_counter() has more precision than time.time()
start_time = perf_counter()
nthroot(4214, 5)
end_time = perf_counter()
duration_nthroot = end_time - start_time
print(duration_nthroot)

start_time = perf_counter()
4214 ** (1 / 5)
end_time = perf_counter()
duration_base = end_time - start_time
print(duration_base)

# But it is fine if you use time.time(), you would just need to run the code in a loop, like this:
interations = 100000
start_time = time()
for i in range(interations):
    nthroot(4214, 5)
duration_nthroot = time() - start_time
print(duration_nthroot)

start_time = time()
for i in range(interations):
    4214 ** (1 / 5)
duration_base = time() - start_time
print(duration_base)


# Q1.2P.7

# This is somewhat difficult to conceptualize because of the "recursive" nature of the quicksort function
# I found this more difficult than other questions, something like will not be on your exam

# Solution derived from pseudocode: https://textbooks.cs.ksu.edu/cc310/7-searching-and-sorting/19-quicksort-pseudocode/
def partition(my_array, start, end):
    pivot_value = my_array[end]
    pivot_index = start
    for index in range(start, end + 1):  # loop index, starting at start + 1
        if my_array[index] <= pivot_value:
            temp = my_array[index]  # current pivot is swapped places with the value smaller than start value
            my_array[index] = my_array[pivot_index]
            my_array[pivot_index] = temp
            pivot_index = pivot_index + 1
    return pivot_index - 1


def quicksort(my_array, start, end):
    if start >= end:  # nothing to sort
        return my_array
    else:
        pivot_index = partition(my_array, start, end)
        my_array = quicksort(my_array, start, pivot_index - 1)
        my_array = quicksort(my_array, pivot_index + 1, end)
    return my_array  # sorted array


size_array = 100
unsorted = np.random.normal(size=size_array)
is_it_sorted = quicksort(unsorted, start=0, end=(size_array-1))

# Here is a cool test of these functions using assert() in Python
assert(is_it_sorted[0] == np.min(is_it_sorted))
assert(is_it_sorted[-1] == np.max(is_it_sorted))
if size_array > 1:
    assert(is_it_sorted[1] == np.min(is_it_sorted[is_it_sorted != np.min(is_it_sorted)]))
    assert(is_it_sorted[-2] == np.max(is_it_sorted[is_it_sorted != np.max(is_it_sorted)]))

# Q1.2P.8 - Q1.2P.10

# Some answers derived from a student
# Note you should place this function in its own Python script called "sequences.py"
def fibonacci(n):
    """
    This code returns the first n Fibonacci numbers.

    Parameters
    ----------

    n: a integer denote the size of the output numpy vector

    """
    result = np.array([])  # This is an empty array so the last line of this function works
    if n < 1:
        result = "n must be >= 1"
    if n == 1:
        result = np.array([0])
    if n >= 2:
        result = np.array([0, 1])
    for i in range(2, n):
        result = np.append(result, result[i - 1] + result[i - 2])
    return result


# We might keep a few definitions in their own .py file to group related functions
# We can then easily find, import, and share modules

if __name__ == '__main__':
    # These assert lines will run if this is run as a script
    # These lines will not run if it is imported
    assert fibonacci(1) == 0
    assert fibonacci(10)[-1] == 34
    assert fibonacci(5)[-1] == 3
    assert fibonacci(20)[-1] == 4181
    assert fibonacci(-20) == "n must be >= 1"
    print("Tests passed")


