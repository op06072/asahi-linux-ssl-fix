# SPDX-License-Identifier: MIT
from os.path import abspath

print("enter")
with open(abspath("./asahi-fix/asahi.sh"), "r", encoding="utf-8") as f:
    lines = f.read().replace('tar xf "$PKG"', 'tar xf "$PKG"\ncp ./urlcache-fix.py /tmp/asahi-install/urlcache.py')

with open(abspath("./asahi-fix/asahi.sh"), "w", encoding="utf-8") as f:
    f.write(lines)
