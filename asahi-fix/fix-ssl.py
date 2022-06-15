# SPDX-License-Identifier: MIT
from os.path import isdir

if isdir('/tmp/asahi-install'):
    with open("./asahi.sh", "r", encoding="utf-8") as f:
        lines = f.read().replace('tar xf "$PKG"', 'tar xf "$PKG"\ncp ./urlcache-fix.py /tmp/asahi-install/urlcache.py')

    with open("./asahi.sh", "w", encoding="utf-8") as f:
        f.write(lines)
