import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd

path = "./data/order_details.csv"
path2 = "./data/order_details2.csv"

data = pd.read_csv(path)
data2 = pd.read_csv(path2)

# primi dati del dataset
print(data.head())

# elenca le colonne che abbiamo
print(data.info())

# estraiamo una sotto-matrice
# che contiene solo elementi numerici
# ci interessano i numeri perché vogliamo lavorare su di essi
n_data = data.select_dtypes(include='number')
print(n_data.info())
print(n_data.describe())
# Sotto matrice
data_sub = data[data["Sub-Category"].str.contains("Chairs", case=False, na=False)]
print(data_sub.describe())

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


# matrice corrlazione
C = n_data.corr()
print(C)

'''
plt.matshow(n_data.corr(), vmin=-1, vmax=1)
plt.xticks(np.arange(0, n_data.shape[1]), n_data.columns, rotation=45)
plt.yticks(np.arange(0, n_data.shape[1]), n_data.columns)
plt.title("A visualization of the correlation Matrix")
plt.colorbar()
plt.show()
'''

print(data.head())

# seaborn
sns.scatterplot(data=data,
                x="Quantity",
                y="Profit",
                hue="Sub-Category",
                col="Category")

'''
1. controllare coma varia la media del profitto
quando si filtrano i dati ad appartenere ad una
sola categoria (Electronics, Furniture o Clothing)
2. matrice di correlazione per lo stesso caso del punto 1
3. fare con seaborn il boxplot per le diverse categorie
'''