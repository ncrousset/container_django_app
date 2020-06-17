FROM python:3.8-alpine

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk update
RUN apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install --upgrade setuptools
RUN pip install --upgrade pip && pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user