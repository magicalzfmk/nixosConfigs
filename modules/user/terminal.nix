# Terminal experience: Zsh shell (both NixOS system-wide and Home-Manager user config),
# Alacritty terminal emulator, and Starship prompt.
{config, ...}: {
  # ── NixOS side: set zsh as the default shell + aliases ───────────
  flake.modules.nixos.terminal = {pkgs, ...}: {
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

    # nix-ld: lets external binaries (e.g. from npm/pip) find system libs
    programs.nix-ld = {
      enable = true;
      libraries = [];
    };

    environment.systemPackages = with pkgs; [alacritty starship];
  };

  # ── Home-Manager side: Alacritty + Starship + user Zsh config ───
  flake.modules.homeManager.terminal = {lib, ...}: {
    programs.alacritty = {
      enable = true;
      settings.general.import = [
        "$HOME/Configs/otherConfigs/alacritty/dracula.toml"
      ];
    };

    programs.starship = lib.mkForce {
      enable = true;
      settings = builtins.fromTOML (builtins.readFile ./_terminal/starship.toml);
    };

    # Enable Starship for bash as fallback
    programs.bash = {
      enable = true;
      bashrcExtra = ''eval "$(starship init bash)"'';
    };

    programs.zsh = {
      enable = true;
      initContent = ''eval "$(starship init zsh)"'';
      oh-my-zsh = {
        enable = true;
        plugins = ["git"];
      };
    };
  };
}
