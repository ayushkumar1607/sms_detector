# Dockerfile
FROM python:3.10-slim

WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY . .

# Expose Render port
ENV PORT=10000

# Start Streamlit
CMD ["streamlit", "run", "app.py", "--server.port=$PORT", "--server.headless=true"]
