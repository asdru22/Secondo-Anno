from scipy.stats import norm

# Parametri della distribuzione normale
media = 24.5    # Media della distribuzione
dev_std = 2  # Deviazione standard della distribuzione

# Creazione dell'oggetto della distribuzione normale
distribuzione_normale = norm(loc=media, scale=dev_std)

# Calcolo della funzione di densità di probabilità (PDF) per un punto specifico
x = 25
pdf_valore = distribuzione_normale.pdf(x)

# Calcolo della probabilità cumulativa (CDF) per un punto specifico
cdf_valore = distribuzione_normale.cdf(x)

# Generazione di numeri casuali dalla distribuzione normale
numeri_casuali = distribuzione_normale.rvs(size=1000)

# Calcolo della media e della varianza della distribuzione normale
media_calcolata = distribuzione_normale.mean()
varianza_calcolata = distribuzione_normale.var()

# Stampa dei risultati
print(f"PDF di {x}: {pdf_valore:.6f}")
print(f"Probabilità cumulativa (CDF) di {x}: {cdf_valore:.6f}")