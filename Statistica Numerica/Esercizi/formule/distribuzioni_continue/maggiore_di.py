import scipy.stats as stats

# Parametri della distribuzione
mu = 1.5  # media
sigma = 0.8**2  # deviazione standard

# Valore al di sopra del quale vogliamo calcolare la probabilità
x = 1.45

# Calcolo della probabilità utilizzando la CDF della normale
prob = 1 - stats.norm.cdf(x, mu, sigma)

print(f'Probabilità che X sia maggiore di {x}: {prob:.4f}')
