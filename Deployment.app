# Deploying the model

# 1.
import joblib

# 2.
import streamlit as st

# Uploading the file
Model = joblib.load('Model.pkl')

# 4
st.header("Customer Churn Predictor")

# 5
id = st.text_input("Customer_ID:")

# 6
A = st.number_input("Age :",
                    min_value= 23,
                    max_value=60
                    )

# 7
T = st.number_input("Tenure :",
                    min_value= 3,
                    max_value=60
                    )

# 8
M = st.number_input("Monthly_Charges :",
                    min_value=45.0,
                    max_value=120.4
                    )

# 9
C = st.selectbox("Contract Type :",
                  ["Month-to-month", "Two year", "One year"]
                  )
P_M=st.selectbox('PaymentMethod',
["Electronic", "Mailed", "Bank Transfer"])              

# 10
b = st.button("Predict")

# 11
if b:
    if id.strip() != "":

        # Dealing With Input Data
        i = pd.DataFrame({
        
        'Age': [A],
        'Tenure': [T],
        'MonthlyCharges':[M],
        'ContractType':[C],
        'PaymentMethod':[P_M]
        })


        k = Model.predict(i)

        if k[0] == 1:
            st.write("Your Customer", id,
                  "is going to churn")
        else:
            st.write("He will not Churn")
    else:
        st.write("Please fill the inputs")