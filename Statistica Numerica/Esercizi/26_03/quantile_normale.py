from scipy.stats import norm


def quantile_norm(p, mu=0, sigma=1):
    """
    Calcola il quantile (percentile) per la distribuzione normale.

    Parametri:
    - p: Percentuale (ad esempio 0.95 per il 95%)
    - mu: Media della distribuzione
    - sigma: Deviazione standard della distribuzione

    Ritorna:
    - Il valore del quantile corrispondente
    """
    return norm.ppf(p, loc=mu, scale=sigma)


# Esempio di utilizzo
p = 0.95  # Quantile al 95%
mu = 70
sigma = 2

quantile_value = quantile_norm(p, mu, sigma)
print(f'Quantile per p={p}, mu={mu}, sigma={sigma}: {quantile_value:.6f}')
