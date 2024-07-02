import numpy as np
from scipy.stats import norm

# Parametri del problema
n = 64          # Dimensione del campione
sigma = 2     # Deviazione standard della popolazione (nota)
alpha = 0.95    # Livello di significatività
mu = 70      # Media campionaria

# Calcolo del valore critico (quantile) per la distribuzione normale
z_alpha = norm.ppf(1 - (1-alpha) / 2)
print(f"{z_alpha=}")

# Calcolo degli estremi dell'intervallo di confidenza
margin_of_error = z_alpha * (sigma / np.sqrt(n))
c1 = mu - margin_of_error
c2 = mu + margin_of_error

# Stampa dei risultati
print(f'Intervallo di confidenza al 95% per la media μ: [{c1:.6f}, {c2:.6f}]')
