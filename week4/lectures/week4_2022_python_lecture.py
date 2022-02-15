# Week 4 PsychoPy lecture - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 31-Jan-22        Michael Nunez               Original code

import os
import numpy as np
import pandas as pd
import glob
import matplotlib.pyplot as plt

# Compare pandas to tidyverse functions

# Set out working directory
# Make sure to use / on Windows and not \ like usual
os.chdir('C:/Users/mnunez/OneDrive - UvA/Programming_in_Psychological_Science/Week4/psychopy/data')

# Find all .csv files using glob
for file_name in glob.glob('participant1*.csv'):
    print(file_name)

# Read a .csv file
my_exp_data = pd.read_csv('participant1_Assignment_example_2022_Jan_31_1215.csv')

# Find the size of my pandas dataframe
print(my_exp_data.shape)
# Or
print(np.shape(my_exp_data))

# Print the head of the data
print(my_exp_data.head)  # Hmmm, first row is not data

real_exp_data = my_exp_data.drop(0)  # Drop the first row using drop() from pandas

# Find and drop where relevant data is NAN
real_exp_data = real_exp_data.dropna(subset=['correct_answer'])

# Print the head of the data
print(real_exp_data.head())

# Return question text in a vector
question_text = real_exp_data['question']

# Return the correct answer in a vector
correct_answer = real_exp_data['correct_answer']

# Return the participant-given answer in a vector
participant_answer = real_exp_data['key_resp.keys']

# Find where the participant inputted the correct answer
trial_accuracy = (correct_answer == participant_answer)

# Return the participant response time in seconds
participant_rts = real_exp_data['key_resp.rt']

# Now open data and do these things in a for loop
mean_rts = np.array([])
mean_accuracies = np.array([])
for file_name in glob.glob('participant1*.csv'):
    my_exp_data = pd.read_csv(file_name)
    real_exp_data = my_exp_data.drop(0)
    real_exp_data = real_exp_data.dropna(subset=['correct_answer'])
    mean_acc = np.mean((real_exp_data['correct_answer'] == real_exp_data['key_resp.keys']))
    mean_accuracies = np.append(mean_accuracies, mean_acc)
    mean_rt = np.mean(real_exp_data['key_resp.rt'])
    mean_rts = np.append(mean_rts, mean_rt)

# IPython magic function:
# %pylab
size_font = 10
plt.figure()
experimental_run = np.arange(1, np.size(mean_rts) + 1)
plt.scatter(experimental_run, mean_rts)
plt.xlabel('Experimental run', fontsize=size_font)
plt.ylabel('Mean response time (secs)', fontsize=size_font)
plt.xticks(experimental_run)
plt.tick_params(axis='both', which='major', labelsize=size_font)
plt.savefig('Participant1_results.png', dpi=300)
