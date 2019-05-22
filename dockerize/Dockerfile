FROM debian:stretch
MAINTAINER Indraniel Das <idas@wustl.edu>

# Volumes
VOLUME /build
VOLUME /release


RUN apt-get update -qq \
    && apt-get -y install apt-transport-https \
    &&  apt-get install -y bzip2 \
    &&  apt-get install -y git \
    &&  apt-get install -y curl \
    --no-install-recommends

# https://serverfault.com/questions/683605/docker-container-timezone-will-not-reflect-changes
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


WORKDIR /build

# Import resources
COPY ./build-script.sh /build

RUN ["/bin/bash", "build-script.sh"]
