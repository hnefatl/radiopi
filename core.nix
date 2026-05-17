{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./users/users.nix
  ];

  networking.hostName = "radiopi";
  system.stateVersion = "25.11";

  # "User-facing" networking, rather than systemd-network. I don't want to deal with embedding secrets into the image, so just
  # require a manual connection and `dnsmasq` DHCP server setup after first flash.
  networking.networkmanager.enable = true;

  programs.zsh.enable = true;
}
