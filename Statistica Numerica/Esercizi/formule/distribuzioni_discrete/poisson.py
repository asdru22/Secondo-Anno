from scipy.stats import poisson

lambd = 25  # Media della distribuzione di Poisson

x = 10  # Numero di eventi di interesse

# Calcolo della probabilità utilizzando la distribuzione di Poisson
probabilita = poisson.pmf(x, mu=lambd)

# Calcolo della media e varianza della distribuzione di Poisson
media = poisson.mean(mu=lambd)
varianza = poisson.var(mu=lambd)

# Stampa dei risultati
print(f"Probabilità dato {x}: {probabilita:.6f}")
print(f"Media: {media:.6f}")
print(f"Varianza: {varianza:.6f}")
