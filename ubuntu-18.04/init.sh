#!/bin/bash

set -e

CUR_DIR=$(realpath "$(dirname "${BASH_SOURCE:-$0}")")

sudo apt-get update
sudo apt-get install -y locales
sudo localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

sudo apt-get install -y ca-certificates openssh-client curl vim git git-lfs
sudo apt-get install -y build-essential cmake libssl-dev pkg-config
sudo apt-get install -y protobuf-compiler

sudo apt-get install -y lsb-release wget software-properties-common gnupg
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y
