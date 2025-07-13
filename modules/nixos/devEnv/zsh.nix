{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "nh os test";
      osSwitch = "nh os switch";
      homeSwitch = "nh home switch";
      cleanAll = "nh clean all";
    };
  };
  users.defaultUserShell = pkgs.zsh;
  environment.shells = [pkgs.zsh];
}
