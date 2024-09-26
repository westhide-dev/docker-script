#!/usr/bin/env bash

set -e

CUR_DIR=$(realpath $(dirname ${BASH_SOURCE:-0}))

sudo apt-get update
sudo apt-get install -y locales build-essential curl vim

sudo localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y
