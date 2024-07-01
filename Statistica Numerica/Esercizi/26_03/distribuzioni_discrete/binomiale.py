import math

def binomial_coefficient(n, k):
    return math.factorial(n) // (math.factorial(k) * math.factorial(n - k))

def probability_of_failure(n, k, p):
    q = 1 - p
    return binomial_coefficient(n, k) * (q ** k) * (p ** (n - k))

n = 120
k = 50
p = 0.67 # probabilità

prob_failure = probability_of_failure(n, k, p)
print(f"La probabilità di {k} su {n} è: {prob_failure:.6f}")
