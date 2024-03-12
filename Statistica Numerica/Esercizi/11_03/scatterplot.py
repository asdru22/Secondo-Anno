import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

n = 1000

np.random.seed(66)

x1 = np.random.normal(0, 1, (n,))
x2 = np.random.normal(1, 0.2, (n,))

# scatterplot
plt.scatter(x1, x2)
plt.grid()
plt.title("scatterplot")
plt.show()

# boxplot
plt.boxplot(x1)
plt.show()

# istogramma
plt.hist(x1, bins=100)
plt.show()
