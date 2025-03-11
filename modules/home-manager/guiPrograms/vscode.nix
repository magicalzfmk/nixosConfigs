{
  lib,
  pkgs,
  ...
}: {
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;

      # extensions = with pkgs; [
      #   vscode-extensions.jnoortheen.nix-ide
      #   vscode-extensions.dracula-theme.theme-dracula
      #   # vscode-extensions.csstools.postcss
      #   vscode-extensions.tamasfe.even-better-toml
      #   vscode-extensions.kamadorueda.alejandra
      # ];

      profiles.default.userSettings = {
        "workbench.colorTheme" = lib.mkForce "Dracula Theme";
        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = ["alejandra"]; # or nixfmt or nixpkgs-fmt
            };
            "options" = {
              "nixos" = {
                "expr" = "(builtins.getFlake \"/home/zfmk/Configs\").nixosConfigurations.laptop.options";
              };
              "home_manager" = {
                "expr" = "(builtins.getFlake \"/home/zfmk/Configs\").homeConfigurations.laptop.options";
              };
            };
          };
        };
      };
    };
  };
}
