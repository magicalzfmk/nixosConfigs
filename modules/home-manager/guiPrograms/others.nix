{...}: {
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

  #gtk = {
  #  enable = true;
  #  theme.name = lib.mkForce "Dracula";
  #  cursorTheme.name = lib.mkForce "Nordzy-cursors";
  #  iconTheme.name = lib.mkForce "Dracula";
  #};

  #services.flameshot = {
  #  enable = true;
  #  settings.General = {
  #    disabledTrayIcon = true;
  #    showStartupLaunchMessage = false;
  #    showDesktopNotification = false;
  #  };
  #};
}
