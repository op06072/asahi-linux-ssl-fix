#!/bin/sh
# SPDX-License-Identifier: MIT

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

eval `which python3` ./asahi-fix/os-picker.py
os=$(cat ./os.txt)

if [ $os -eq 1 ]
then
  curl https://alx.sh -o asahi.sh
elif [ $os -eq 2 ]
then
  curl -sL https://tg.st/d -o asahi.sh
else
  echo
  exit 1
fi
rm ./os.txt
mv asahi.sh ./asahi-fix/asahi.sh

echo "  Editing Installer..."
eval `which python3` ./asahi-fix/fix-ssl.py

echo "  Start Installer..."
exec sh ./asahi-fix/asahi.sh
