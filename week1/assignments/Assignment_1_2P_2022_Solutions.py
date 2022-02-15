# Assignment 1.2P Solutions - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 14-Jan-22        Michael Nunez               Original code

import numpy as np
import pandas as pd

# Q1.2P.1
my_numpy_array = np.array([5, 6, 1])
# import numpy as np

# Q1.2P.2
another_array = np.zeros((2, 4, 6))
print(another_array[0, 3, -1])

# Q1.2P.3
another_array = np.zeros((2, 4, 6))
new_array = another_array
new_array[1, 2, 2] = 1
print(another_array[1, 2, 2])
# Python does not make a true copy of the array in the second line
# To do this properly use:
another_array = np.zeros((2, 4, 6))
new_array = np.copy(another_array)
new_array[1, 2, 2] = 1
print(another_array[1, 2, 2])
print(new_array[1, 2, 2])

# Q1.2P.4
# %paste
# This function does not work in a script because it is not a Python function

# Q1.2P.5
# %cd - change the working directory
# %pwd - print the working directory
# %ls - list the concents of the working directory
# %who - list current workspace variables
# Alternate answer:
# %whos - list current workspace variables

# Q1.2P.6
# pip install pip-install-test

# Q1.2P.7
sample_scores = np.array([1, 6, 7, 8, 9, np.nan])
print(np.mean(sample_scores))
# Numpy computes the sum of a NaN number as NaN
# Correct answer
print(np.nanmean(sample_scores))
# 6.2

# Q1.2P.8
square_array = np.reshape(np.arange(1, 17) ** 2, (2, 2, 2, 2))
# Note that square_array is in a different order to Q1.1.31 in R

# Q1.2P.9
insect_sprays = pd.read_csv('InsectSprays.csv').to_dict()  # Note the use of pd.DataFrame.to_dict()
insect_sprays.keys()

# Q1.2P.10
np.random.seed(1234)  # Set the random seed
speed_sec = np.zeros(10)
sim_speed = np.random.uniform(size=5)  # Speed simulation in seconds
speed_sec[::2] = sim_speed * 10
speed_sec[1::2] = sim_speed

# One solution:
all_data = {"language": np.tile(np.array(['R', 'Python']), 5),
            "code_type":
                np.repeat(np.array(['forloop1', 'forloop2', 'forloop3',
                                    'forloop4', 'forloop5']), 2),
            "speed_sec": speed_sec}
my_data = pd.DataFrame(all_data)
print(my_data)
