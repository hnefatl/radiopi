#!/usr/bin/env bash

set -e

nix build .#nixosConfigurations.radiopi.config.system.build.sdImage
echo "Now use e.g.:
  sudo unzstd result/sd-image/nixos-image-rpi5-kernel.img.zst -o /dev/sdc
Then
  <boot the pi>

  <dnsmasq a DNS server, ssh in, and \`sudo nmtui\` the wifi>

  sudo chown keith:users /etc/nixos

  <run nixos-rebuild build to set the substituters>
  nh os switch /etc/nixos

  mkdir -p ~/.rdp-certs
  openssl req -new -x509 -days 365 -nodes -sha256 -newkey rsa:4096 -out ~/.rdp-certs/tls.crt -keyout ~/.rdp-certs/tls.key -subj "/CN=radiopi.local"
  chmod 600 ~/.rdp-certs/tls.key

  grdctl --headless rdp set-tls-key ~/.rdp-certs/tls.key
  grdctl --headless rdp set-tls-cert ~/.rdp-certs/tls.crt

  grdctl --headless rdp set-credentials keith
  <enter password for rdp>
  grdctl --headless rdp disable-view-only
  grdctl --headless rdp enable\
"
