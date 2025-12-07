{ config, pkgs, ... }:
{
  users.users.root = {
    uid = 0;
    shell = pkgs.zsh;
  };
}
