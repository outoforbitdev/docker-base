#!/usr/bin/env sh

cat /etc/*-release | head -n 4 | grep "Ubuntu 22.04.3 LTS"
node --version | head -n 1 | grep v18.18.2
npm --version | head -n 1 | grep 10.1.0