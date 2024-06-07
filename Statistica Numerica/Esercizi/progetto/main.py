import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from sklearn import model_selection
from sklearn import linear_model
from sklearn.metrics import mean_squared_error, r2_score
from scipy import stats


def correlazione():
    plt.matshow(mat_corr, vmin=-1, vmax=1)
    plt.xticks(np.arange(0, data_num.shape[1]), data_num.columns, rotation=45)
    plt.yticks(np.arange(0, data_num.shape[1]), data_num.columns)
    plt.title("Matrice di correlazione")
    plt.colorbar()
    plt.show()

    sns.scatterplot(data=data, x="video_view_count", y="video_like_count",
                    hue="claim_status")
    plt.xlabel('Views')
    plt.ylabel('Likes')
    plt.show()


def regressione(x_scelta, y_scelta):
    print(f"\nRegressione con X={x_scelta} e y={y_scelta}")
    X = data_train[[x_scelta]]
    y = data_train[y_scelta]

    model = linear_model.LinearRegression()
    model.fit(X, y)

    print(f"Coefficienti stimati: {model.coef_}")
    print(f"Intercetta: {model.intercept_}")

    # Predizione
    y_pred = model.predict(X)

    # Calcolo del coefficiente R^2
    r2 = r2_score(y, y_pred)
    print(f"Coefficiente R^2: {r2}")

    # Calcolo dell'errore quadratico medio (MSE)
    mse = mean_squared_error(y, y_pred)
    print(f"Mean Squared Error (MSE): {mse}")

    retta_di_regressione(X, y, y_pred,x_scelta)

    # Residui
    residui = y - y_pred

    # qq plot dei residui
    stats.probplot(residui, dist="norm", plot=plt)
    plt.title('Q-Q Plot dei residui')
    plt.show()

    residui_min = np.random.choice(residui, size=4000, replace=False)
    shapiro_test = stats.shapiro(residui_min)
    print(f"Shapiro-Wilk Test su un sotto campione"
          f"\nstatistica: {shapiro_test[0]},\np-value: {shapiro_test[1]}")


def retta_di_regressione(X, y, y_pred,x_scelta):
    plt.figure(figsize=(10, 6))
    plt.scatter(X[x_scelta], y, color='blue', label='Data')
    plt.plot(X[x_scelta], y_pred, color='red', linewidth=2, label='Regression Line')
    plt.legend()
    plt.title('Retta di regressione')
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

non_num_col = ["video_id", "claim_status", "verified_status", "author_ban_status"]
data["video_id"] = data["video_id"].astype("category")
data["claim_status"] = data["claim_status"].astype("category")
data["verified_status"] = data["verified_status"].astype("category")
data["author_ban_status"] = data["author_ban_status"].astype("category")

#print(data.isna().any())
#print(data.info())

"""
3. EDA
"""

data_num = data.drop(columns=non_num_col)
mat_corr = data_num.corr()

#correlazione()


"""
4. Splitting
"""

np.random.seed(66)
# 70% in training, 15% in test e 15% in validation
data_train, data_temp = model_selection.train_test_split(data, test_size=0.3)
data_val, data_test = model_selection.train_test_split(data_temp, test_size=0.5)

"""
5. Regressione 
"""
# visualizzazioni e like fortemente correlati
regressione("video_view_count", "video_like_count")
# like e commenti discretamente correlati
regressione("video_like_count", "video_comment_count")
