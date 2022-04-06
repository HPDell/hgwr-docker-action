FROM ubuntu:20.04

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
RUN wget -qO- http://sourceforge.net/projects/arma/files/armadillo-9.900.6.tar.xz | \
    tar -Jxf- --directory=. --strip-components=1 && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DDETECT_HDF5=OFF -DBUILD_SHARED_LIBS=OFF . && \
    make && make install
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
    liblapack-dev
RUN Rscript -e "install.packages(c('devtools', 'Rcpp', 'RcppArmadillo'), Ncpus = parallel::detectCores(), quiet = T)"

ENTRYPOINT [ "/entrypoint.sh" ]
