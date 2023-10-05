#version 1.0

FROM ubuntu


WORKDIR  /SolarJiji

#Install the WRF Pre-Requisite
RUN sudo apt-get update &&\ apt install csh \
    gfortran \
    m4 \
    mpich \
    libhdf5-mpich-dev \
    libpng-dev \
    libnetcdff-dev \
    netcdf-bin \
    ncl-ncarg \
    build-essential

#Install Jasperlib
RUN wget https://www.ece.uvic.ca/~frodo/jasper/software/jasper-1.900.29.tar.gz &&\
    tar xvf jasper-1.900.29.tar.gz  &&\
    cd jasper-1.900.29/  &&\
    ./configure --prefix=/opt/jasper-1.900.29  &&\
    make  &&\
    sudo make install


#Get the WRF Source code
RUN wget https://github.com/wrf-model/WRF/archive/v4.2.1.tar.gz &&\
    tar xvf v4.2.1.tar.gz &&\
    cd WRF-4.2.1/

#Installing WRF 4.2.1
RUN export NETCDF=/usr &&\
    export NETCDF_classic=1 &&\
    ./configure
