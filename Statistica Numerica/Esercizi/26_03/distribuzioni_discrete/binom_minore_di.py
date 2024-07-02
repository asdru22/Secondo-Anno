import scipy.stats as stats

# Parametri
n = 100     # Numero di prove
k = 15      # Numero di successi desiderati
p = 0.1   # Probabilità di successo

# Calcola la probabilità usando la distribuzione binomiale
probabilita = 1-stats.binom.cdf(k-1, n, p)
media = n*p
varianza = (n*p)*(1-p)

print(f"P di {k} su {n} è: {probabilita:.4f}")
print(f"Media: {media:.6f}")
print(f"Varianza: {varianza:.6f}")