{ config, ... }:
{
  boot = {
    supportedFilesystems.zfs = true;
    # https://openzfs.github.io/openzfs-docs/Getting%20Started/NixOS/index.html
    zfs.forceImportRoot = false;
  };

  services.zfs = {
    autoScrub = {
      enable = true;
      interval = "weekly";
    };
  };
}
