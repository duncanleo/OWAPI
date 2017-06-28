FROM python:3.5.3-alpine

RUN apk update
RUN apk add pkgconfig libxslt-dev zlib-dev build-base

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install uvloop

COPY . .
ENV PYTHONPATH .
CMD ["asphalt", "run", "-l", "uvloop", "config.docker.yml"]
