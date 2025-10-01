FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Streamlit port for Render
ENV PORT=10000

# Correctly pass $PORT to Streamlit
CMD streamlit run app.py --server.port=${PORT} --server.headless=true
