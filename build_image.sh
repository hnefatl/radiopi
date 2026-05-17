#!/usr/bin/env bash

nix build .#nixosConfigurations.radiopiInstaller.config.system.build.sdImage
echo "Now use e.g.:"
echo "sudo unzstd result/sd-image/nixos-image-rpi5-kernel.img.zst -o /dev/sdc"
