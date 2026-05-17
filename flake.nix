{
  inputs = {
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi";
  };
  outputs =
    inputs@{ self, nixos-raspberrypi }:
    {
      nixosConfigurations = {
        radiopiInstaller = nixos-raspberrypi.lib.nixosInstaller {
          specialArgs = inputs;

          modules = [
            nixos-raspberrypi.nixosModules.raspberry-pi-5.base
            ./core.nix
          ];
        };
        radiopi = nixos-raspberrypi.lib.nixosSystemFull {
          specialArgs = inputs;

          modules = [
            nixos-raspberrypi.nixosModules.raspberry-pi-5.base
            ./core.nix
            #./gnome.nix
            #./radio.nix
            #./sunshine.nix
          ];
        };
      };
    };
  nixConfig = {
    extra-substituters = [
      "https://nixos-raspberrypi.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
    ];
  };
}
