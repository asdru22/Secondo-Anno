import numpy as np
import seaborn as sb
import matplotlib.pyplot as plt
import pandas as pd

path = "./data/order_details.csv"
path2 = "./data/order_details2.csv"

data = pd.read_csv(path)
data2 = pd.read_csv(path2)

# merging, "on" è la
# colonna su cui vogliamo fare il merge
data = pd.merge(data, data2, on="Order ID")

# rimozione colonne superflue
data = data.drop(columns=["Order ID"])
print(data.info())

# convertire categorie in un specifico dato da tipo "oggetto"
categorie = ["Sub-Category", "Category", "PaymentMode", "Order Date", "CustomerName", "State", "City"]
data[categorie] = data[categorie].astype("category")
for col in data.columns:
    print(f"{col} type: {data[col].dtype}.")

# controllo valori null
print(data.isnull().sum())
# non ne abbiamo
