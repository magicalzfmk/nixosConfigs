{ config, pkgs, home-manager, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "zfmk";
  home.homeDirectory = "/home/zfmk";
  
  #home-manager.useBackup = true;
  #home-manager.backupFileExtension = ".old";
  
  #imports = ["./../../modules/home-manager/default.nix"];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/zfmk/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  #git
  programs.git = {
    enable = true;
    userName = "zfmk";
    userEmail = "mitanshkataria73@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
    aliases = {
      pm = "push github main";
      co = "checkout";
      cm = "commit";
    };
  };

  gtk.enable = true;

  nixpkgs.config.allowUnfree = true;
  
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",preferred,auto,1.0";
      "$terminal" = "alacritty";
      "$fileManager" = "nautilus";
      "$menu" = "rofi -show drun -show-icons";
      
      exec-once = ''bash ~/Configs/scripts/start.sh'';
      
      env = [
        "XCURSOR_SIZE,12"
        "HYPRCURSOR_SIZE,12"
      ];
      
      general = { 
        gaps_in = 1;
        gaps_out = 2;
        border_size = 1;
        
        "col.active_border" = "rgb(bd93f9)";
        "col.inactive_border" = "rgba(44475aaa)";
        "col.nogroup_border" = "rgba(282a36dd)";
        "col.nogroup_border_active" = "rgb(bd93f9)";
         
         layout = "dwindle";
      };
      
      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 0.8;

        drop_shadow = false;

        blur = {
            enabled = false;
        };
      };
      
      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };
      
      misc = { 
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
      };

      group = {
        groupbar = {
          #col.active = "rgb(bd93f9) rgb(44475a) 90deg";
          #col.inactive = "rgba(282a36dd)";
        };
      };
      
      windowrulev2 = [
        "bordercolor rgb(ffb86c),xwayland:1"
        "suppressevent maximize, class:.*"
      ];
      
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        
        touchpad = {
          natural_scroll = true;
        };
      };
      
      gestures = {
        workspace_swipe = true;
      };
      
      "$mainMod" = "SUPER"; 
      
      bind = [
        #Custom Binds
        "$mainMod and CTRL, P, exec, bash ~/Configs/scripts/relaunchTopBar.sh"
        "$mainMod and CTRL, E, exec, bash ~/Configs/scripts/evaluatePkgs.sh"
        "SHIFT, Print, exec, bash ~/Configs/scripts/screenshot.sh"
        
        #Example binds
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        
        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        
        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        
        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        
        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];
      
      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      
      # Laptop multimedia keys for volume and LCD brightness
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];
      
    };
  };
}
