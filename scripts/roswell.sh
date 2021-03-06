#!/bin/bash
set -e
git clone https://github.com/roswell/roswell.git --depth 1 --branch $1
cd roswell
./bootstrap
./configure --prefix=/usr/local
make
cd ..
mkdir -p archive/bin
cp -f roswell/src/ros archive/bin/ros|true
cp -f roswell/src/ros.exe archive/bin/ros.exe|true
mkdir -p archive/etc/roswell
cp roswell/lisp/*.lisp roswell/lisp/*.ros archive/etc/roswell
cp scripts/Makefile.roswell archive/Makefile
rm -rf roswell
mv archive roswell
echo roswell-bin-$1-`uname`.tgz
if [ x$(expr substr $(uname -s) 1 5) == xMINGW ]; then
    bsdtar czf roswell-bin-$1-`uname`.tgz roswell
else
    tar pczf roswell-bin-$1-`uname`.tgz roswell
fi
