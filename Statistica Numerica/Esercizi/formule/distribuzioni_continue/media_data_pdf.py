import scipy.integrate as integrate

# Definizione della PDF non normalizzata
def pdf(x):
    return -2 * x

# Normalizzazione
norm_const, _ = integrate.quad(pdf, 1, 2)
normalized_pdf = lambda x: pdf(x) / norm_const

# Calcolo della media
def mean():
    integrand = lambda x: x * normalized_pdf(x)
    mean_value, _ = integrate.quad(integrand, 1, 2)
    return mean_value

# Risultato
media = mean()
print(f"Media della distribuzione: {media:.4f}")
