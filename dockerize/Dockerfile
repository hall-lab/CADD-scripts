FROM continuumio/miniconda
MAINTAINER Indraniel Das <idas@wustl.edu>

# Volumes
VOLUME /build

RUN apt-get update -qq && \
    apt-get -y install --no-install-recommends \
        apt-transport-https \
        bzip2 \
        ca-certificates \
        curl \
        emacs \
        git \
        htop \
        less \
        libnss-sss \
        procps && \
    apt-get clean

# https://serverfault.com/questions/683605/docker-container-timezone-will-not-reflect-changes
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


WORKDIR /build

# Import resources
COPY ./build-script.sh /build

RUN ["/bin/bash", "-x", "build-script.sh"]

ENV PATH="/opt/CADD-1-5:/opt/conda/envs/cadd-env-v1.5/bin:/opt/conda/bin:${PATH}" \
    PYTHONPATH=/opt/conda/envs/cadd-env-v1.5/lib/python2.7/site-packages
