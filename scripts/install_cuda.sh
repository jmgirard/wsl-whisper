#!/bin/bash
# install_cuda.sh

set -e

# A function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

# Install apt dependencies
apt_install \
    build-essential \
    ca-certificates \
    curl \
    ffmpeg \
    gnupg \
    libarchive-dev \
    software-properties-common \
    wget

# Install CUDA Toolkit for WSL Ubuntu using deb (network)
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
apt-get update
apt-get -y install cuda-toolkit-12-8

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*
rm cuda-keyring_1.1-1_all.deb
