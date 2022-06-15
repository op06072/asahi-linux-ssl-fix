# SPDX-License-Identifier: MIT
from os.path import abspath
from subprocess import Popen

shscript = abspath("./asahi-fix/asahi.sh")
with open(shscript, "r", encoding="utf-8") as f:
    lines = f.read().replace('tar xf "$PKG"', f'tar xf "$PKG"\ncp {abspath("./asahi-fix/urlcache-fix.py")} /tmp/asahi-install/urlcache.py')

with open(shscript, "w", encoding="utf-8") as f:
    f.write(lines)

print("  Start Installer...")
Popen(f"caffeinate -dis {shscript}", shell=True)
