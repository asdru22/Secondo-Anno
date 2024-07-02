from scipy.stats import t


def quantile_t(p, df):
    return t.ppf(p, df)


# Esempio di utilizzo
p = 0.95  # Quantile al 95%
df = 10  # Gradi di libertà

quantile_value = quantile_t(p, df)
print(f'Quantile per {p=}, {df=}: {quantile_value:.6f}')
