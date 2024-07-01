import numpy as np
from scipy.stats import rv_discrete

# Dati della distribuzione discreta
# Valori possibili (da 1 a 6)
valori = np.array([1, 2, 3, 4, 5, 6])
# Probabilità uguali per ciascun valore
probabilita = np.full(len(valori), 1 / len(valori))

# Creazione della distribuzione discreta
distribuzione = rv_discrete(name='uniform', values=(valori, probabilita))

# Calcolo della probabilità di un valore specifico
valore_scelto = 3
probabilita_valore_scelto = distribuzione.pmf(valore_scelto)

# Calcolo della media e varianza
media = distribuzione.mean()
varianza = distribuzione.var()

# Stampa dei risultati
print(f"Distribuzione: valori = {valori}, probabilità = {probabilita}")
print(f"Probabilità di ottenere il valore {valore_scelto}: {probabilita_valore_scelto:.6f}")
print(f"Media della distribuzione: {media:.6f}")
print(f"Varianza della distribuzione: {varianza:.6f}")
