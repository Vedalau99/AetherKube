FROM python:3.11-slim

# Create app user for security (non-root)
RUN useradd -m appuser

WORKDIR /app

# Install system deps (if needed) and pip requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY src/ ./src

# Chown to non-root user and switch
RUN chown -R appuser:appuser /app
USER appuser

ENV PYTHONUNBUFFERED=1
ENV FLASK_APP=src/main.py
ENV FLASK_RUN_HOST=0.0.0.0
EXPOSE 8080

# Start with gunicorn for production-ish local testing (one process)
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "src.main:app", "--workers", "2", "--threads", "4"]
