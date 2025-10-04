# Base image with Python 3.9.13
FROM python:3.9.13-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# Expose port 5000 (Flask default)
EXPOSE 5000

# Command to run the app
CMD ["python", "app.py"]
