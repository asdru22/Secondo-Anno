import scipy.stats as stats

# Parametri della distribuzione
mu = 1.5  # media
sigma = 0.8  # deviazione standard

# Valore fino al quale vogliamo calcolare la probabilità
x = 1.45

# Calcolo della probabilità utilizzando la CDF della normale
prob = stats.norm.cdf(x, mu, sigma)

print(f'Probabilità che X sia minore di {x}: {prob:.4f}')
