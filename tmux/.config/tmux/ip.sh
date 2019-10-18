#!/bin/bash -e

ipconfig getifaddr `netstat -rn -f inet | awk '/^default/{print $6;exit}'`
