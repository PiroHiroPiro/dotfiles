#!/bin/bash -e

uptime | awk '{print $(NF-2)}'
