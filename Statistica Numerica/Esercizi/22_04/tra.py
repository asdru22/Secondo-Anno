import scipy

mu = 0
std = 1

a = 3
b = 5
norm = scipy.stats.norm(mu, std)
p1 = norm.cdf(a)
p2 = norm.cdf(b)

print(f"{p2-p1}")
