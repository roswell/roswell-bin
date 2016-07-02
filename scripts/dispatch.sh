#!/bin/sh
./scripts/`grep TARGET target |awk '{print $2}'`.sh `grep VERSION target |awk '{print $2}'`
