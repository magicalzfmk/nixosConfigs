{
  programs = {
    #git
    git = {
      enable = true;
      userName = "magicalzfmk";
      userEmail = "mitanshkataria73@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
      aliases = {
        pm = "push github main";
        po = "push origin main";
        co = "checkout";
        cm = "commit -a";
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
