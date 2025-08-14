{
  pkgs,
  lib,
  ...
}: {
  services = {
    thermald.enable = true;
    # system76-scheduler.settings.cfsProfiles.enable = true;
    power-profiles-daemon.enable = lib.mkForce false;

    tlp = {
      enable = true;
      # settings = {
      #   CPU_BOOST_ON_AC = 1;
      #   CPU_BOOST_ON_BAT = 0;
      #   CPU_SCALING_GOVERNOR_ON_AC = "performance";
      #   CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      #   CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      #   CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      #   CPU_MIN_PERF_ON_AC = 0;
      #   CPU_MAX_PERF_ON_AC = 100;
      #   CPU_MIN_PERF_ON_BAT = 0;
      #   CPU_MAX_PERF_ON_BAT = 20;
      # };
    };

    # auto-cpufreq = {
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
    # };
  };

  # powerManagement.powertop.enable = true;

  # Enable Opengl
  # hardware.opengl has beed changed to hardware.graphics
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };

    bluetooth = {
      enable = true;
      package = pkgs.bluez;
      input = {
        General = {
          IdleTimeout = 120;
        };
      };
    };
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
