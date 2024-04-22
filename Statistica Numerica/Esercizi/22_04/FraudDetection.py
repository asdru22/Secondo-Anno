import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

data = pd.read_csv("reduced_fraud_detection.csv")
print(data.info())

data = data.drop(columns=["isFlaggedFraud", "Unnamed: 0"])
print(data.info())

print(data["type"])


print(data.isna().any())

data_num = data[["amount", "oldbalanceOrg", "newBalanceOrig", "nameDest"
                 "oldbalanceDest", "newbalanceDest"]]

# matrice di correlazione di pearson
C = data_num.corr()

data_final = data[["amount", "oldbalanceOrg", "newBalanceOrig", "nameDest"
                 "oldbalanceDest", "newbalanceDest", "isFraud"]]

from sklearn import model_selection
data_train, data_test = model_selection.train_test_split(
    data_final, train_size= 400000)

# addestrare un modello di regressione logistica su data data_train
# usando come input tutte le colonne tranne l'ultima, che ve usata
# come output

X = data_train[["amount", "oldbalanceOrg", "newBalanceOrig", "nameDest"
                 "oldbalanceDest", "newbalanceDest"]]

y = data_test[["isFraud"]]
