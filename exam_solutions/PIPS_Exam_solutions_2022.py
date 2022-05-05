# Exam Solutions (Python Part) - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 08-Feb-22     Michael D. Nunez                Original code

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#  Paper copy also submitted. -Michael

# -0.25 points for a missing bracket

# E.P1


def my_function(x, y):
    plt.scatter(x, y)
    plt.show()


# E.P2

all_data = {"year": list(range(-60, 20, 20)), "people": np.repeat("Roman", 4),
            "government": np.repeat(np.array(["republic", "empire"]), 2)}
my_data = pd.DataFrame(all_data)
print(my_data)


# E.P3
# write code to read a csv file
MyTitanicData = pd.read_csv('https://tinyurl.com/pipsTitanic')

for i in range(1, len(MyTitanicData)):
    should_it_print = (MyTitanicData["Sex"][i] == "female") & (
        MyTitanicData["Survived"][i] == 1) & (
        MyTitanicData["Sex"][i - 1] == "male")
    if should_it_print:
        print("I'll never let go, Jack. I'll never let go. I promise")

# E.P4
# Starting from an arbitrary number is fine because we don't actually specify in the Exam

def start_num(x):
    if x > 0:
        while x < 100:
            print(round(x, 2))
            x += 0.1

    elif x < 0:
        print("I'm not good at counting backwards")
        while x > -101:
            print(x)
            x -= 1

    else: # This statement is unncessary for full points
        print("Not sure what do with x = 0, try again!")


start_num(98)
start_num(-95)
start_num(0)
