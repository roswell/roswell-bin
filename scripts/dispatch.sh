#!/bin/sh
TARGET=`grep TARGET target |awk '{print $2}'`
VERSION=`grep VERSION target |awk '{print $2}'`

./scripts/clean.sh
if [ x$1 = x ]; then
    ./scripts/$TARGET.sh $VERSION
elif [ x$1 = xupload ]; then
    ./scripts/$TARGET-upload.sh $2 $VERSION;
fi
