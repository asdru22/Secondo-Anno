from scipy import integrate
from scipy import stats
import numpy as np


def binomiale(n, p, x):
    b = stats.binom(n, p)
    p = b.pmf(x)
    print(f"{p=}")


def integrale(func, a, b):
    # Integrate the function over the interval [a, b]
    p, _ = integrate.quad(func, a, b)
    print(f"{p=}")

    # Integrate x * func(x) over the interval [a, b]
    m, _ = integrate.quad(lambda x: x * func(x), a, b)
    print(f"{m=}")


def minore_di(mu, sigma, x):
    norm = stats.norm(mu, sigma)
    p = norm.cdf(x)
    print(f"{p=}")


def poisson(lambd, x):
    pois = stats.poisson(lambd)
    p = pois.pmf(x)
    print(f"{p=}")


def tra(mu, sigma, a, b):
    norm = stats.norm(mu, sigma)
    p1 = norm.cdf(a)
    p2 = norm.cdf(b)
    print(f"{p2 - p1}")


def intervallo_confidenza(mu, sigma, conf, n):
    # Calcolo del valore critico Z
    z_alpha_2 = stats.norm.ppf(1 - (1 - conf) / 2)

    # Calcolo dell'errore standard
    errore_standard = sigma / np.sqrt(n)

    # Calcolo dei limiti dell'intervallo di confidenza
    intervallo_inferiore = mu - z_alpha_2 * errore_standard
    intervallo_superiore = mu + z_alpha_2 * errore_standard
    print(f"Intervallo di confidenza al {conf * 100}%: [{intervallo_inferiore:.4f}, {intervallo_superiore:.4f}]")


def maggiore_di(mu, sigma, x):
    norm = stats.norm(mu, sigma)
    p = 1 - norm.cdf(x)
    print(f"{p=}")


def binom_minore_di(k, n, p):
    probabilita = 1 - stats.binom.cdf(k - 1, n, p)
    media = n * p
    varianza = (n * p) * (1 - p)

    print(f"P di {k} su {n} è: {probabilita:.4f}")
    print(f"Media: {media:.6f}")
    print(f"Varianza: {varianza:.6f}")


def binom_maggiore_di(k, n, p):
    # Calcola la probabilità usando la distribuzione binomiale
    probabilita = 1 - stats.binom.cdf(k, n, p)
    media = n * p
    varianza = n * p * (1 - p)

    print(f"P di più di {k} su {n} è: {probabilita:.4f}")
    print(f"Media: {media:.6f}")
    print(f"Varianza: {varianza:.6f}")


def intervallo_confidenza_t(mu, sigma, conf, n):
    df = n-1

    # Calcolo del livello di significatività alpha
    alpha = 1 - conf

    # Calcolo del quantile t critico
    t_critico = stats.t.ppf(1 - alpha / 2, df=df)

    # Calcolo dell'errore standard
    errore_standard = sigma / np.sqrt(n)

    # Calcolo dei limiti dell'intervallo di confidenza
    intervallo_inferiore = mu - t_critico * errore_standard
    intervallo_superiore = mu + t_critico * errore_standard

    print(f"Intervallo di confidenza al {conf * 100}%: [{intervallo_inferiore:.4f}, {intervallo_superiore:.4f}]")
