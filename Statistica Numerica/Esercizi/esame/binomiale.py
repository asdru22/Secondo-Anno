import scipy.stats as stats

# Parametri
n = 120     # Numero di prove
k = 50   # Numero di successi desiderati
p = 0.33    # Probabilità di successo

# Calcola la probabilità usando la distribuzione binomiale
probabilita = stats.binom.pmf(k, n, p)
media = n*p
varianza = (n*p)*(1-p)

print(f"P di {k} su {n} è: {probabilita:.4f}")
print(f"Media: {media:.6f}")
print(f"Varianza: {varianza:.6f}")