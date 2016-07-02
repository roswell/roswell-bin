#!/bin/sh
set -e

./scripts/upload.sh roswell-bin-$1-`uname`.tgz roswell-bin-$1 $GITHUB_OWNER $GITHUB_REPO
