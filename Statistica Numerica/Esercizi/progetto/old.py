import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sb
from sklearn import model_selection
from sklearn import linear_model
from sklearn.metrics import mean_squared_error, r2_score
from scipy import stats


def matrice_correlazione():
    sb.heatmap(mat_corr, annot=True, cmap='coolwarm', fmt=".2f")
    plt.show()

def scatterplot():
    # Scatterplot
    sb.scatterplot(data=data, x=visualizzazioni, y=like, hue="claim_status")
    plt.xlabel('Views')
    plt.ylabel('Likes')
    plt.show()

"""
1. Scelta del dataset
"""
data_init = pd.read_csv("data.csv")

"""
2. Preprocessing
"""
data = data_init.drop(columns=["#", "video_transcription_text"])
data = data.dropna()
print(data.isna().any())
print(data.info())

non_num_col = ["video_id", "claim_status", "verified_status", "author_ban_status"]

"""
3. EDA
"""
data_num = data.drop(columns=non_num_col)

mat_corr = data_num.corr()
# Matrice correlazione
# matrice_correlazione()

like = data['video_like_count']
visualizzazioni = data['video_view_count']

# Scatterplot
# scatterplot()

"""
4. Splitting
"""
np.random.seed(66)

data_train, data_temp = model_selection.train_test_split(data, train_size=500)
data_val, data_test = model_selection.train_test_split(data_temp, train_size=0.5)

"""
5. Regressione
"""
# X = input
X = data_train[["video_view_count", "video_share_count",
                "video_download_count", "video_comment_count"]]
# y = output
y = data_train["video_like_count"]

print(f"{X.shape=}")
print(f"{y.shape=}")

# Addestramento del modello
model = linear_model.LinearRegression()
model.fit(X, y)

# Stima dei coefficienti/intercetta
print("Coefficienti stimati:", model.coef_)
print("Intercetta:", model.intercept_)

# Predizione
y_pred = model.predict(X)

# Calcolo del coefficente R^2
r2 = r2_score(y, y_pred)
print("Coefficiente R^2:", r2)

# Calcolo dell'errore quadratico medio (MSE)
mse = mean_squared_error(y, y_pred)
print("Mean Squared Error (MSE):", mse)

# Grafico dei punti e della retta di regressione
plt.scatter(X["video_view_count"], y, color='blue', label='Data')
plt.plot(X["video_view_count"], y_pred, color='red', linewidth=2, label='Regression Line')
plt.xlabel('Views')
plt.ylabel('Likes')
plt.legend()
plt.show()

# Analisi di normalità dei residui con Shapiro-Wilk
residui = y - y_pred

y.to_csv('y.csv', index=False)
y_pred.to_csv('y_pred.csv', index=False)
residui.to_csv('residui.csv', index=False)

# Perform Shapiro-Wilk test
shapiro_test = stats.shapiro(residui)
#print(residui)
print('Shapiro-Wilk Test')
print('Statistica:', shapiro_test[0])
print('p-value:', shapiro_test[1])

if shapiro_test[1] > 0.05:
    print("Distribuzione normale dei residui (accetto H0)")
else:
    print("I residui non sono normalmente distribuiti (rifiuto H0)")
