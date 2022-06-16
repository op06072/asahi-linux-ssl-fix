#!/bin/sh
# SPDX-License-Identifier: MIT

echo "  Downloading sctipts..."
curl -LJO https://github.com/op06072/asahi-linux-ssl-fix/blob/master/asahi-fix.tar.gz\?raw\=true

echo "  Extracting..."
echo
mv asahi-fix.tar.gz?raw\=true asahi-fix.tar.gz
tar xf asahi-fix.tar.gz

exec sh ./asahi-fix/fix-runner.sh
