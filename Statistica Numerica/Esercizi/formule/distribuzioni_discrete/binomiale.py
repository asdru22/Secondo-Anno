from scipy.special import comb

# Parametri del problema
n = 5
p = 1/6
x = 3


# Calcolo del coefficiente binomiale
coeff_binomiale = comb(n, x)

# Calcolo della probabilità binomiale
probabilita = coeff_binomiale * (p ** x) * ((1 - p) ** (n - x))

print(f"Probabilità: {probabilita}")

# Calcolo della media e della varianza
media = n * p
varianza = n * p * (1 - p)

print(f"Media: {media:.6f}")
print(f"Varianza: {varianza:.6f}")