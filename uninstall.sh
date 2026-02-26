#!/bin/bash

# Proxmox IP Notes Uninstaller

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Stopping and disabling proxmox-ip-notes service..."
systemctl stop proxmox-ip-notes
systemctl disable proxmox-ip-notes

echo "Removing service file..."
rm -f /etc/systemd/system/proxmox-ip-notes.service
systemctl daemon-reload

echo "Removing scripts from /usr/local/bin/..."
rm -f /usr/local/bin/ip-notes
rm -f /usr/local/bin/proxmox-auto-ip-notes

echo "Uninstallation complete."
