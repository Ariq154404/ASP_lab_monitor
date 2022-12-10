#!/bin/bash
while true 
do

for pid in $(pgrep -u "$(whoami)")
do
if  [ $(ps -u | grep  $pid | wc -l) -gt 1 ] && [  $(pstree -p $pid  | grep -o '([0-9]\+)' | wc -l) -gt 6 ]
then
date '+%Y-%m-%d %H:%M:%S' >> log.txt
ps -u >>log.txt
pstree -p $pid >> log.txt
fi
done
sleep 2

done
