{ pkgs, ... }:

{
  users.users.keith = {
    isNormalUser = true;

    extraGroups = [
      "wheel"
      "plugdev"
    ];

    shell = pkgs.zsh;

    openssh.authorizedKeys.keys = builtins.attrValues (import ../ssh_keys.nix).keith;
  };
}
