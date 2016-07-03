#!/bin/sh
set -e
if [ x$(expr substr $(uname -s) 1 8) == xMINGW64 ]; then
    curl --no-progress-bar --retry 10 -o roswell.tgz -L https://ci.appveyor.com/api/buildjobs/8jqoa9kylo7fc72l/artifacts/roswell-bin-v0.0.6.64-MINGW64_NT-6.3.tgz
elif [ x$(expr substr $(uname -s) 1 8) == xMINGW32 ]; then
    curl --no-progress-bar --retry 10 -o roswell.tgz -L https://ci.appveyor.com/api/buildjobs/763vvgf6t7kt38h5/artifacts/roswell-bin-v0.0.6.64-MINGW32_NT-6.3-WOW.tgz
elif [ "$(uname)" == "Darwin" ]; then
    curl --no-progress-bar --retry 10 -o roswell.tgz -L https://github.com/roswell/roswell-bin/releases/download/roswell-bin-v0.0.6.64/roswell-bin-v0.0.6.64-Linux.tgz
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    curl --no-progress-bar --retry 10 -o roswell.tgz -L https://github.com/roswell/roswell-bin/releases/download/roswell-bin-v0.0.6.64/roswell-bin-v0.0.6.64-Linux.tgz
fi

tar xf roswell.tgz
cd roswell/
make install
cd ..
rm -rf roswell