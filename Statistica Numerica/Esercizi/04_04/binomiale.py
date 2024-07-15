import scipy.stats as stats

# Parametri
n = 120     # Numero di prove
k = 82    # Numero di successi desiderati
p = 0.67   # Probabilità di successo

# Calcola la probabilità usando la distribuzione binomiale
bin = stats.binom(n, p)
probabilita = bin.pmf(k)
media = bin.mean()
varianza = bin.var()
print(f"P di {k} su {n} è: {probabilita:.4f}")
print(f"Media: {media:.6f}")
print(f"Varianza: {varianza:.6f}")