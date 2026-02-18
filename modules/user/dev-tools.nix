# Development tooling: Java runtime, Android (ADB + kvm group), VSCodium.
let
  userName = "zfmk";
in
  {config, ...}: {
    flake.modules.nixos.dev-tools = {pkgs, ...}: {
      programs.java.enable = true;

      users.users.${userName}.extraGroups = ["adbusers" "kvm"];

      # ADB port
      networking.firewall.allowedTCPPorts = [5037];
      networking.firewall.allowedUDPPorts = [5037];

      environment.systemPackages = with pkgs; [
        vscodium
        android-tools
        unzip
        alejandra
      ];
    };

    # Home-Manager side: VSCodium settings with nixd LSP integration.
    flake.modules.homeManager.vscode = {
      lib,
      pkgs,
      ...
    }: {
      programs.vscode = {
        enable = false; # flip to true to activate
        package = pkgs.vscodium;

        profiles.default.userSettings = {
          "nix.serverPath" = "nixd";
          "nix.enableLanguageServer" = true;
          "nix.serverSettings" = {
            "nixd" = {
              "formatting".command = ["alejandra"];
              "options" = {
                "nixos".expr = ''(builtins.getFlake "/home/zfmk/Configs").nixosConfigurations.laptop.options'';
                "home_manager".expr = ''(builtins.getFlake "/home/zfmk/Configs").homeConfigurations.zfmk.options'';
              };
            };
          };
        };
      };
    };
  }
