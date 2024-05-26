FROM python:3.8.13-slim-buster
WORKDIR /app
COPY ./deploy_django with gunicorn and docker and aws/Django_app_with_gunicorn_docker_aws/bookmyflight ./
RUN pip install --upgrade pip --no-cache-dir 
RUN pip install -r /app/requirements.txt --no-cache-dir

CMD [ "python3","manage.py","runserver","0.0.0.0:8000" ]

# CMD [ "gunicorn","bookmyflight.wsgi:application","--bind","0.0.0.0:8000" ]
