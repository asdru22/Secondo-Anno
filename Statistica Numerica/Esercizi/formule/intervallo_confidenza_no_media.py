import numpy as np
from scipy.stats import norm

# Parametri del problema
n = 90          # Dimensione del campione
sigma = 1.5     # Deviazione standard della popolazione (nota)
alpha = 0.05    # Livello di significatività
x_bar = 0.95    # Media campionaria

# Calcolo del valore critico (quantile) per la distribuzione normale
z_alpha = norm.ppf(1 - alpha / 2)

# Calcolo degli estremi dell'intervallo di confidenza
margin_of_error = z_alpha * sigma / np.sqrt(n)
c1 = x_bar - margin_of_error
c2 = x_bar + margin_of_error

# Stampa dei risultati
print(f'Intervallo di confidenza al 95% per la media μ: [{c1:.6f}, {c2:.6f}]')
