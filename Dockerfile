FROM python:3.9-slim

WORKDIR /app

COPY app.py .
COPY cert.pem /app/cert.pem
COPY key.pem /app/key.pem

RUN apt-get update && \
    apt-get install -y && \
    pip install flask gunicorn

EXPOSE 80
#EXPOSE 80 443

CMD ["gunicorn", "-b", "0.0.0.0:80", "app:app"]
#CMD ["gunicorn", "-b", "0.0.0.0:80", "-b", "0.0.0.0:443", "--keyfile", "/app/key.pem", "--certfile", "/app/cert.pem", "app:app"]
