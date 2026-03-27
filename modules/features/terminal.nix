{config, ...}: {
  flake.nixosModules.terminal = {pkgs, ...}: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -l";
        flup = "nix flake update";
        oste = "nh os test --hostname laptopHP";
        ossw = "nh os switch --hostname laptopHP";
        clal = "nh clean all";
      };
    };

    users.defaultUserShell = pkgs.zsh;
    environment.shells = [pkgs.zsh];

    programs.nix-ld = {
      enable = true;
      libraries = [];
    };

    environment.systemPackages = with pkgs; [
      alacritty
      starship
    ];
  };

  flake.homeModules.terminal = {lib, ...}: {
    programs.alacritty = {
      enable = true;
      settings.general.import = [
        "$HOME/Configs/otherConfigs/alacritty/dracula.toml"
      ];
    };

    programs.starship = {
      enable = true;
      settings = builtins.fromTOML (builtins.readFile ./_conf/terminal/starship.toml);
    };

    programs.zsh = {
      enable = true;
      initContent = ''eval "$(starship init zsh)"'';
    };
  };
}
