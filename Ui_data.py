import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error
data = {
    "Area": [800, 1000, 1200, 1500, 1800, 2000, 2200, 2500],
    "Bedrooms": [2, 2, 3, 3, 4, 4, 4, 5],
    "Age": [20, 15, 18, 10, 5, 7, 3, 1],
    "Price": [200000, 250000, 300000, 350000, 400000, 450000, 480000, 550000]
}

df = pd.DataFrame(data)
print(df)
X = df[["Area", "Bedrooms", "Age"]]   # features
y = df["Price"]                       # target
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)
model = LinearRegression()

model.fit(X_train, y_train)

import joblib
joblib.dump(model,'model.pkl')