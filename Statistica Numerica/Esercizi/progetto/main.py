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
plt.figure(figsize=(8, 6))
sb.scatterplot(data=data, x=visualizzazioni, y=like,hue="claim_status")
plt.title('Like vs views')
plt.xlabel('views')
plt.ylabel('like')
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

print("Shape of X:", X.shape)
print("Shape of y:", y.shape)

model = linear_model.LogisticRegression()
model.fit(X, y["video_like_count"])