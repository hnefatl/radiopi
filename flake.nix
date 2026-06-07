{
  inputs = {
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi";
  };
  outputs =
    inputs@{ self, nixos-raspberrypi }:
    {
      nixosConfigurations = {
        radiopi = nixos-raspberrypi.lib.nixosSystem {
          specialArgs = inputs;

          modules = [
            nixos-raspberrypi.nixosModules.raspberry-pi-5.base
            nixos-raspberrypi.nixosModules.sd-image
            ./configuration.nix
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
