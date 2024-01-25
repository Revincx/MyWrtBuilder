#!/bin/bash

echo "Start Clash Core Download !"
echo "Current Path: $PWD"

mkdir -p files/etc/openclash/core
cd files/etc/openclash/core || (echo "Clash core path does not exist! " && exit)

# Clash Dev
wget https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-amd64.tar.gz
tar -zxvf clash-linux-amd64.tar.gz
rm -rf clash-linux-amd64.tar.gz
mv clash clash_dev

# Clash TUN
VERSION=$(curl -sS https://raw.githubusercontent.com/vernesong/OpenClash/core/dev/core_version | awk 'NR==2')
wget https://raw.githubusercontent.com/vernesong/OpenClash/core/master/premium/clash-linux-amd64-$VERSION.gz
gzip -d clash-linux-amd64-$VERSION.gz
rm -rf clash-linux-amd64-$VERSION.gz
mv clash-linux-amd64-$VERSION clash_tun

# Clash Meta
wget https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz
tar -zxvf clash-linux-amd64.tar.gz
rm -rf clash-linux-amd64.tar.gz
mv clash clash_meta

# Use clash_dev as default core
mv clash_dev clash
