#!/bin/sh
# SPDX-License-Identifier: MIT

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
