FROM ubuntu:jammy AS base

WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y sudo python3 python3-pip 

FROM base AS kojo
RUN addgroup --gid 1000 kg
RUN adduser --gecos kg --uid 1000 --gid 1000 --disabled-password kg
RUN passwd kg -d
RUN usermod -aG sudo kg
USER kg
WORKDIR /home/kg
RUN pip install --user ansible
RUN mkdir /home/kg/.ansible
ENV PATH="/home/kg/.local/bin:${PATH}"

FROM kojo
COPY . /home/kg/.ansible
RUN sudo chown kg:kg -R /home/kg/.ansible
