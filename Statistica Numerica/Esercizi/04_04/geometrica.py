p = 0.1  # Probabilità di successo
x = 5 # numero di fallimenti prima del primo successo

# Calcolo della probabilità di Bernoulli
fx = p*(1-p)**x
print(f"Geometrica: {fx:.6f}")

# Calcolo della media e varianza
media = (1-p)/p
varianza = (1-p)/(p**2)

print(f"Media: {media:.6f}")
print(f"Varianza: {varianza:.6f}")
