#!/bin/bash

# Remove redundant default packages
sed -i "/luci-app-cpufreq/d" include/target.mk