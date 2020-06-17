FROM python:3.8-buster

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apt-get update
RUN apt-get install -y python3-dev default-libmysqlclient-dev apt-utils
RUN pip install --upgrade setuptools
RUN pip install --upgrade pip && pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app