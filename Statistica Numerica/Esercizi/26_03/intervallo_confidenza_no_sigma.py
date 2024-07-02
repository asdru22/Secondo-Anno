import numpy as np
import scipy.stats as stats

# Parametri della distribuzione
n = 90         # Dimensione del campione
mu = 70        # Media della popolazione
S = 1.5      # Deviazione standard (campionaria)
livello_confidenza = 0.95   # Livello di significatività

z_alpha_2 = stats.norm.ppf(1 - (1 - livello_confidenza) / 2)
errore_standard = S / np.sqrt(n)

# Calcolo dei limiti dell'intervallo di confidenza
intervallo_inferiore = mu - z_alpha_2 * errore_standard
intervallo_superiore = mu + z_alpha_2 * errore_standard

# Output
print(f"Intervallo di confidenza al {livello_confidenza*100}%: [{intervallo_inferiore:.4f}, {intervallo_superiore:.4f}]")
