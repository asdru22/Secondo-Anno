import numpy as np
import seaborn as sb
import matplotlib as mpl
import pandas as pd

df_load = pd.read_csv("data/order_details.csv")

print(df_load.describe())
