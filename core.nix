{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./users/users.nix
    ./filesystems.nix
  ];

  networking.hostName = "radiopi";
  system.stateVersion = "25.11";

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  boot.loader.raspberry-pi.bootloader = "kernel";
  security.sudo.wheelNeedsPassword = false;

  # TTY config
  console = {
    keyMap = "uk";
    # Font details: https://files.ax86.net/terminus-ttf/README.Terminus.txt
    # 1 is codepage, 16 is size, n is normal style.
    font = "${pkgs.terminus_font}/share/consolefonts/ter-116n.psf.gz";
  };

  # "User-facing" networking, rather than systemd-network. I don't want to deal with embedding secrets into the image, so just
  # require a manual connection and `dnsmasq` DHCP server setup after first flash.
  networking.networkmanager.enable = true;

  services.openssh.enable = true;
  programs.zsh.enable = true;
  #programs.nh.enable = true;
  programs.git.enable = true;

  environment.systemPackages = with pkgs; [
    #curl
    #wget
    #htop
    #ncdu
    #python3
    #unzip
  ];

  nix = {
    settings = {
      trusted-substituters = [
        "https://nixos-raspberrypi.cachix.org"
      ];
      trusted-public-keys = [
        "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
      ];
    };
    optimise = {
      automatic = true;
      dates = [ "Sat *-*-* 09:00:00" ];
    };
    gc = {
      automatic = true;
      dates = "Sat *-*-* 08:00:00";
      options = "--delete-older-than 30d";
    };
    settings = {
      auto-optimise-store = true;
      # Required by `nh` at least.
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
