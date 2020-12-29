#!/bin/bash
path='/var/log/fake_logs.log'
if [ -n "$1" ]; then
  path=$1
fi
grep ERROR < "$path"
