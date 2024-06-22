import numpy as np
from scipy.stats import geom

# Parametri
p = 0.3  # Probabilità di successo

# Creazione della distribuzione geometrica
distribuzione = geom(p)

# Calcolo della PMF per i primi 10 valori
k = np.arange(1, 11)  # Numero di tentativi
pmf_valori = distribuzione.pmf(k)

# Calcolo della media e varianza
media = distribuzione.mean()
varianza = distribuzione.var()

# Stampa dei risultati
print(f"Distribuzione Geometrica con probabilità di successo p = {p}")
print(f"Valori di k: {k}")
print(f"PMF (funzione di massa di probabilità): {pmf_valori}")
print(f"Media: {media:.6f}")
print(f"Varianza: {varianza:.6f}")
