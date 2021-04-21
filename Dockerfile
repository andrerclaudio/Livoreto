# Application
# docker run --rm -it --network livoreto_network -v $(pwd)/config.ini:/livoreto/config.ini:ro  andrerclaudio/livoreto:livoreto_dev
# docker build -f Dockerfile . -t andrerclaudio/livoreto:livoreto_dev

# Database
# docker run --rm -d --network livoreto_network -v $(pwd)/Mongodata:/data/db --name mongodb mongo
# docker exec -i -t mongodb bash
# mongodump --out /data/db/backup
# mongorestore /data/db/backup

# Network
# docker network create --driver bridge livoreto_network

# -----------------------------------------------------------------------------------------------

FROM python:latest

LABEL maintainer="Andre Ribeiro <andre.ribeiro.srs@gmail.com>"

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

ENV TZ=America/Sao_Paulo

ARG DEBIAN_FRONTEND=noninteractive

CMD gunicorn --bind 0.0.0.0:$PORT wsgi

WORKDIR /livoreto
ADD . /livoreto

COPY requirements.txt /tmp/

RUN pip3 install --no-cache-dir --trusted-host pypi.python.org -r /tmp/requirements.txt

RUN apt update && apt-get install -y --no-install-recommends --yes
RUN apt upgrade -y

CMD ["python", "main.py", "Heroku"]
 