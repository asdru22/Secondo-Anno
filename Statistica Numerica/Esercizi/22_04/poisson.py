import scipy

def poisson(lambd,x):
    pois = scipy.stats.poisson(lambd)
    p = pois.pmf(x)
    print(f"{p=}")
