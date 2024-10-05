{ config, pkgs, lib, ... }:
{
  services.thermald.enable = true;
  powerManagement.powertop.enable = true;
  services.system76-scheduler.settings.cfsProfiles.enable = true;
  services.power-profiles-daemon.enable = lib.mkForce false;
  
  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };
  
  #services.auto-cpufreq = {
  #  enable = true;
  #  settings = {
  #    battery = {
  #      governor = "powersave";
  #      turbo = "never";
  #    };
  #    charger = {
  #      governor = "performance";
  #      turbo = "auto";
  #    };
  #  };
  #};
  
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
