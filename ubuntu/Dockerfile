# syntax=docker/dockerfile:1

FROM ubuntu:24.04
SHELL ["/bin/bash", "-c"]

ARG SHELL
ARG WORKDIR
ARG DK_USER

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt install -y sudo tzdata

RUN useradd -rmU ${DK_USER} -G sudo
RUN sed -i 's|%sudo.ALL=(ALL:ALL).ALL|%sudo ALL=(ALL:ALL) NOPASSWD: ALL|' /etc/sudoers

WORKDIR ${WORKDIR}
USER ${DK_USER}

COPY init.sh /init.sh
COPY entrypoint.sh /entrypoint.sh

RUN /init.sh

ENV SHELL ${SHELL}
ENV LANG en_US.utf8

ENTRYPOINT ["/entrypoint.sh"]
