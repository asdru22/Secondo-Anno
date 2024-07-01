import math

def coeff(n, k):
    return math.factorial(n) // (math.factorial(k) * math.factorial(n - k))

def prob(n, k, p):
    return coeff(n, k) * (p ** k) * ((1-p) ** (n - k))

n = 120
k = 50
p = 0.33 # probabilità

probabilita = prob(n, k, p)
print(f"La probabilità di {k} su {n} è: {probabilita:.6f}")

media = n*p
varianza = (n*p)*(1-p)

print(f"Media: {media:.6f}")
print(f"Varianza: {varianza:.6f}")
