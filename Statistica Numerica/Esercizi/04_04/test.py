import scipy
x = 25
mu = 24.5
sigma = 2

f = scipy.stats.norm(mu,sigma)
prob = f.pdf(x)
print(f"{prob=}")
print(f"Media {f.mean()}")