#!/bin/bash -e

version="$(sw_vers | grep ProductVersion | awk '{print $2}')"
if [ "`echo $version | grep 10.15`" ]; then
  ipconfig getifaddr `netstat -rn -f inet | awk '/^default/{print $4;exit}'`
else
  ipconfig getifaddr `netstat -rn -f inet | awk '/^default/{print $6;exit}'`
fi
