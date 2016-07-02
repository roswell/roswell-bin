#!/bin/sh
TARGET=`grep TARGET target |awk '{print $2}'`
VERSION=`grep VERSION target |awk '{print $2}'`

./scripts/clean.sh
./scripts/$TARGET.sh $VERSION
if [ x$1 = xupload ]; then
  ./scripts/$TARGET-upload.sh $VERSION;
fi
