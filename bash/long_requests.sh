#!/bin/bash
path='/var/log/fake_logs.log'
if [ -n "$1" ]; then
  path=$1
fi
sort -k6 -n -r < "$path" | head -10
