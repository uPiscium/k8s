inputs:
let
  mkNixosSystem =
    { system, hostname, username, modules }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system modules;
      specialArgs = {
        inherit inputs hostname username;
      };
    };
in
{
  nixos = {
    master = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "master";
      username = "upiscium";
      modules = [
        ./master/host.nix
      ];
    };
    node = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "node";
      username = "upiscium";
      modules = [
        ./node/host.nix
      ];
    };
  };
}
