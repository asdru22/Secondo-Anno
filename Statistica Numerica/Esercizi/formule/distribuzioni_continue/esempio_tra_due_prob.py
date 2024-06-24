import scipy.stats as stats

# Parametri della distribuzione
mu = 90  # media
sigma = 15  # deviazione standard

# Valori tra cui vogliamo calcolare la probabilità
x1 = 90
x2 = 120

# Calcolo della probabilità utilizzando la CDF della normale
prob = stats.norm.cdf(x2, mu, sigma) - stats.norm.cdf(x1, mu, sigma)

print(f'Probabilità tra {x1} e {x2}: {prob:.4f}')