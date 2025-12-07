{ pkgs, ... }:

{
  users.users.keith = {
    isNormalUser = true;

    extraGroups = [
      "wheel"
    ];

    shell = pkgs.zsh;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ46ZX6zJQrMOdffEZqJk5bbgZpTnaExEprMDS9aQUpa keith@laptop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILVXUPyteZDsBXLsiFSVpW8Qr9qXi4wY7NkEQLeADAim keith@desktop"
    ];
  };
}
