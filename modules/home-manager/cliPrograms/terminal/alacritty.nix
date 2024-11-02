{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      general.import = [
        "$FLAKE/otherConfigs/alacritty/dracula.toml"
      ];
    };
  };

  programs.starship = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./starship.toml);
  };

  # Enable Starship for bash
  programs.bash = {
    enable = true;
    bashrcExtra = ''eval "$(starship init bash)"'';
  };
}

# {
#       add_newline = true;
#       command_timeout = 1300;
#       scan_timeout = 50;
#       format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";
#       character = {
#         success_symbol = "[](bold green) ";
#         error_symbol = "[✗](bold red) ";
#       };
#     };