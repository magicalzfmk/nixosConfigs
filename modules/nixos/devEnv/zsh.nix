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
    };
  };
  users.defaultUserShell = pkgs.zsh;
  environment.shells = [pkgs.zsh];
}
