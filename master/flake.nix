{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs:
    let
      mkNixosSystem = (import ../util.nix { inherit inputs; }).mkNixosSystem;
    in
    {
      nixosConfigurations.master = mkNixosSystem {
        system = "x86_64-linux";
        hostname = "master";
        username = "upiscium";
        modules = [
          ./host.nix
        ];
      };
    };
}

