FROM ubuntu:bionic-20210325


RUN apt-get update && apt-get upgrade -y && apt-get install wget gawk -y
RUN wget https://raw.githubusercontent.com/kasmar00/PUT-JFiK-Docker/master/llgen_install.sh
RUN bash llgen_install.sh

ENV PATH="/ack-build/bin:${PATH}"
