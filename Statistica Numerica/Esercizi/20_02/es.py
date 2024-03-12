from scipy.integrate import quad
import numpy as np


# Definizione della funzione
def f(x):
    return np.exp(2**x)


# Calcolo dell'integrale definito
result, error = quad(f, 0, 1)
print("Valore dell'integrale:", result)
print("Errore stimato:", error)
