# SPDX-License-Identifier: MIT
from os.path import abspath
from sys import argv

shscript = abspath("./asahi-fix/asahi.sh")
osname = argv[1]
if osname == 1:
    with open(shscript, "r", encoding="utf-8") as f:
        lines = f.read().replace('tar xf "$PKG"', f'tar xf "$PKG"\ncp {abspath("./asahi-fix/urlcache-fix.py")} /tmp/asahi-install/urlcache.py')
elif osname == 2:
    with open(shscript, "r", encoding="utf-8") as f:
        origin = [
            "export INSTALLER_DATA_ALT=https://alx.sh/installer_data.json\n",
            "https://github.com/AsahiLinux/asahi-installer/raw/prod/data",
            "https://cdn.asahilinux.org",
            'tar xf "$PKG"'
        ]
        trans = [
            "",
            "https://tg.st/u",
            "https://tg.st/u",
            f'tar xf "$PKG"\ncp {abspath("./asahi-fix/urlcache-fix.py")} /tmp/asahi-install/urlcache.py'
        ]
        trans = dict(zip(origin, trans))
        lines = f.read()
        for i in origin:
            lines.replace(i, trans[i])

with open(shscript, "w", encoding="utf-8") as f:
    f.write(lines)