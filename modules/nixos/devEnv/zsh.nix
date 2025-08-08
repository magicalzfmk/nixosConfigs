{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh.enable = true;

    shellAliases = {
      ll = "ls -l";
      flup = "nix flake update";
      oste = "nh os test";
      ossw = "nh os switch";
      hosw = "nh home switch";
      clal = "nh clean all";
    };
  };
  users.defaultUserShell = pkgs.zsh;
  environment.shells = [pkgs.zsh];
}
