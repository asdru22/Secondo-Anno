import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

data = pd.read_csv("reduced_fraud_detection.csv")
print(data.info())

data = data.drop(columns=["isFlaggedFraud", "Unnamed: 0"])
print(data.info())

print(data["type"])

print(data.isna().any())

# inizio EDA semplificata
data_num = data[["amount", "oldbalanceOrg", "newbalanceOrig",
                 "oldbalanceDest", "newbalanceDest"]]

# matrice di correlazione di pearson
C = data_num.corr()
# fine EDA

data_final = data[["amount", "oldbalanceOrg", "newbalanceOrig", "nameDest",
                   "oldbalanceDest", "newbalanceDest", "isFraud"]]

from sklearn import model_selection

# divisione del dataset in training set e test set
# scelta del seed
np.random.seed(123)

data_train, data_test = model_selection.train_test_split(
    data_final, train_size=1000)

data_val, data_test = model_selection.train_test_split(
    data_final, train_size=1000)

# addestrare un modello di regressione logistica su data data_train
# usando come input tutte le colonne tranne l'ultima, che ve usata
# come output

# X = input
X = data_train[["amount", "oldbalanceOrg", "newbalanceOrig",
                "oldbalanceDest", "newbalanceDest"]]
# y = output
y = data_train[["isFraud"]]

from sklearn import linear_model
# model = linear_model.LogisticRegression()
from sklearn import svm

for d in range(1, 11):
    model = svm.SVC(kernel="linear", C=d)

    # model training
    model.fit(X, y["isFraud"])

    # estrarre X_val e y_vala da data_val e misurare il MR sulla predizione che
    # il modello fa su X_val

    X_val = data_val[[
        "amount", "oldbalanceOrg", "newbalanceOrig",
        "oldbalanceDest", "newbalanceDest"
    ]]

    y_val = data_val["isFraud"]

    y_pred = model.predict(X_val)

    ME = np.sum(y_pred != y_val)
    print(f"{ME=}")

    MR = ME / len(y_pred)
    print(f"{MR=}")

    Acc = 1 - MR
    print(f"{Acc=}")

# ciclo for che ad ogni iterazione ripete il punto precedente
# con una SVM kernel = "poly" e grado = 1,...,10.
# per ognuno di questi valori stampare l'Acc sul validation set.
