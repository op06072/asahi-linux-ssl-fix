#!/bin/sh
# SPDX-License-Identifier: MIT

curl -LJO https://github.com/op06072/asahi-linux-ssl-fix/blob/master/asahi-fix.tar.gz\?raw\=true
mv asahi-fix.tar.gz?raw\=true asahi-fix.tar.gz
tar -zxvf asahi-fix.tar.gz
curl https://alx.sh -o asahi.sh
python=`which python3`
cd asahi-fix
exec $python fix-ssl.py