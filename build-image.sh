#!/bin/bash
clear

# source /usr/bin/shellscripts/common.sh


# build xBuild image
docker build -t poixson/xbuild:0.1.0 .
docker tag -f poixson/xbuild:0.1.0 poixson/xbuild:latest
