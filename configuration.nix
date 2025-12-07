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
  networking.hostId = "f818a96b";

  boot.loader.raspberryPi.bootloader = "kernel";

  programs.zsh.enable = true;

  system.stateVersion = "25.05";
}
