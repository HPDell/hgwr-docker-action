FROM ubuntu:22.04

COPY entrypoint.sh /entrypoint.sh

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get -qq update && \
    apt-get -qq install --no-install-recommends \
    build-essential \
    gfortran \
    devscripts \
    wget \
    cmake \
    software-properties-common \
    dirmngr \
    libgsl-dev \
    libboost-dev \
    libboost-program-options-dev \
    libgit2-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libssl-dev \
    libblas-dev \
    liblapack-dev \
    libarmadillo-dev

ENTRYPOINT [ "/entrypoint.sh" ]
