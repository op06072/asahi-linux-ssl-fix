#!/bin/sh
# SPDX-License-Identifier: MIT

echo "  Downloading sctipts..."
curl -LJO https://github.com/op06072/asahi-linux-ssl-fix/blob/master/asahi-fix.tar.gz\?raw\=true

echo "  Extracting..."
mv asahi-fix.tar.gz?raw\=true asahi-fix.tar.gz
tar xf asahi-fix.tar.gz
cd asahi-fix

echo "  Downloading Installer..."
curl https://alx.sh -o asahi.sh

echo `pwd`

echo "  Editing Installer..."
exec `which python3` fix-ssl.py
