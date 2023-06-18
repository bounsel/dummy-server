FROM python:3.9-slim

WORKDIR /app

COPY app.py .

RUN apt-get update && \
    apt-get install -y && \
    pip install flask gunicorn

EXPOSE 80

CMD ["gunicorn", "-b", "0.0.0.0:80", "app:app"]
