{ pkgs, ... }:
{
  hardware.rtl-sdr.enable = true;

  systemd.services.rtl_tcp = {
    description = "RTL_TCP Streaming Server";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.rtl-sdr}/bin/rtl_tcp -a '::' -p 5361";
      Restart = "on-failure";
    };
  };

  networking.firewall.allowedTCPPorts = [ 5361 ];
}
