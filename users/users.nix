{
  imports = [
    ./keith.nix
    ./root.nix
  ];

  # Immutable user configs.
  users.mutableUsers = false;
  # Allow these users to edit the nixos config files.
  users.groups.nixos.members = [
    "keith"
    "root"
  ];
}
