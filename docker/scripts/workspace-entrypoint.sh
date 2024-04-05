#!/bin/bash
#
# Copyright (c) 2021, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.

# Build ROS dependency
# Don't add setup.bash if already added to .bashrc
if ! grep -q "source /opt/ros/${ROS_DISTRO}/setup.bash" ~/.bashrc; then
  echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
fi
source /opt/ros/${ROS_DISTRO}/setup.bash

sudo apt-get update
rosdep update

# Restart udev daemon
sudo service udev restart

sudo touch /.entrypoint_done

$@
