{ pkgs, ... }:
{
  hardware.rtl-sdr.enable = true;

  environment.systemPackages = [
    pkgs.gnuradio
  ];
}