FROM ubuntu:jammy AS base

WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y sudo python3 python3-pip ssh

FROM base AS kojo
RUN addgroup --gid 1000 kg
RUN adduser --gecos kg --uid 1000 --gid 1000 --disabled-password kg
RUN usermod -aG sudo kg
RUN yes pass | passwd kg
RUN mkdir /home/kg/.ansible
COPY . /home/kg/.ansible
RUN chown -R kg:kg /home/kg/.ansible

FROM kojo
USER kg
WORKDIR /home/kg
RUN pip install --user ansible
ENV PATH="/home/kg/.local/bin:${PATH}"
