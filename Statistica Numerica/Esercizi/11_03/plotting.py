import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

x = np.linspace(0, 10*np.pi, 100)
y = np.sin(x)
y2 = np.cos(x)

plt.plot(x, y,"ro-")
plt.plot(x, y2,"x--")
plt.grid()
plt.xlabel("x")
plt.ylabel("palle e bisf")
plt.legend(["strano","normale"])
plt.show()
