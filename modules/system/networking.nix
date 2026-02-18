# Hostname and NetworkManager.
{config, ...}: {
  flake.modules.nixos.networking = {
    networking.hostName = "laptop";
    networking.networkmanager.enable = true;
  };
}
