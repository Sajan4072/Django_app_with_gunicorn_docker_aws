FROM python:3.8.13-slim-buster
# Install system dependencies for psycog
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    libc-dev \
    build-essential \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY ./bookmyflight ./
RUN pip install --upgrade pip --no-cache-dir 
RUN pip install psycopg2-binary
RUN pip install -r /app/requirements.txt --no-cache-dir

# CMD [ "python3","manage.py","runserver","0.0.0.0:8000" ]

CMD [ "gunicorn","bookmyflight.wsgi:application","--bind","0.0.0.0:8000" ]
