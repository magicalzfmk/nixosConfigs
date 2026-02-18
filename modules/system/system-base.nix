# Core NixOS system settings: bootloader, locale, nix daemon config, env vars.
{config, ...}: {
  flake.modules.nixos.system-base = {lib, ...}: {
    imports = [./_hardware-configuration.nix];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Locale — Indian English
    time.timeZone = "Asia/Kolkata";
    i18n.defaultLocale = "en_IN";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
    };

    nix.settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };

    nixpkgs.config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };

    environment.variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      FLAKE = "$HOME/Configs";
      NH_FLAKE = "$HOME/Configs";
      NIXPKGS_ALLOW_UNFREE = 1;
      XDG_DATA_DIRS = lib.mkForce [
        "/var/lib/flatpak/exports/share"
        "$HOME/.local/share/flatpak/exports/share"
      ];
    };

    environment.systemPackages = [];

    system.stateVersion = "24.05";
  };
}
