import math


x = 1
lambd = 100

pdf = lambd*math.e**(-lambd*x)
media = 1/lambd
var = 1/(lambd**2)

print(f"{pdf=}\n{media= }, {var= }")