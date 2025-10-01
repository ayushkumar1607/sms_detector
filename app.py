import streamlit as st
import pickle
import string
import nltk
from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer

ps = PorterStemmer()
tfidf = pickle.load(open('vectorizer.pkl', 'rb'))
model = pickle.load(open('model.pkl', 'rb'))

st.title('Welcome to Spam Detection For Email and SMS')
input_message = st.text_input('Enter Your Message')

if st.button('Predict'):

    def transform_text(text):
        text = text.lower()
        text = nltk.word_tokenize(text)
        # upto now text has converted into list
        y = []
        for i in text:
            if i.isalnum():  # keep only alpha numeric
                y.append(i)
        text = y[:]  # copy list
        y.clear()
        for i in text:
            if i not in stopwords.words('english') and i not in string.punctuation:
                y.append(i)
        text = y[:]
        y.clear()
        for i in text:
            y.append(ps.stem(i))
        return " ".join(y)

    # 1. preprocess
    transformed_sms = transform_text(input_message)
    # 2. vectorize
    vector_input = tfidf.transform([transformed_sms])
    # 3. predict
    result = model.predict(vector_input)[0]
    # 4. display
    if result == 1:
        st.header('Spam !')
    else:
        st.header('Not Spam')



