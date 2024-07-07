FROM ubuntu:jammy AS base

WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y python3 python3-pip && \
    pip install --user ansible

WORKDIR /root
ENV PATH="/root/.local/bin:${PATH}"
COPY . .
