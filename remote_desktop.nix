# https://nixos.wiki/wiki/Remote_Desktop for general approach.
{ pkgs, ... }:
{
  # Disable autologin to avoid session conflicts
  services.displayManager.autoLogin.enable = false;
  services.getty.autologinUser = null;

  services.gnome.gnome-remote-desktop.enable = true;
  networking.firewall.allowedTCPPorts = [ 3389 ];
  networking.firewall.allowedUDPPorts = [ 3389 ];

  # TODO: systemd service to run grdctl --headless rdp enable
}
