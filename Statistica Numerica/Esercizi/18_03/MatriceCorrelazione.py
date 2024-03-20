import numpy as np
import seaborn as sb
import matplotlib.pyplot as plt
import pandas as pd

path = "./data/ice_cream.csv"
data = pd.read_csv(path)

print(data.shape)

C = data.corr()
print(C.shape)

print(C)