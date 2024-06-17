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
    dirmngr
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
RUN apt-get -qq install --no-install-recommends \
    r-base \
    libgsl-dev \
    libboost-dev \
    libboost-program-options-dev \
    libgit2-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libssl-dev \
    libblas-dev \
    liblapack-dev \
    libarmadillo-dev \
    r-cran-devtools \
    r-cran-rcpp \
    r-cran-rcpparmadillo \
    r-cran-tidyverse \
    r-cran-sf \
    r-cran-spdep \
    r-cran-tmap

RUN Rscript -e "install.packages(c('lme4', 'GWmodel'), Ncpus = parallel::detectCores(), quiet = T)"

ENTRYPOINT [ "/entrypoint.sh" ]
