#!/usr/bin/env bash

dnf -yq install nss-mdns avahi-tools
systemctl enable --now avahi-daemon.service
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >> /etc/sysctl.conf
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >> /etc/sysctl.conf
dnf -y install podman
dnf -y update

