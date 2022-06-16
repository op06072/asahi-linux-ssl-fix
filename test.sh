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

exec </dev/tty >/dev/tty 2>/dev/tty
exec `which python3` ./asahi-fix/os-picker.py
