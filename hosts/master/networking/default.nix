{ ... }: {
  imports =
    [
      ./firewall.nix
      ./network.nix
      ./ssh.nix
    ];
}
