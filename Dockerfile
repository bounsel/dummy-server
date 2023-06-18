FROM python:3.9-slim

WORKDIR /app

COPY app.py .

RUN apt-get update && \
    apt-get install -y openssl && \
    openssl req -x509 -newkey rsa:4096 -nodes -out cert.pem -keyout key.pem -days 365 -subj '/CN=localhost' && \
    pip install flask gunicorn

EXPOSE 443

CMD ["gunicorn", "-b", "0.0.0.0:443", "--certfile=cert.pem", "--keyfile=key.pem", "app:app"]
