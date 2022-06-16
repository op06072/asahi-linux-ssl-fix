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
  echo "Arch"
elif [ $os -eq 2 ]
then
  echo "Debian"
else
  echo
  echo "Please choose the right number!"
  exit 1
fi
mv asahi.sh ./asahi-fix/asahi.sh