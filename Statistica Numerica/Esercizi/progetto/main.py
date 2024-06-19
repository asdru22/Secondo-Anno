import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from sklearn import linear_model, svm
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import mean_squared_error, r2_score, classification_report, confusion_matrix, accuracy_score
from scipy import stats
from math import sqrt

grafici = False
file = open('output.txt', 'w')


def correlazione(mat_corr):
    # visualizzazione matrice di correlazione
    plt.matshow(mat_corr, vmin=-1, vmax=1)
    plt.xticks(np.arange(0, data_num.shape[1]), data_num.columns, rotation=45)
    plt.yticks(np.arange(0, data_num.shape[1]), data_num.columns)
    plt.title('Matrice di correlazione')
    plt.colorbar()
    plt.show()

    # plot del grafico della relazione tra visualizzazioni e like
    sns.scatterplot(data=data, x='video_view_count',
                    y='video_like_count', hue='claim_status')
    plt.xlabel('Visualizzazioni')
    plt.ylabel('Like')
    plt.show()


def qqplot(r):
    stats.probplot(r, dist='norm', plot=plt)
    plt.title('Q-Q Plot dei residui')
    plt.show()


def regressione(x_scelta, y_scelta):
    file.write(f'\n\n> Regressione con X={x_scelta} e y={y_scelta}\n')
    # Variabile (numerica) in input X, variabile (numerica) in output y
    X = data_train[[x_scelta]]
    y = data_train[y_scelta]

    # Addestramento modello
    model = linear_model.LinearRegression()
    model.fit(X, y)

    file.write(f'Coefficienti stimati: {model.coef_}\n')
    file.write(f'Intercetta: {model.intercept_}\n')

    # Predizione
    y_pred = model.predict(X)

    # Calcolo del coefficiente R^2
    r2 = r2_score(y, y_pred)
    file.write(f'Coefficiente R^2: {r2}\n')

    # Calcolo dell'errore quadratico medio
    mse = mean_squared_error(y, y_pred)
    file.write(f'Errore quadratico medio (MSE): {mse}\n')

    if grafici:
        retta_di_regressione(X, y, y_pred, x_scelta)

    # Residui
    residui = y - y_pred

    # QQ-plot dei residui
    if grafici:
        qqplot(residui)

    # Estrazione di un sotto-campione di 4000 residui dal totale in grado da essere gestito dal test di shapiro wilk
    residui_min = np.random.choice(residui, size=4000, replace=False)
    shapiro_test = stats.shapiro(residui_min)
    file.write(f'Test di Shapiro-Wilk su un sotto campione\nstatistica: {shapiro_test[0]},\np-value: '
               f'{shapiro_test[1]}\n')
    if shapiro_test[1] > 0.05:
        file.write('Distribuzione normale dei residui (accetto H0)\n')
    else:
        file.write('I residui non sono normalmente distribuiti (rifiuto H0)\n')


def retta_di_regressione(X, y, y_pred, x_scelta):
    # Disegna la retta di regressione
    plt.figure(figsize=(10, 6))
    plt.scatter(X[x_scelta], y, color='blue', label='Data')
    plt.plot(X[x_scelta], y_pred, color='red', linewidth=2, label='Regression Line')
    plt.legend()
    plt.title('Retta di regressione')
    plt.show()


def addestra(nome_modello, model, X_test, y_test):
    file.write(f'\n> Addestramento con {nome_modello}\n\n')
    model.fit(X_train, y_train)

    # Predizione sui dati di test
    y_pred = model.predict(X_test)

    # Report di classificazione
    file.write(f'Report di classificazione:\n{classification_report(y_test, y_pred)}\n')

    # Matrice di confusione
    mat_conf = confusion_matrix(y_test, y_pred)
    file.write(f'Matrice di confusione:\n{mat_conf}\n')
    # visualizzazione
    if grafici:
        sns.heatmap(mat_conf, annot=True, cmap='Blues')
        plt.xlabel('Predetti')
        plt.ylabel('Veri')
        plt.show()


