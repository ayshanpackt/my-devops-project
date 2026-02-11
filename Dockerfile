# Use official Python image
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# Expose port 8080
EXPOSE 8080

# Command to run the app with gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
