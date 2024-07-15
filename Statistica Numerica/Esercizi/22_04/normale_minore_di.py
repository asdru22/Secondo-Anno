import scipy

def calc(mu,sigma,x):
    norm = scipy.stats.norm(mu, sigma)
    p = norm.cdf(x)

    print(f"{p=}")

