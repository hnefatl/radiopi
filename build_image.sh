#!/usr/bin/env bash

#exec nix build .#nixosConfigurations.radiopi.config.system.build.sdImage
exec nix build .#nixosConfigurations.radiopi.config.system.build.diskoImagesScript
