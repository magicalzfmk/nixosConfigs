# Waybar status bar: system-level enable (NixOS) and full user configuration
# with modules, layout and the Dracula CSS theme (Home-Manager).
{config, ...}: {
  flake.modules.nixos.waybar = {pkgs, ...}: {
    programs.waybar.enable = true;

    environment.systemPackages = with pkgs; [
      font-awesome
    ];
  };

  flake.modules.homeManager.waybar = {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          # height = 10;
          spacing = 5;
          output = ["eDP-1" "HDMI-A-1"];
          modules-left = [
            "clock"
            "backlight"
            "pulseaudio"
            "idle_inhibitor"
            # "bluetooth"
            "tray"
          ];
          modules-center = [
            "hyprland/workspaces"
          ];
          modules-right = [
            "cpu"
            "memory"
            "temperature"
            "battery"
            "network"
          ];

          "hyprland/workspaces" = {
            disable-scroll = false;
            all-outputs = true;
            format = "{icon}";
            format-icons = {
              default = "";
              active = "";
              urgent = "";
            };
          };
          #   

          "hyprland/mode" = {
            format = "<span style=\"italic\">{}</span>";
          };

          "pulseaudio" = {
            # "scroll-step= 1, // %, can be a float
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
            };
            # on-click = "pavucontrol";
          };

          "bluetooth" = {
            interval = 30;
            format = "<big>{icon}</big>";
            #format-alt = "{status}";
            format-icons = {
              enabled = "";
              disabled = "";
            };
            on-click = "blueman";
          };

          "hyprland/language" = {
            format = " {}";
            max-length = 5;
            min-length = 5;
          };

          "keyboard-state" = {
            numlock = true;
            capslock = true;
            format = "{name} {icon}";
            format-icons = {
              locked = "";
              unlocked = "";
            };
          };

          "mpd" = {
            format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
            format-disconnected = "Disconnected ";
            format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
            unknown-tag = "N/A";
            interval = 5;
            consume-icons = {
              on = "";
            };
            random-icons = {
              off = "<span color=\#f53c3c\></span>";
              on = "";
            };
            repeat-icons = {
              on = "";
            };
            single-icons = {
              on = "1";
            };
            state-icons = {
              paused = "";
              playing = "";
            };
            tooltip-format = "MPD (connected)";
            tooltip-format-disconnected = "MPD (disconnected)";
          };

          "idle_inhibitor" = {
            format = "<big>{icon}</big>";
            format-icons = {
              activated = "";
              deactivated = "";
            };
            tooltip = "true";
          };

          "tray" = {
            spacing = 10;
          };

          "clock" = {
            format = "  {:%H:%M   %e %b}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            today-format = "<b>{}</b>";
            on-click = "gnome-calendar";
          };

          "cpu" = {
            interval = "1";
            format = "  {max_frequency}GHz <span color=\"darkgray\">| {usage}%</span>";
            max-length = 13;
            min-length = 13;
            tooltip = true;
          };

          "memory" = {
            format = "{}% ";
          };

          "temperature" = {
            interval = "4";
            hwmon-path = "/sys/class/hwmon/hwmon3/temp1_input";
            critical-threshold = 74;
            format-critical = "  {temperatureC}°C";
            format = "{icon}  {temperatureC}°C";
            format-icons = ["" "" ""];
            max-length = 7;
            min-length = 7;
          };

          "backlight" = {
            device = "intel_backlight";
            format = "{percent}% {icon}";
            format-icons = ["" "" "" "" "" "" "" "" ""];

            on-scroll-up = "brightnessctl s 1%+";
            on-scroll-down = "brightnessctl s 1%-";
            on-click-right = "brightnessctl s 0";
          };

          "battery" = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            format-full = "{capacity}% {icon}";
            format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            format-alt = "{time} {icon}";
            format-icons = ["" "" "" "" ""];
          };

          "power-profiles-daemon" = {
            format = "{icon}";
            tooltip-format = "Power profile = {profile}\nDriver = {driver}";
            tooltip = true;
            format-icons = {
              default = "";
              performance = "";
              balanced = "";
              power-saver = "";
            };
          };

          "network" = {
            format-wifi = "<big></big>  {essid}";
            format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
            family = "ipv4";
            tooltip-format-wifi = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\n {bandwidthUpBits}  {bandwidthDownBits}";
            tooltip-format-ethernet = " {ifname}\nIP: {ipaddr}\n {bandwidthUpBits}  {bandwidthDownBits}";
          };
        };
      };

      style = builtins.readFile ./_waybar/style.css;
    };
  };
}
