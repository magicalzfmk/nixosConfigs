{...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      #general = {
      #  disable_loading_bar = true;
      #  grace = 300;
      #  hide_cursor = true;
      #  no_fade_in = false;
      #};

      background = [
        {
          path = "$FLAKE/images/current.png";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "200, 50";
          outline_thickness = 5;
          dots_size = 0.33;
          dots_spacing = 0.15;
          dots_center = false;
          position = "0, -80";
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
          shadow_passes = 2;
        }
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        lock_cmd = "pidof hyprlock || hyprlock";
      };

      listener = [
        {
          timeout = 300; #5
          on-timeout = "hyprctl dispatch dpms off";
        }
        {
          timeout = 330; #5.5
          on-timeout = "loginctl lock-session"; 
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 600; #10
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
