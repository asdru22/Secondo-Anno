from scipy.stats import t


def quantile_t(p, df):
    """
    Calcola il quantile per la distribuzione t di Student.

    Parametri:
    - p: Percentuale (ad esempio 0.95 per il 95%)
    - df: Gradi di libertà

    Ritorna:
    - Il valore del quantile corrispondente
    """
    return t.ppf(p, df)


# Esempio di utilizzo
p = 0.95  # Quantile al 95%
df = 10  # Gradi di libertà

quantile_value = quantile_t(p, df)
print(f'Quantile per p={p}, df={df}: {quantile_value:.6f}')
