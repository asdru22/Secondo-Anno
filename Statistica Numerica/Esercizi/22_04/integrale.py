import math
from scipy import integrate

def integrale(func, a, b):
    # Integrate the function over the interval [a, b]
    p, _ = integrate.quad(func, a, b)
    print(f"{p=}")

    # Integrate x * func(x) over the interval [a, b]
    m, _ = integrate.quad(lambda x: x * func(x), a, b)
    print(f"{m=}")