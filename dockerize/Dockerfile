FROM continuumio/miniconda
MAINTAINER Indraniel Das <idas@wustl.edu>

# Volumes
VOLUME /build

RUN apt-get update -qq \
    && apt-get -y install \
        apt-transport-https \
        less \
        emacs \
        bzip2 \
        git \
        ca-certificates \
        curl \
        libnss-sss \
    --no-install-recommends

# https://serverfault.com/questions/683605/docker-container-timezone-will-not-reflect-changes
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


WORKDIR /build

# Import resources
COPY ./build-script.sh /build

RUN ["/bin/bash", "-x", "build-script.sh"]
RUN apt-get clean all

ENV PATH="/opt/CADD-1-5:/opt/conda/envs/cadd-env-v1.5/bin:/opt/conda/bin:${PATH}"
ENV PYTHONPATH=/opt/conda/envs/cadd-env-v1.5/lib/python2.7/site-packages
