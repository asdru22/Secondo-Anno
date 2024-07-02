x = 2 # numero esperimenti di bernoulli
p = 0.6

fx = (p**x)*(1-p)**(1-x)

mu = p
var = x*p*(1-p)

print(f"Probabilità di successo (p): {fx:.4f}")
print(f"Media (μ): {mu:.4f}")
print(f"Varianza (σ^2): {var:.4f}")