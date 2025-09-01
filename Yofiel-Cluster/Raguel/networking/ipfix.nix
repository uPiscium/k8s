{ ... }:
let
  IPAddress = "192.168.11.201";
in
{
  networking.useDHCP = false;
  networking.interfaces.ens18 = {
    useDHCP = false;
    ipv4.addresses = [
      {
        address = IPAddress;
        prefixLength = 24;
      }
    ];
  };
}
