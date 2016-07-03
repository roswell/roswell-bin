#!/bin/sh
set -e

./scripts/upload.sh roswell-bin-$2-`uname`.tgz $1 $GITHUB_OWNER $GITHUB_REPO
