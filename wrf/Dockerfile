#version 1.0

FROM debian:buster


WORKDIR  /SolarJiji

# Set environment variables (optional)
ENV DEBIAN_FRONTEND=noninteractive

#Install the WRF Pre-Requisite
RUN apt-get update &&\
    apt-get install -y \
    csh \
    gfortran \
    m4 \
    mpich \
    libhdf5-mpich-dev \
    libpng-dev \
    libnetcdff-dev \
    netcdf-bin \
    ncl-ncarg \
    build-essential

#Install wget and nano

RUN apt-get update &&\
    apt-get install -y wget
#Install Jasperlib

RUN wget https://www.ece.uvic.ca/~frodo/jasper/software/jasper-1.900.29.tar.gz &&\
    tar xvf jasper-1.900.29.tar.gz  &&\
    cd jasper-1.900.29/  &&\
    ./configure --prefix=/opt/jasper-1.900.29  &&\
    make  &&\
    make install &&\ 
#Get the WRF Source code
    wget https://github.com/wrf-model/WRF/archive/v4.2.1.tar.gz &&\
    tar xvf v4.2.1.tar.gz &&\
    cd WRF-4.2.1/

#Installing WRF 4.2.1
ENV  NETCDF=/usr
ENV NETCDF_classic=1
    # ./configure
