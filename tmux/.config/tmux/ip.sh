#!/bin/bash -e

#version="$(sw_vers | grep ProductVersion | awk '{print $2}')"
#if [ "`echo $version | grep 10.15`" ]; then
  private_ip=$(ipconfig getifaddr `netstat -rn -f inet | awk '/^default/{print $4;exit}'`)
#else
#  private_ip=$(ipconfig getifaddr `netstat -rn -f inet | awk '/^default/{print $6;exit}'`)
#fi

# https://qiita.com/ksugawara61/items/887ddd1792d7d5dabb25
public_ip=$(curl -s inet-ip.info)

echo "${public_ip}(${private_ip})"
