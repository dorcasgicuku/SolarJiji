FROM wrf_final:version1

MAINTAINER Dorcas
RUN cd jasper-1.900.29/ &&\
    wget https://github.com/wrf-model/WPS/archive/v4.2.tar.gz &&\
    tar xvf v4.2.tar.gz &&\
    cd WPS-4.2/

ENV  WRF_DIR=../WRF-4.2.1/ 
ENV export JASPERLIB=/opt/jasper-1.900.29/lib/
ENV export JASPERINC=/opt/jasper-1.900.29/include/


