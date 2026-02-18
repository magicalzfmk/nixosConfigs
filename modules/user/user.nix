# Everything about the "zfmk" user, across NixOS and Home-Manager.
let
  userName = "zfmk";
  homeDir = "/home/${userName}";
in {
  flake.modules.nixos.user = {
    users.users.${userName} = {
      isNormalUser = true;
      description = userName;
      home = homeDir;
      createHome = true;
      extraGroups = ["networkmanager" "wheel" "storage"];
      packages = [];
    };
  };

  flake.modules.homeManager.user = {lib, ...}: {
    home.username = lib.mkDefault userName;
    home.homeDirectory = lib.mkDefault homeDir;
    home.stateVersion = lib.mkDefault "24.05";

    home.sessionVariables = {
      EDITOR = "nvim";
      FLAKE = "$HOME/Configs";
      HOME = homeDir;
    };

    programs.home-manager.enable = true;
  };
}
