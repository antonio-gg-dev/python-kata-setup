FROM python:latest

RUN pip install coverage
RUN pip install pytest-cov

WORKDIR /code
VOLUME ["/code"]
