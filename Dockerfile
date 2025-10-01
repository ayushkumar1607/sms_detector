# Use Python 3.10 slim for prebuilt wheels
FROM python:3.10-slim

WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Set Streamlit port (Render sets $PORT)
ENV PORT=10000

# Start Streamlit in headless mode
CMD ["streamlit", "run", "app.py", "--server.port=$PORT", "--server.headless=true"]
