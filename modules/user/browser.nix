{config, ...}: {
  flake.modules.nixos.browser = {pkgs, ...}: {
    programs.firefox = {
      enable = true;
      package = pkgs.librewolf;
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
      };
    };
  };

  # Home-Manager side: nothing needed — librewolf is managed system-wide.
}
