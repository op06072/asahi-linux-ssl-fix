#!/bin/sh
# SPDX-License-Identifier: MIT

echo
echo "Choose an OS to install:"
echo "  1: Arch Linux (Official)"
echo "  2: Debian"
read -p "  OS: " os

echo "  Downloading Installer..."
if [ $os -eq 1 ]
then
  curl https://alx.sh -o asahi.sh
elif [ $os -eq 2 ]
then
  curl -sL https://tg.st/d -o asahi.sh
else
  echo
  echo "Please choose the right number!"
  exit 1
fi
mv asahi.sh ./asahi-fix/asahi.sh

echo "  Editing Installer..."
eval `which python3` ./asahi-fix/fix-ssl.py

echo "  Start Installer..."
exec sh ./asahi-fix/asahi.sh