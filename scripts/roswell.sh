#!/bin/sh
set -e
git clone https://github.com/roswell/roswell.git --depth 1 --branch $1
cd roswell
./bootstrap
./configure
make
cd ..
mkdir -p archive/bin
cp roswell/src/ros archive/bin/ros
mkdir -p archive/etc/roswell
cp roswell/lisp/*.lisp roswell/lisp/*.ros archive/etc/roswell
cp scripts/Makefile.roswell archive/Makefile
rm -rf roswell
mv archive roswell
tar czf roswell-bin-$1-`uname`.tgz roswell
./scripts/upload.sh roswell-bin-$1-`uname`.tgz roswell-bin-$1 $GITHUB_OWNER $GITHUB_REPO
