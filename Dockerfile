FROM python:3.8.5

ENV TZ=Asia/Ho_Chi_Minh
RUN apt-get install tzdata -y
WORKDIR /code

COPY ../requirements.txt .

RUN pip install -r requirements.txt
COPY ../ .
CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000