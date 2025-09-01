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
      nixosConfigurations.node = mkNixosSystem {
        system = "x86_64-linux";
        hostname = "Raguel";
        username = "upiscium";
        modules = [
          ./host.nix
        ];
      };
    };
}

