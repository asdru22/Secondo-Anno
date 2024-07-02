import scipy.stats as stats

# Parametri
n = 15      # Numero di prove
k = 7       # Numero di successi desiderati
p = 0.75    # Probabilità di successo

# Calcola la probabilità usando la distribuzione binomiale
probabilita = stats.binom.pmf(k, n, p)

print(f"P di {k} su {n} è: {probabilita:.4f}")
