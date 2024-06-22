from scipy import integrate
import numpy as np
from scipy.integrate import quad

# Definizione della PDF
def f(x):
    return 3/x**4

# Definizione dei limiti di integrazione
limite_inferiore = 0.2
limite_superiore = 0.65

# Calcolo dell'integrale
risultato, errore_assoluto = integrate.quad(f, limite_inferiore, limite_superiore)

# Calcolo della media
media, _ = quad(lambda x: x * f(x), 1, np.inf)

# Calcolo della varianza
varianza, _ = quad(lambda x: ((x - media) ** 2) * f(x), 1, np.inf)

# Stampare il risultato
print(f"Probabilità che x sia nell'intervallo [{limite_inferiore}, {limite_superiore}]: {risultato}")
print(f"Errore stimato: {errore_assoluto}")
print(f"Media della distribuzione: {media:.6f}")
print(f"Varianza della distribuzione: {varianza:.6f}")