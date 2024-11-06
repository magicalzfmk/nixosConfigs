{
  #git
  programs.git = {
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

  #services.flameshot = {
  #  enable = true;
  #  settings.General = {
  #    disabledTrayIcon = true;
  #    showStartupLaunchMessage = false;
  #    showDesktopNotification = false;
  #  };
  #};
}
