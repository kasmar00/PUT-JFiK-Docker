FROM ubuntu:bionic-20210325


RUN apt-get update && apt-get upgrade -y && apt-get install wget gawk -y
RUN wget https://gitlab.ptl.cloud/piotr/ack-build/-/raw/master/llgen_install.sh
RUN bash llgen_install.sh

ENV PATH="/ack-build/bin:${PATH}"