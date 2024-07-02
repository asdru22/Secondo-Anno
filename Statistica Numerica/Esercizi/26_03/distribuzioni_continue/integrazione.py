import math

from scipy import integrate
import numpy as np
from scipy.integrate import quad

# Definizione della PDF
def f(x):
    return math.exp(x**2)

# Definizione dei limiti di integrazione
limite_inferiore = 0
limite_superiore = 1

# Calcolo dell'integrale
risultato, errore_assoluto = integrate.quad(f, limite_inferiore, limite_superiore)

# Calcolo della media
media, _ = quad(lambda x: x * f(x), limite_inferiore, limite_superiore)

# Calcolo della varianza
varianza, _ = quad(lambda x: ((x - media) ** 2) * f(x), limite_inferiore, limite_superiore)

# Stampare il risultato
print(f"Probabilità x in [{limite_inferiore}, {limite_superiore}]: {risultato}")
print(f"Media della distribuzione: {media:.6f}")
print(f"Varianza della distribuzione: {varianza:.6f}")