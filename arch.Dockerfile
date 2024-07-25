FROM archlinux:latest AS base

WORKDIR /usr/local/bin
RUN pacman -Syyyu --noconfirm && \
    pacman -S --noconfirm ansible

WORKDIR /root
ENV PATH="/root/.local/bin:${PATH}"
COPY . .
