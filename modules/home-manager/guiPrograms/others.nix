{
  #kde
  # qt = {
  #   enable = true;
  #   platformTheme.name = "dracula";
  #   style.name = "dracula";
  # };

  programs = {
    #git
    git = {
      enable = true;
      settings = {
        user = {
          name = "magicalzfmk";
          email = "mitanshkataria73@gmail.com";
        };

        init.defaultBranch = "main";
        alias = {
          pm = "push github main";
          po = "push origin main";
          co = "checkout";
          cm = "commit -a";
        };
      };
    };

    rofi = {
      enable = true;
      theme = "Arc-Dark";
    };
  };

  services = {
    # flameshot = {
    #   enable = false;
    #   settings.General = {
    #     disabledTrayIcon = true;
    #     showStartupLaunchMessage = false;
    #     showDesktopNotification = false;
    #   };
    # };

    mako = {
      enable = true;
      # backgroundColor = "#285577FF";
      # borderColor = "#4C7899FF";
      settings = {
        anchor = "top-right";
        defaultTimeout = 600;
      };
    };
  };
}
