# Laptop-specific hardware: Intel graphics/VA-API, bluetooth, TLP power management.
# The generated hardware-configuration.nix is imported from system-base.nix since
# it must be the first import; hardware tuning lives here.
{config, ...}: {
  flake.modules.nixos.hardware = {
    pkgs,
    lib,
    ...
  }: {
    # Power Management
    services = {
      thermald.enable = true;
      power-profiles-daemon.enable = lib.mkForce false;
      tlp.enable = true;
    };

    # Intel Graphics / VA-API
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };

    environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";

    # Bluetooth
    hardware.bluetooth = {
      enable = true;
      package = pkgs.bluez;
      input.General.IdleTimeout = 120;
    };

    # Tablet driver
    hardware.opentabletdriver.enable = true;

    # Input / Touchpad
    services.libinput.enable = true;
  };
}
