import pandas as pd

df = pd.DataFrame({
    "nome": ["luca", "marco", "giovanni"],
    "cognome": ["rossi", "bianchi", "rossi"],
    "eta": [32, 4, 24]
})

df_rossi = df[df["cognome"] == "rossi"]

print(df_rossi)
print(df.iloc[0])  # rende il dataframe indicizzabile tramite int

df = df.drop(columns=["nome"])  # cancella la colonna nome
print(df)

df.to_csv("esempio.csv")

del df

df_load = pd.read_csv("esempio.csv")

print(df_load.describe())
