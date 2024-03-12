import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('ice_cream.csv')
print(df.describe())

x = df["Temperature"]
y = df["Ice Cream Profits"]

plt.scatter(x, y)

plt.xlabel("Temperature")
plt.ylabel("Profitti")
plt.show()

plt.boxplot(x)
plt.show()

plt.subplot(1, 2, 1)
plt.hist(x, bins=20)
plt.subplot(1, 2, 2)
plt.hist(y, bins=20)

plt.savefig("cfr.png")
plt.show()
