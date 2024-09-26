# syntax=docker/dockerfile:1

FROM ubuntu:24.04

ARG WORKDIR
ARG USER

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt install -y sudo tzdata

RUN useradd -rmU ${USER} -G sudo
RUN sed -i 's|%sudo.ALL=(ALL:ALL).ALL|%sudo ALL=(ALL:ALL) NOPASSWD: ALL|' /etc/sudoers

WORKDIR ${WORKDIR}
USER ${USER}

COPY init.sh /init.sh
COPY entrypoint.sh /entrypoint.sh

RUN /init.sh

ENV LANG en_US.utf8

ENTRYPOINT ["/entrypoint.sh"]
