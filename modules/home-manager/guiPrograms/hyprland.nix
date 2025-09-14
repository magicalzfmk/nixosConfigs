{
  lib,
  pkgs,
  ...
}: let
  startScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.swww}/bin/swww-daemon &
    sleep 1
    ${pkgs.swww}/bin/swww img ~/Configs/images/current.png &
    sleep 1
    nm-applet &
    ${pkgs.mako}/bin/mako &
    ${pkgs.hypridle}/bin/hypridle &
  '';

  screenshotPartScript = pkgs.pkgs.writeShellScriptBin "start" ''
    flameshot gui -r | wl-copy
    sleep 1
    pkill flameshot
  '';

  screenshotScript = pkgs.pkgs.writeShellScriptBin "start" ''
    FILENAME="screenshot_$(date +%Y%m%d_%H%M%S)"
    flameshot screen -p ~/Pictures/Screenshots/"$FILENAME"
    sleep 1
    pkill flameshot
  '';

  relaunchTopbarScript = pkgs.pkgs.writeShellScriptBin "start" ''
    pkill waybar
    sleep 1
    hyprctl dispatch exec waybar &
  '';

  restartDefNetScript = pkgs.pkgs.writeShellScriptBin "start" ''sudo virsh net-start default'';

  evaluatePackagesScript = pkgs.pkgs.writeShellScriptBin "start" ''
    # Error Control
    error_exit() {
        echo "Error: $1"
        zenity --info --text="Error$1" --title="Command Output" --no-wrap
        exit 1
    }

    # Prompt the user for input using a zenity entry dialog
    input=$(zenity --entry --title="Input Required" --text="Please enter the package name (e.g., bibata-cursors):")

    # Check if the user provided input or canceled the dialog
    if [ $? -eq 0 ]; then

        # Execute Commands
        cd ~/temporaryFiles || error_exit "No directory temporaryFiles in ~/"
        nix build nixpkgs#$input || error_exit "error fetching pkg(not found?)"
        cd result || error_exit "no result directory found after building"
        output=$(nix run nixpkgs#eza -- --tree --level 3 2>&1) || error_exit "Error creating tree structure"
        cd .. || error_exit "how did this happen?"
        rm result

        zenity --info --text="$output" --title="Command Output" --no-wrap || error_exit "zenity error"

    else
        echo "Input was canceled."
    fi
  '';
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = lib.mkDefault ",preferred,auto,1.0";
      "$terminal" = lib.mkDefault "alacritty";
      "$fileManager" = lib.mkDefault "nautilus";
      "$menu" = lib.mkDefault "rofi -show drun -show-icons";
      "$browser" = lib.mkDefault "librewolf";
      "$code" = lib.mkDefault "codium";

      # exec-once = ''bash $FLAKE/scripts/start.sh'';
      exec-once = ''${startScript}/bin/start'';

      #env = [
      #  "XCURSOR_SIZE,12"
      #  "HYPRCURSOR_SIZE,12"
      #];

      general = {
        gaps_in = 1;
        gaps_out = 2;
        border_size = 1;

        "col.active_border" = lib.mkDefault "rgb(bd93f9)";
        "col.inactive_border" = lib.mkDefault "rgba(44475aaa)";
        "col.nogroup_border" = lib.mkDefault "rgba(282a36dd)";
        "col.nogroup_border_active" = lib.mkDefault "rgb(bd93f9)";

        layout = lib.mkDefault "dwindle";

        resize_on_border = true;
      };

      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 0.8;

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

      gesture = [
        "3, horizontal, workspace"
        "3, up, move"

        "4, up, fullscreen"
        "4, down, close"
        "4, left, resize"
        "4, right, float"
      ];

      "$mainMod" = "SUPER";

      bind = [
        #Custom Binds
        # "$mainMod and CTRL, P, exec, bash $FLAKE/scripts/relaunchTopBar.sh"
        # "$mainMod and CTRL, E, exec, bash $FLAKE/scripts/evaluatePkgs.sh"
        # "SHIFT, Print, exec, bash $FLAKE/scripts/screenshotPart.sh"
        # #"CTRL, Print, exec, bash $FLAKE/scripts/screenshotPart.sh"
        # ", Print, exec, bash $FLAKE/scripts/screenshot.sh"
        "$mainMod and CTRL, P, exec, ${relaunchTopbarScript}/bin/start"
        "$mainMod and CTRL, E, exec, ${evaluatePackagesScript}/bin/start"
        "SHIFT, Print, exec, ${screenshotPartScript}/bin/start"
        ", Print, exec, ${screenshotScript}/bin/start"
        "$mainMod and SHIFT, L, exec, hyprlock"
        "$mainMod and CTRL, N, exec, ${restartDefNetScript}/bin/start"

        #Example binds
        "$mainMod, B, exec, $browser"
        "$mainMod, X, exec, $code"
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, space, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, T, togglesplit,"

        # Move focus with mainMod + arrow keys
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"

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
