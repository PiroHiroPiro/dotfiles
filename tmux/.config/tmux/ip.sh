#!/bin/bash -e

if [ "$(uname)" == "Darwin" ]; then
  version="$(sw_vers | grep ProductVersion | awk '{print $2}')"
  if [ "${version}" == "10.15" ]; then
    ipconfig getifaddr `netstat -rn -f inet | awk '/^default/{print $4;exit}'`
  else
    ipconfig getifaddr `netstat -rn -f inet | awk '/^default/{print $6;exit}'`
  fi
else
  ipconfig getifaddr `netstat -rn -f inet | awk '/^default/{print $6;exit}'`
fi
