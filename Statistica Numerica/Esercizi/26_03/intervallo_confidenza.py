import numpy as np
from scipy.stats import norm, t

# Parametri della distribuzione
n = 90         # Dimensione del campione
mu = 70        # Media della popolazione
sigma = 1.5      # Deviazione standard (nota)
alpha = 0.05   # Livello di significatività

# Generazione del campione
np.random.seed(0)  # Per riproducibilità
x = np.random.normal(mu, sigma, n)

# Calcolo della media del campione
m = np.mean(x)

# Calcolo della deviazione standard del campione
s = np.std(x, ddof=1)  # ddof=1 per la deviazione standard campionaria

# Calcolo del valore critico (quantile) per la distribuzione normale (σ noto)
z_alpha = norm.ppf(1 - alpha / 2)

# Calcolo del valore critico (quantile) per la distribuzione t di Student (σ sconosciuto)
t_alpha = t.ppf(1 - alpha / 2, df=n-1)

# Calcolo degli estremi dell'intervallo di confidenza con σ noto
c1_sigma_noto = m - z_alpha * sigma / np.sqrt(n)
c2_sigma_noto = m + z_alpha * sigma / np.sqrt(n)

# Calcolo degli estremi dell'intervallo di confidenza con σ sconosciuto
c1_sigma_sconosciuto = m - t_alpha * s / np.sqrt(n)
c2_sigma_sconosciuto = m + t_alpha * s / np.sqrt(n)

# Stampa dei risultati
print(f'Intervallo di confidenza (σ noto): [{c1_sigma_noto:.6f}, {c2_sigma_noto:.6f}]')
print(f'Intervallo di confidenza (σ sconosciuto): [{c1_sigma_sconosciuto:.6f}, {c2_sigma_sconosciuto:.6f}]')
