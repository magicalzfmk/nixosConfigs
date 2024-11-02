{
  pkgs,
  lib,
  ...
}: {
  services = {
    thermald.enable = true;
    system76-scheduler.settings.cfsProfiles.enable = true;
    power-profiles-daemon.enable = lib.mkForce false;
    
    tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };

    #auto-cpufreq = {
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
  };

  powerManagement.powertop.enable = true;

  # Enable Opengl
  # hardware.opengl has beed changed to hardware.graphics
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };

    bluetooth = {
      enable = true;
      package = pkgs.bluez;
      input = {
        General = {
          #ClassicBondedOnly = false;
        };
      };
    };
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
