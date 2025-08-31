{
  description = "NixOS unbound container";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.unbound=
        pkgs.dockerTools.buildImage {
          name = "unbound-nixos";
          tag = "latest";
          config = {
            Cmd = [ "/init" ];
          };
          copyToRoot = pkgs.buildEnv {
            name = "image-root";
            paths = [
              (pkgs.nixos {
                configuration = ./configuration.nix;
              })
            ];
          };
        };
    };
}
