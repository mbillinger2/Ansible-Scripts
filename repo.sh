#!/bin/bash

# Script to configure YUM repos on all managed nodes using Ansible ad-hoc commands

echo "Configuring BaseOS repository..."
ansible all -m yum_repository -a "name=BaseOS description='BaseOS Repo' baseurl=http://10.1.14.36/RHEL9/BaseOS gpgcheck=no enabled=yes" -b

echo "Configuring AppStream repository..."
ansible all -m yum_repository -a "name=AppStream description='AppStream Repo' baseurl=http://10.1.14.36/RHEL9/AppStream gpgcheck=no enabled=yes" -b

echo "Cleaning DNF cache..."
ansible all -m shell -a "dnf clean all" -b

echo "Verifying repository configuration..."
ansible all -m shell -a "dnf repolist" -b

echo "Repository configuration completed!"
