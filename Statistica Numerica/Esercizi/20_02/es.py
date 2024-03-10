from scipy.integrate import quad
import numpy as np


# Definizione della funzione
def f(x):
    return np.exp(-x ** 2 / 8 + 45 * x - 4050)


# Calcolo dell'integrale definito
result, error = quad(f, 177, 182)
print("Valore dell'integrale:", result)
print("Errore stimato:", error)
