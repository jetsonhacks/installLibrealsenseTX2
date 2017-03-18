#!/bin/bash
# Patch UVC RealSense camera format changes
# This file is provided in case you want to apply the patches, but not build the kernel immediately
cd /usr/src/kernel/kernel-4.4
sudo patch -p1 -i $HOME/librealsense/scripts/realsense-camera-formats.patch

