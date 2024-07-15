import scipy.integrate as integrate
import math

a = 0.1
b = 1

def f(x):
    return

# Definizione della funzione densità di probabilità (PDF)
def pdf_X(x):
    if a < x < b:
        return f(x)
    else:
        return 0  # Fuori dall'intervallo [1, 2], la PDF è zero

# Calcolo del valore atteso (media)
expected_value, _ = integrate.quad(lambda x: x * pdf_X(x), a, b)

print(f"La media della distribuzione è: {expected_value}")
