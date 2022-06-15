#!/bin/sh
# SPDX-License-Identifier: MIT

curl https://alx.sh -o asahi.sh
python=`which python3`
exec $python fix-ssl.py