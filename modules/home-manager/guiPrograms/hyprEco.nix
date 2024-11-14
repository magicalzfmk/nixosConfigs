{lib, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = lib.mkForce {
      #general = {
      #  disable_loading_bar = true;
      #  grace = 300;
      #  hide_cursor = true;
      #  no_fade_in = false;
      #};

      background = [
        {
          path = "$FLAKE/images/current.png";
          blur_passes = 1;
          blur_size = 2;
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
        before_sleep_cmd = "pidof hyprlock || hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        lock_cmd = "pidof hyprlock || hyprlock";
      };

      listener = [
        # {
        #   timeout = 300; #5
        #   on-timeout = "hyprctl dispatch dpms off";
        #   on-resume = "hyprctl dispatch dpms on";
        # }
        {
          timeout = 300; #5
          on-timeout = "pidof hyprlock || hyprlock";
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
