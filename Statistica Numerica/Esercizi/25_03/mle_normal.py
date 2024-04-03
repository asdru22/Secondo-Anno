import numpy as np
from scipy.stats import norm
from scipy.optimize import minimize

# stima parametri media e varianza di una distribuzione normale

# Define the true parameter values
mu_true = 2.0
sigma_true = 1.5

# Generate some random data from the normal distribution
data = norm.rvs(loc=mu_true, scale=sigma_true, size=1000, random_state=100)


# Define the log-likelihood function for the normal distribution
def log_likelihood(theta, data):
    # theta è il vettore delle variabili da stimare (in questo caso mu e sigma)
    mu, sigma = theta
    # norm.logpdf = log(f_x(x_i;theta_1,theta_2,...,theta_n)
    log_lik = np.sum(norm.logpdf(data, loc=mu, scale=sigma))
    return log_lik


# Define the function to maximize the log-likelihood
def neg_log_likelihood(theta, data):
    return -log_likelihood(theta, data)

# Set the initial guess for the parameter values
theta_0 = [1.0, 1.0]

# Find the maximum likelihood estimate
result = minimize(neg_log_likelihood, theta_0, args=(data,), method='Nelder-Mead')

# Print the results
print("True parameter values: mu={}, sigma={}".format(mu_true, sigma_true))
print("MLE parameter values: mu={}, sigma={}".format(result.x[0], result.x[1]))
