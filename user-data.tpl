#cloud-config
users:
  - name: ${admin_username}
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
package_upgrade: true
hostname: ${fqdn}
