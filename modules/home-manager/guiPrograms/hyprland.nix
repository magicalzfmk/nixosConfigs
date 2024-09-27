{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = lib.mkForce ",preferred,auto,1.0";
      "$terminal" = lib.mkForce "alacritty";
      "$fileManager" = lib.mkForce "nautilus";
      "$menu" = lib.mkForce "rofi -show drun -show-icons";
      
      exec-once = ''bash ~/Configs/scripts/start.sh'';
      
      env = [
        "XCURSOR_SIZE,12"
        "HYPRCURSOR_SIZE,12"
      ];
      
      general = { 
        gaps_in = 1;
        gaps_out = 2;
        border_size = 1;
        
        "col.active_border" = lib.mkForce "rgb(bd93f9)";
        "col.inactive_border" = lib.mkForce "rgba(44475aaa)";
        "col.nogroup_border" = lib.mkForce "rgba(282a36dd)";
        "col.nogroup_border_active" = lib.mkForce "rgb(bd93f9)";
         
         layout = lib.mkForce "dwindle";
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
