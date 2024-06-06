import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn import linear_model

# load data
data = pd.read_csv("./data/Classification_data.csv")

print(data.info())

# EDA
# ...

# visualization
plt.scatter(data["x1"], data["x2"], c=data["class"])
plt.grid()
plt.show()

# model definition
model = linear_model.LogisticRegression()

# model training
model.fit(data[["x1", "x2"]], data["class"])

# prediction
new_x = pd.DataFrame({
    "x1": np.array([3.5]),
    "x2": np.array([0.7])
})

pred_y = model.predict(new_x)

print(f"{pred_y=}")