{
  inputs = {
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixos-raspberrypi/nixpkgs";
    };
  };
  outputs =
    inputs@{ self, nixos-raspberrypi, disko }:
    {
      nixosConfigurations.radiopi = nixos-raspberrypi.lib.nixosSystemFull {
        specialArgs = inputs;

        modules = [
          nixos-raspberrypi.nixosModules.raspberry-pi-5.base
          disko.nixosModules.disko
          ./disko.nix

          ./configuration.nix
        ];
      };
    };
}
