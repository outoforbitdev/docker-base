#!/usr/bin/env sh

cat /etc/*-release | head -n 4 | grep "Debian GNU/Linux 11 (bullseye)"
dotnet --info | head -n 6 | grep "6.0.25"
