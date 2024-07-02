import numpy as np
import scipy.stats as stats

# Dati
media_campionaria = 70
deviazione_standard_popolazione = 2
dimensione_campione = 90
livello_confidenza = 0.95

# Calcolo del valore critico Z
z_alpha_2 = stats.norm.ppf(1 - (1 - livello_confidenza) / 2)

# Calcolo dell'errore standard
errore_standard = deviazione_standard_popolazione / np.sqrt(dimensione_campione)

# Calcolo dei limiti dell'intervallo di confidenza
intervallo_inferiore = media_campionaria - z_alpha_2 * errore_standard
intervallo_superiore = media_campionaria + z_alpha_2 * errore_standard

# Output
print(f"Intervallo di confidenza al {livello_confidenza*100}%: [{intervallo_inferiore:.4f}, {intervallo_superiore:.4f}]")
