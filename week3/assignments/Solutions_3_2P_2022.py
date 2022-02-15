# Assignment 3.2P Solutions - 2022 Programming in Psychological Science
#
# Record of Revisions
#
# Date            Programmer              Descriptions of Change
# ====         ================           ======================
# 14-Jan-22     Hannes Rosenbusch              Original code
# 22-Jan-22     Michael D. Nunez    plt.figure() addition and imports at top
# 03-Feb-22     Michael D. Nunez     Question additions and more comments

import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
from sklearn.datasets import load_wine


# Q3.2P.1

numbers = np.random.normal(100, 10, 100)

plt.figure()
plt.boxplot(numbers)
plt.savefig('my_numbers_boxplot.png')

plt.figure()
sns.violinplot(data=numbers)
sns.stripplot(data=numbers, jitter=True, color='red')
plt.savefig('my_numbers_violinplot.png')

# Answer given by a student:

# Answer: One half of the violinplot shows the distribution of numerical data. So one side/half
# displays the distribution shape of the data as a density curve (kernel density plot). Therefore,
# it also enables use to look at the density of variables. It is like a smoothed histogram but
# flipped by 90 degree.
# Answer: Although the violinplot looks somewhat messy, it captures similar information as
# the boxplot. Additionally, it displays the distribution of the data. Therefore, just from
# an informative point, the violin plot is better suited for my data.

# Q3.2P.2

plt.figure()
df = pd.read_csv(
    'https://raw.githubusercontent.com/hannesrosenbusch/schiphol_class/master/titanic.csv')
men_dead = sum((df["Survived"] == 0) & (df["Sex"] == "male"))
men_alive = sum((df["Survived"] == 1) & (df["Sex"] == "male"))
women_dead = sum((df["Survived"] == 0) & (df["Sex"] == "female"))
women_alive = sum((df["Survived"] == 1) & (df["Sex"] == "female"))
bar1 = plt.bar(["female", "male"], [women_alive, men_alive], color='tab:cyan')
bar2 = plt.bar(["female", "male"], [women_dead, men_dead],
               bottom=[women_alive, men_alive], color='coral')
plt.xlabel('Sex')
plt.ylabel('count')

# There are a few different methods to generate the legend,
# but one method is to use the plt.bar "handle" which the function
# plt.bar() returns.
# Note a figure / axis "handle" is how matplotlib knows what to change or use

plt.legend((bar1[0], bar2[0]), ("alive", "dead"), title="How did it go?",
           loc="upper left")
plt.savefig('titanic_survival.png')

# We did not grade on exact colors. Colors given by a student.
# We also did not grade based on legend position.

# Note there is also a method to use one subplot. This is a method
# now recommended by matplotlib
# ax = plt.subplot(111)

# Q3.2P.3

wine = load_wine()
df_wine = pd.DataFrame(data=wine.data, columns=wine.feature_names)

plt.figure()
fig, ax = plt.subplots(figsize=(9, 9))
ax.scatter(df_wine.malic_acid, df_wine.alcohol, s=60, alpha=0.7,
           edgecolors="k")
ax.set_xlabel("Maltc Acid")
ax.set_ylabel("Alcohol")
b, a = np.polyfit(df_wine.malic_acid, df_wine.alcohol, deg=1)
xseq = np.linspace(0, 7, num=100)
ax.plot(xseq, a + b * xseq, color="k", lw=2.5)

plt.savefig('wine_regression.png')

# Q3.2P.4

plt.figure()
fig, ax = plt.subplots(figsize=(10, 5), ncols=2)
sns.heatmap(df_wine.corr(), ax=ax[0])
sns.kdeplot(df_wine.alcohol, y=df_wine.color_intensity, ax=ax[1])
plt.savefig('Wine_heatmap.png')

# Q3.2P.5

# Answer given by a student


def my_plots(string):
    import numpy as np
    import matplotlib.pyplot as plt
    if (string == "yay"):
        time = np.arange(0.0, 2.0, 0.01)
        volt = 1 + np.cos(2 * np.pi * time)
        fig, ax = plt.subplots()
        ax.plot(time, volt)
        ax.set(xlabel='time (s)', ylabel='voltage (mV)',
               title='Thats a pretty informative graph!')
        ax.grid()
        return(plt.show())
    if (string == "eww"):
        time = np.array([1, 10, 2, 9, 3, 8, 4, 7, 5, 6])
        volt = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        fig, ax = plt.subplots()
        ax.plot(time, volt, color='red')
        ax.set(title='Thats not pretty informative!')
        return (plt.show())
    else:
        print("This function only takes “eww” or “yay”!!!")


# Useage examples
my_plots('eww')
plt.savefig('eww.png')
my_plots('yay')
plt.savefig('yay.png')

# Q3.2P.6 to Q3.2P.9 are very individual. Ask us for more feedback if you wish!
