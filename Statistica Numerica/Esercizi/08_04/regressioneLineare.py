import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

data = pd.DataFrame({
    "t": [1, 2, 3, 4, 5],
    "h": [3.53, 4.76, 7.6, 8.8, 11.25]
})

t = np.array(data["t"])
h = np.array(data["h"])

# visualizzazione
plt.plot(data["t"], data["h"], 'o')
plt.grid()
plt.xlabel("t")
plt.ylabel("h")
plt.show()

# scelta del modello
model = LinearRegression()

# Addestramento, il reshape trasforma i vettori in vettori colonna
model.fit(t.reshape((-1, 1)), h)

# Scegliamo un nuovo dato, la doppia quadra crea un vettore colonna
tNew = np.array([[6]])

# Prediciamo
hPredict = model.predict(tNew)
print(f"{hPredict=}")
