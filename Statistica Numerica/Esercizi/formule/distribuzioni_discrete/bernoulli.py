p = 0.1  # Probabilità di successo
x = 1  # Valore del processo di Bernoulli (può essere 0 o 1)

# Calcolo della probabilità di Bernoulli
fx = (p**x) * ((1 - p)**(1 - x))
print(f"Bernoulli: {fx:.6f}")

# Calcolo della media e varianza
media = p
varianza = p * (1 - p)

print(f"Media: {media:.6f}")
print(f"Varianza: {varianza:.6f}")