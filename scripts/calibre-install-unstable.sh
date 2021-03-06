#!/bin/bash

# Thanks to Jerry Vonau (https://github.com/jvonau) who made this critical
# breakthrough possible!
#
# Calibre 3.25 is the latest available from testing as of 2018-06-10:
#
#   https://packages.debian.org/search?keywords=calibre
#   http://deb.debian.org/debian/pool/main/c/calibre/
#   http://raspbian.raspberrypi.org/raspbian/pool/main/c/calibre/
#   http://archive.raspbian.org/raspbian/pool/main/c/calibre/
#
# Might break future updates; you have been warned.

export DEBIAN_FRONTEND=noninteractive
# Prepares to update to latest from unstable
apt-key adv --recv-key --keyserver keyserver.ubuntu.com 7638D0442B90D010
echo "deb http://deb.debian.org/debian unstable main" >> /etc/apt/sources.list.d/unstable.list
apt update
apt -y install calibre calibre-bin
# Removes last line, safer than: rm /etc/apt/sources.list.d/unstable.list
sed -i '$ d' /etc/apt/sources.list.d/unstable.list
# Clears the cache of testing and unstable
apt update