def grafici_accuratezza(acc):
    # Creazione dell'istogramma
    plt.hist(acc, bins=5, color='skyblue', edgecolor='black', alpha=0.7)
    plt.title('Distribuzione delle accuratezze')
    plt.xlabel('Accuratezza')
    plt.ylabel('Frequenza')
    plt.show()

    # Creazione del boxplot (non ci sono outlier da eliminare)
    plt.boxplot(acc)
    plt.title('Boxplot delle accuratezze')
    plt.xlabel('Accuratezza')
    plt.grid(True)
    plt.show()


'''
1. Scelta del dataset
'''
data_init = pd.read_csv('data.csv')

'''
2. Preprocessing
'''
data = data_init.drop(columns=['#', 'video_transcription_text'])
data = data.dropna()

non_num_col = ['video_id', 'claim_status', 'verified_status', 'author_ban_status']
col_num = ['video_view_count', 'video_like_count', 'video_share_count',
           'video_download_count', 'video_comment_count']
# converto in dato categorico
data['video_id'] = data['video_id'].astype('category')
data['claim_status'] = data['claim_status'].astype('category')
data['verified_status'] = data['verified_status'].astype('category')
data['author_ban_status'] = data['author_ban_status'].astype('category')
file.write(f'Dati:\n{data}\n\n')
file.write(f'NaN trovati:\n{data.isna().any()}\n\n')

# Controllo eventuali valori negativi
cont_negativi = {} # dizionario vuoto ('nome colonna', num negativi)
for col in col_num:
    # Conta i valori negativi di una colonna
    cont_negativi[col] = (data[col] < 0).sum()
file.write('Controllo valori negativi:\n')
for col, count in cont_negativi.items():
    file.write(f'Colonna "{col}": {count} valori negativi\n')

'''
3. EDA
'''
# elimino dati non numerici
data_num = data.drop(columns=non_num_col)
mat_corr = data_num.corr()

if grafici:
    correlazione(mat_corr)

'''
4. Splitting
'''

np.random.seed(66)
# 70% in training, 15% in test e 15% in validation
data_train, data_temp = train_test_split(data, test_size=0.3)
data_val, data_test = train_test_split(data_temp, test_size=0.5)

'''
5. Regressione 
'''
# visualizzazioni e like fortemente correlati
regressione('video_view_count', 'video_like_count')
# like e commenti discretamente correlati
regressione('video_like_count', 'video_comment_count')

'''
6. Addestramento del modello
'''
# addestro il modello sui valori numerici per predire se
# un video è un opinione o un affermazione
X = data_num
y = data['claim_status']

# Divisione in training e test set
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# La standardizzazione migliora la convergenza dell'algoritmo e le performance del modello.
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

logistic_model = linear_model.LogisticRegression()
addestra('regressione logistica', logistic_model, X_test, y_test)

'''
7. Hyperparameter tuning
'''
# Addestramento con Support Vector Classification
# ciclo per controllare accuratezza al variare del grado
svc_model = svm.SVC(kernel='linear', C=1)
addestra('SVC', svc_model, X_test, y_test)

'''
9. Studio sui risultati della valutazione
'''

k = 10
model = linear_model.LogisticRegression(max_iter=1000)
acc = []

for i in range(k):
    # Divisione di X e y in train e test
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=i * 10)
    model.fit(X_train, y_train)

    y_pred = model.predict(X_test)
    score = accuracy_score(y_test, y_pred)

    acc = np.append(acc, score)

acc_media = 0

for a in acc:
    acc_media = acc_media + a
acc_media = acc_media / len(acc)

file.write(f'\n>Analisi accuratezza con {k} iterazioni\nMedia: {np.mean(acc)}, mediana: {np.median(acc)},\n'
           f'deviazione standard: {np.std(acc)},'
           f'minimo: {np.min(acc)}, massimo: {np.max(acc)}\n')

if grafici:
    grafici_accuratezza(acc)

intervallo_confidenza = [acc_media - (0.95 * sqrt(0.5 / k)), acc_media + (0.95 * sqrt(0.5 / k))]
file.write(f'\nIntervallo di confidenza con alpha = 0.05: {intervallo_confidenza}')
