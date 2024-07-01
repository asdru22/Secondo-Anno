import scipy.integrate as integrate

a = 1
b = 2

def f(x):
    return -2/x

# Definizione della funzione densità di probabilità (PDF)
def pdf_X(x):
    if a < x < b:
        return f(x)
    else:
        return 0  # Fuori dall'intervallo [1, 2], la PDF è zero

# Calcolo del valore atteso (media)
expected_value, _ = integrate.quad(lambda x: x * pdf_X(x), 1, 2)

print(f"La media della distribuzione è: {expected_value}")
