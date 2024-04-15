import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn import svm

# load data
data = pd.read_csv("./data/Classification_data2.csv")

print(data.info())

# EDA
# ...

# visualization
plt.scatter(data["x1"], data["x2"], c=data["class"])
plt.grid()
plt.show()

# model definition
model = svm.SVC(kernel="rbf", degree=5)

# model training
model.fit(data[["x1", "x2"]], data["class"])

y_true = data["class"]

# metrics
# ME = np.sum(y_pred != y_true)
# MR = np.mean(y_pred != y_true)
# MRperc = MR*100
# ACC = 1-MR


def train(model):
    # prediction
    new_x = pd.DataFrame({
        "x1": np.array([3.5]),
        "x2": np.array([0.7])
    })

    model.fit(data[["x1", "x2"]], data["class"])

    pred_y = model.predict(new_x[["x1", "x2"]])
    y_pred = model.predict(data[["x1", "x2"]])
    mr = np.mean(y_pred != y_true)
    return mr


# misurare l'accuratezza del kernel poly al variare del grado
for i in range(2, 6):
    model1 = svm.SVC(kernel="poly", degree=i - 1)
    model2 = svm.SVC(kernel="poly", degree=i)

    acc1 = 1 - train(model1)
    acc2 = 1 - train(model2)

    print(f"grado {i}: {acc1-acc2=}")
