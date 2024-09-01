FROM fedora:latest AS base

USER root
WORKDIR /usr/local/bin
RUN dnf update -y && \
    dnf install ansible -y

FROM base AS kojo
RUN useradd -m kg
RUN usermod -aG wheel kg
RUN yes pass | passwd kg
RUN mkdir /home/kg/.ansible
COPY . /home/kg/.ansible
RUN chown -R kg:kg /home/kg/.ansible

FROM kojo
USER kg
WORKDIR /home/kg
ENV PATH="/home/kg/.local/bin:${PATH}"
