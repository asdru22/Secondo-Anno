import numpy as np
import pandas as pd

d = np.arange(1, 4)
D = np.diag(d)

df = pd.DataFrame(D, columns=["C_1", "C_2", "C_3"])
print(df)

data = {
    "nome": [
        "mario",
        "luca",
        "paolo"
    ],
    "cognome": [
        "rossi",
        "bianchi",
        "verdi"
    ],
    "età": [
        45,
        62,
        44
    ]
}
df2 = pd.DataFrame(data)
print(df2)

# Slicing
print(df2["nome"])
print(df2.iloc[1])
