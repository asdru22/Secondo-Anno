from scipy.stats import norm

p = 0.05/2
mu = 0
sigma = 1
quantile = norm.ppf(1-p,loc=mu,scale = sigma)
print(f"{quantile=}")