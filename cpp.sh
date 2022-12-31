#!/bin/bash
multipass launch ubuntu --name gt --cpus 2 --mem 2G --disk 8G
multipass exec gt -- bash -c 'sudo apt-get update && apt-get install -y apt-transport-https'
multipass exec gt -- bash -c 'sudo apt install -y git python3 cmake g++ python-is-python3'
multipass exec gt -- bash -c 'cd /home/ubuntu/'
multipass exec gt -- bash -c 'git clone https://github.com/devplaybooks/cpp_gtest.git'
multipass exec gt -- bash -c 'cd /home/ubuntu/cpp_gtest && bin/doit'
# Setup daemon.

echo "Multipass gt instance created."
