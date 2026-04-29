{...}: {
  flake.nixosModules.zfmk = {pkgs, ...}: {
    users.users.zfmk = {
      isNormalUser = true;
      description = "zfmk";
      extraGroups = ["networkmanager" "wheel"];
      packages = with pkgs; [];
    };
  };

  flake.homeModules.zfmk = {
    programs.home-manager.enable = true;

    home.username = "zfmk";
    home.homeDirectory = "/home/zfmk";
    home.stateVersion = "26.05";

    home.sessionVariables = {
      EDITOR = "nvim";
      NH_FLAKE = "$HOME/Configs";
      HOME = "/home/zfmk";
      BROWSER = "librewolf";
      DEFAULT_BROWSER = "librewolf";
    };
  };
}
