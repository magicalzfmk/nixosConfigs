{ config, pkgs, lib, ... }:
{
  services.thermald.enable = true;
  services.power-profiles-daemon.enable = lib.mkForce false;
  
  #services.tlp.enable = true;
  
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
  
  # Enable Opengl
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
  
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
  
  environment.systemPackages = with pkgs; [
    
  ];
}
