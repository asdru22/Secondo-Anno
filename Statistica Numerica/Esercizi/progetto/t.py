import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats
import math
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.svm import SVC
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics import confusion_matrix
from sklearn.linear_model import LogisticRegression
from sklearn import metrics, metrics
from sklearn.model_selection import cross_val_score, KFold
from sklearn import svm
import os
from sklearn.model_selection import StratifiedShuffleSplit
from sklearn.metrics import accuracy_score
import matplotlib.pyplot

ds = pd.read_csv(r"C:\Users\Utente\.conda\diabetes.csv")

cols = ds[['Pregnancies', 'Glucose', 'BloodPressure', 'SkinThickness', 'Insulin', 'BMI',
           'DiabetesPedigreeFunction', 'Age']]

pd.set_option('display.max_columns', None)


def datasetShape(dataset):
    plt.fill_between([dataset.shape[0] - 1, dataset.shape[0] + 1], [dataset.shape[1] - 1, dataset.shape[1] - 1],
                     [dataset.shape[1] + 1, dataset.shape[1] - 1], color='lightblue')

    sns.scatterplot(x=dataset.shape[0], y=[dataset.shape[1]], s=200)
    plt.text(dataset.shape[0] - 0.1, dataset.shape[1] + 0.1, f'row : {dataset.shape[0]} \n col : {dataset.shape[1]}')

    plt.xlabel("colonne")
    plt.ylabel("righe")
    plt.plot()


# datasetShape(ds)

def diagnostic_plots(df, variable, target):
    # Define figure size.
    plt.figure(figsize=(20, 7))

    # histogram
    plt.subplot(1, 4, 1)
    sns.histplot(df[variable], kde=True, color='r')
    plt.title('Histogram')

    # boxplot
    plt.subplot(1, 4, 2)
    sns.boxplot(y=df[variable], color='b')
    plt.title('Boxplot')

    # scatterplot
    plt.subplot(1, 4, 3)
    plt.scatter(df[variable], df[target], color='g')
    plt.title('Scatterplot')

    # barplot
    plt.subplot(1, 4, 4)
    sns.violinplot(x=target, y=variable, data=df)
    plt.title('Violinplot')

    plt.show()


# visualizzo i dati dopo averli manipolati

for col in cols:
    diagnostic_plots(ds, col, 'target')

colonneDaRipulire = ds[['Glucose', 'BloodPressure', 'SkinThickness', 'Insulin', 'BMI']]
for col in colonneDaRipulire:
    zero_values = len(ds[ds[col] <= 0])
    print("Number of zero or less tha zero values in column {} are {}".format(col, zero_values))

# cerco valori impossibili come pressione sanguigna a 0
cols = ds[['Glucose', 'BloodPressure', 'SkinThickness', 'Insulin', 'BMI']]
for col in cols:
    median = ds[col].median()
    ds.loc[ds[col] <= 0, col] = median
cols = ds[['Glucose', 'BloodPressure', 'SkinThickness', 'Insulin', 'BMI']]
for col in cols:
    zero_values = len(ds[ds[col] <= 0])
    print("Number of zero or less tha zero values in column {} are {}".format(col, zero_values))


def mod_outlier(ds):
    ds1 = ds.copy()
    ds = ds._get_numeric_data()
    q1 = ds.quantile(0.25)
    q3 = ds.quantile(0.75)

    iqr = q3 - q1
    lower_bound = q1 - (1.5 * iqr)  # identifico upper e lower bound
    upper_bound = q3 + (1.5 * iqr)  # con la distanza interquartile

    for col in ds.columns:
        for i in range(0, len(ds[col])):

            if ds[col][i] < lower_bound[col]:
                ds[col][i] = lower_bound[col]

            if ds[col][i] > upper_bound[col]:
                ds[col][i] = upper_bound[col]

    for col in ds.columns:
        ds1[col] = ds[col]

    return (ds1)


# dataset senza outlier
ds1 = mod_outlier(ds)

# Stampo la matrice di correlazione
plt.figure(figsize=(22, 22))
sns.heatmap(ds1.corr(), annot=True)
plt.plot()


# visualizzo i dati dopo averli manipolati
# for col in cols:
# diagnostic_plots(ds1,col,'Outcome')


def evaluateModel(svc_model, X_train, y_train):
    results = cross_val_score(svc_model, X_train, y_train, scoring='accuracy', cv=KFold(n_splits=5))
    # print('accuracy = ', svc_model, round((results.mean()*100), 2))
    accuracy = round((results.mean() * 100), 2)
    print(accuracy)
    return accuracy


# divido il dataset in training e test
X = ds1.drop(['Outcome'], axis=1)
y = ds1['Outcome']
k = 10
accuracies = []

for i in range(k):
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=20 + 2 * i)

    st = MinMaxScaler()
    X_train = st.fit_transform(X_train)
    X_test = st.fit_transform(X_test)
    # support vector machine
    # scommentare quello che si vuole calcolare
    # svm_linear = svm.SVC(kernel='linear', C=2).fit(X_train, y_train)
    # svm_poly = svm.SVC(kernel='poly', degree=3).fit(X_train, y_train)
    # svm_rbf = svm.SVC(kernel='rbf').fit(X_train, y_train)

    # utilizzo la regressione logistica
    clf = LogisticRegression(max_iter=100, multi_class="ovr")
    clf.fit(X_train, y_train)
    y_pred = clf.predict(X_test)
    score = metrics.accuracy_score(y_test, y_pred)
    print("Accuracy  logistic regression: {}".format(score))
    # print(y_test)

    print("******************")
    # evaluateModel(svm_poly, X_train, y_train)
    # print("******************")
    # evaluateModel(svm_rbf, X_train, y_train)

    accuracies.append(score)

# calcolo l'accuratezza media
mean = 0

for x in accuracies:
    mean = mean + x
mean = mean / k
print("Accuracy media: ", mean)
print('--------------------------')
matplotlib.pyplot.boxplot(accuracies)
intervalloConfidenza = [mean - (0.95 * math.sqrt(0.5 / k)), mean + (0.95 * math.sqrt(0.5 / k))]
print("Intervallo di confidenza: ", intervalloConfidenza)

# utilizzo il modello supervisionato
models = [SVC()]

for model in models:
    model.fit(X_train, y_train)
    # print('Model :', type(model).__name__)
    # print('Score :',model.score(X_test,y_test))

# matrice di confusione
final_logreg_cm = metrics.confusion_matrix(y_test, y_pred)

# sns.heatmap(final_logreg_cm,annot=True,fmt=".2f")
# plt.title("Matrice di confusione della regressione logica con Heatmap")
# plt.show()