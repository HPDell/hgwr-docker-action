FROM ubuntu:20.04

COPY entrypoint.sh /entrypoint.sh

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update -qq && \
    apt-get install -qq --no-install-recommends \
    build-essential \
    gfortran \
    devscripts \
    wget \
    cmake \
    software-properties-common \
    dirmngr
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
RUN apt-get install -qq --no-install-recommends \
    r-base \
    libgsl-dev \
    libgit2-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libssl-dev \
    libblas-dev \
    liblapack-dev
RUN Rscript -e "install.packages(c('devtools', 'Rcpp', 'RcppArmadillo'), Ncpus = parallel::detectCores(), quiet = T)"

ENTRYPOINT [ "/entrypoint.sh" ]
