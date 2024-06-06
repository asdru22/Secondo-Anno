import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sb
from sklearn import model_selection
from sklearn import linear_model

"""
1. Scelta del dataset
"""
data_init = pd.read_csv("data.csv")

"""
2. Preprocessing
"""
data = data_init.drop(columns=["#","video_transcription_text"])
data = data.dropna()
print(data.isna().any())
print(data.info())

non_num_col = ["video_id","claim_status", "verified_status", "author_ban_status"]
"""
3. EDA
"""
data_num = data.drop(columns=non_num_col)
mat_corr = data_num.corr()

sb.heatmap(mat_corr, annot=True, cmap='coolwarm', fmt=".2f")
plt.show()

like = data['video_like_count']
visualizzazioni = data['video_view_count']

# Scatterplot
sb.scatterplot(data=data, x=visualizzazioni, y=like,hue="claim_status")
plt.xlabel('Views')
plt.ylabel('Likes')
plt.show()


"""
4. Splitting
"""
np.random.seed(66)

data_train, data_temp = model_selection.train_test_split(
    data, train_size=500)
data_val, data_test = model_selection.train_test_split(
    data_temp, train_size=500)

"""
5. Regressione
"""
# X = input
X = data_train[["video_view_count", "video_share_count",
                "video_download_count","video_comment_count"]]
# y = output
y = data_train[["video_like_count"]]

print(f"{X.shape=}")
print(f"{y.shape=}")

# Addestramento del modello
model = linear_model.LinearRegression()
model.fit(X, y["video_like_count"])


# Stima dei coefficienti
coefficients = model.coef_
intercept = model.intercept_
print("Coefficiente angolare:", coefficients)
print("Intercetta:", intercept)

# Calcola il coefficiente R^2
r2 = model.score(X, y)
print("Coefficiente R^2:", r2)

# Calcola il Mean Squared Error (MSE)
y_pred = model.predict(X)
#mse = mean_squared_error(y, y_pred)
#print("Mean Squared Error (MSE):", mse)

# Grafico dei punti e della retta di regressione
plt.scatter(X["video_view_count"], y, color='blue', label='Data')
plt.plot(X["video_view_count"], y_pred, color='red', linewidth=2, label='Regression Line')
plt.xlabel('Views')
plt.ylabel('Likes')
plt.legend()
plt.show()
