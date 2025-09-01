{ inputs, ... }: {
  mkNixosSystem =
    { system, hostname, username, modules }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system modules;
      specialArgs = {
        inherit inputs hostname username;
      };
    };

  mkKubeMaster =
    { pkgs, system, ip, hostname, port }:
    {
      # resolve master hostname
      networking.extraHosts = "${ip} ${hostname}";

      # packages for administration tasks
      environment.systemPackages = with pkgs; [
        kompose
        kubectl
        kubernetes
      ];

      services.kubernetes = {
        roles = [ "master" "node" ];
        masterAddress = hostname;
        apiserverAddress = "https://${hostname}:${toString port}";
        easyCerts = true;
        apiserver = {
          securePort = port;
          advertiseAddress = ip;
        };

        # use coredns
        addons.dns.enable = true;

        # needed if you use swap
        kubelet.extraOpts = "--fail-swap-on=false";
      };
    };

  mkKubeNode =
    { pkgs, system, ip, hostname, port }:
    {
      # resolve master hostname
      networking.extraHosts = "${ip} ${hostname}";

      # packages for administration tasks
      environment.systemPackages = with pkgs; [
        kubectl
        kubernetes
      ];

      services.kubernetes = {
        roles = [ "node" ];
        masterAddress = hostname;
        apiserverAddress = "https://${hostname}:${toString port}";

        # needed if you use swap
        kubelet.extraOpts = "--fail-swap-on=false";
      };
    };
}

