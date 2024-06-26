import scipy.stats as stats

# Parametri della distribuzione
mu = 0  # media
sigma = 1  # deviazione standard

# Valore al di sopra del quale vogliamo calcolare la probabilità
x = 0.75

# Calcolo della probabilità utilizzando la CDF della normale
prob = 1 - stats.norm.cdf(x, mu, sigma)

print(f'Probabilità che X sia maggiore di {x}: {prob:.4f}')
