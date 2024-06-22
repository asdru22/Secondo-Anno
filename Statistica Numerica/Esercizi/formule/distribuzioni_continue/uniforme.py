from scipy.stats import uniform

# Definizione degli estremi dell'intervallo
a = 0   # Limite inferiore
b = 1   # Limite superiore
x = 1

# Creazione dell'oggetto della distribuzione uniforme
distribuzione_uniforme = uniform(loc=a, scale=b-a)

# Calcolo della funzione di densità di probabilità (pdf) per un punto specifico
pdf_valore = distribuzione_uniforme.pdf(x)

# Calcolo della probabilità cumulativa (CDF) per un punto specifico
cdf_valore = distribuzione_uniforme.cdf(x)

# Generazione di numeri casuali dalla distribuzione uniforme
numeri_casuali = distribuzione_uniforme.rvs(size=1000)

# Calcolo della media e della varianza della distribuzione uniforme
media = distribuzione_uniforme.mean()
varianza = distribuzione_uniforme.var()

# Stampa dei risultati
print(f"Funzione di densità di probabilità (PDF) di {x}: {pdf_valore:.6f}")
print(f"Probabilità cumulativa (CDF) di {x}: {cdf_valore:.6f}")
print(f"Media della distribuzione uniforme: {media:.6f}")
print(f"Varianza della distribuzione uniforme: {varianza:.6f}")