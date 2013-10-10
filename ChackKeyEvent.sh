#!/bin/bash
#launch swatch & xev for watch keyevent
cd ~/opt/swatch
xev >> keylog.log -id $1 &
swatch -c start.swatchrc -t keylog.log
kill -9 `ps aux | grep xev | grep -v grep | awk '{print $2}'`
