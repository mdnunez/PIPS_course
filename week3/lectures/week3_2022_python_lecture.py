# Week 3 Python lecture - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 26-Jan-22        Michael Nunez               Original code

import sys
import os
import numpy as np
import matplotlib.pyplot as plt
import pylint

# See matplotlib cheatsheets: https://matplotlib.org/cheatsheets/

# IPython magic function:
# %pylab

# os.chdir('C:/Users/mnunez/')


# matplotlib histograms
my_norm_data = np.random.normal(loc=100, scale=10, size=1000)
plt.figure()  # Always run this first
plt.hist(my_norm_data)

my_dependent = 10 + 3 * my_norm_data + np.random.normal(size=1000)
plt.figure()
plt.plot(my_norm_data, my_dependent)  # This is not a scatter plot but a line
plt.scatter(my_norm_data, my_dependent)  # This generates on top of the other figure

plt.figure()
plt.scatter(my_norm_data, my_dependent)
plt.xlabel('My normal data', fontsize=20)
plt.ylabel('My dependent data', fontsize=20)
plt.savefig("my_scatter_plot.png", dpi=300)

plt.close('all')  # Closes all my active windows

plt.figure()
x = np.linspace(0, 2 * np.pi, num=100)
np.size(x)
my_sine_wave = np.sin(x)
plt.plot(x, my_sine_wave)
plt.plot(x, np.cos(x), color='red', linewidth=3)

# Make some subplots
plt.figure()
fig, ax = plt.subplots(1, 2)
ax[0].plot(x, my_sine_wave)
ax[1].plot(x, np.cos(x), color='red', linewidth=3)

ax[1, 2].scatter(my_norm_data, my_dependent)
ax[1, 2].set_xlabel('My independent variable')
ax[1, 2].set_title('My scatter')
fig.suptitle('Multiple subplots', fontsize=10)  # fig.subtitle is the function I couldn't find during the video
plt.savefig("my_subplots.png", dpi=300)

# PEP 8 style recommendations

# pylint
sys.argv = ["pylint", "week3_2022_python_lecture.py"]
pylint.run_pylint()
