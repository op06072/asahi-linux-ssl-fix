#!/bin/sh
# SPDX-License-Identifier: MIT

set -e

echo "  Downloading sctipts..."
curl -LJO https://github.com/op06072/asahi-linux-ssl-fix/blob/master/asahi-fix.tar.gz\?raw\=true

echo "  Extracting..."
echo
mv asahi-fix.tar.gz?raw\=true asahi-fix.tar.gz
tar xf asahi-fix.tar.gz

echo
echo "Choose an OS to install:"
echo "  1: Arch Linux (Official)"
echo "  2: Debian"
read -p "  OS: " os < /dev/tty
if [ $os -lt 1 -o $os -gt 2 ];then
  echo
  echo "Please choose the right number!"
  exit 1
fi

echo "  Downloading Installer..."
curl https://alx.sh -o asahi.sh
mv asahi.sh ./asahi-fix/asahi.sh

echo "  Editing Installer..."
eval `which python3` ./asahi-fix/fix-ssl.py "$os"

echo "  Start Installer..."
exec sh ./asahi-fix/asahi.sh
