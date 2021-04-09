FROM python:3.8.5

ENV TZ=Asia/Ho_Chi_Minh
RUN apt-get install tzdata -y
RUN mkdir /code
COPY requirements.txt /code

RUN pip install -r /code/requirements.txt
COPY . /code
WORKDIR /code
CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000