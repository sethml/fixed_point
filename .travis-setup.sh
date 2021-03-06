#!/usr/bin/env bash

# Before install
sudo add-apt-repository -y ppa:kalakris/cmake
    sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
    if [ "$CXX" = "clang++" ]; then
        wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key add -
        sudo add-apt-repository -y "deb http://llvm.org/apt/precise/ llvm-toolchain-precise-3.5 main"
    fi
sudo apt-get update -qq

# Install
sudo apt-get install -qq cmake
if [ "$CXX" = "g++" ]; then
    sudo apt-get install -qq gcc-4.8 g++-4.8
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 90
    sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 90
elif [ "$CXX" = "clang++" ]; then
    sudo apt-get install -qq clang-3.5
    sudo update-alternatives --install /usr/local/bin/clang   clang   /usr/bin/clang-3.5 90
    sudo update-alternatives --install /usr/local/bin/clang++ clang++ /usr/bin/clang++-3.5 90
    export PATH=/usr/local/bin:$PATH
fi
