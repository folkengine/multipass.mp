#!/bin/bash
multipass launch ubuntu --name gtcov --cpus 2 --memory 2G --disk 8G
multipass exec gtcov -- bash -c 'sudo apt-get update'
multipass exec gtcov -- bash -c 'sudo apt install -y apt-transport-https build-essential python3 python3-pip cmake python-is-python3 llvm lcov'
multipass exec gtcov -- bash -c 'pip install gcovr'
multipass exec gtcov -- bash -c 'cd /home/ubuntu/'
multipass exec gtcov -- bash -c 'git clone https://github.com/devplaybooks/cpp_gtest.git'
multipass exec gtcov -- bash -c 'cd cpp_gtest/'
multipass exec gtcov -- bash -c 'sh bin/doit'
# Setup daemon.

echo "Multipass gtcov instance created."

# recommended:
# gcc-11-locales debian-keyring g++-multilib g++-11-multilib gcc-multilib autoconf automake
#  libtool flex bison gdb gcc-11-multilib bzr libgd-tools
