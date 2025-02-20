#!/bin/bash
cd ~/rom

. build/envsetup.sh
export CCACHE_DIR=~/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 8G -F 0
$lunch
$make -j$(nproc --all) &
sleep 100m
kill %1
ccache -s
