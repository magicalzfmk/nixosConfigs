{ pkgs, ... }:
#let
#  jsonContent = builtins.readFile "/home/zfmk/Configs/modules/home-manager/guiPrograms/waybar.jsonc";
#  cssContent = builtins.readFile "/home/zfmk/Configs/modules/home-manager/guiPrograms/waybar.css";
#in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 10;
        spacing = 5;
        output = [   "eDP-1"   "HDMI-A-1" ];
        modules-left = [ 
          "hyprland/workspaces"
          "hyprland/mode"
          "custom/media"
        ];
        modules-center = [ 
          "hyprland/window"
        ];
        modules-right = [
          "mpd"
          "temperature"
          "idle_inhibitor"
          "pipewire"
          "network"
          "power-profiles-daemon"
          "cpu"
          "memory"
          "backlight"
          "keyboard-state"
          "battery"
          "clock"
          "tray"
          "custom/power"
        ];
        
        "hyprland/workspaces" = {  
          disable-scroll = false;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            default = "";
            active = "";
            urgent = "";
          };
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
              on = " ";
          };
          random-icons = {
              off = "<span color=\#f53c3c\></span>";
              on = " ";
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
          format = "{icon}";
          format-icons = {
              activated = "";
              deactivated = "";
          };
        };
        
        "tray" = {
          spacing = 10;
        };
        
        "clock" = {
          tooltip-format = "<big>{ =%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{ =%Y-%m-%d}";
        };
        
        "cpu" = {
          format = "{usage}% ;";
          tooltip = false;
        };
        
        "memory" = {
          format = "{}%  ";
        };
        
        "temperature" = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
         format-icons = [ "" ];
        };
        
        "backlight" = {
        format = "{percent}% {icon}";
        format-icons = ["" "" "" "" "" "" "" "" ""];
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
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "{ipaddr}/{cidr} ";
            tooltip-format = "{ifname} via {gwaddr} ";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "Disconnected ⚠";
            format-alt = "{ifname} = {ipaddr}/{cidr}";
        };
        
        "custom/media" = {
          format = "{icon} {text}";
          return-type = "json";
          max-length = 40;
          format-icons = {
            spotify = "";
            default = "🎜";
          };
          escape = true;
          exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null";
        };
        
        "custom/power" = {
          format  = "⏻ ";
          tooltip = false;
	  menu = "on-click";
	  menu-file = "$HOME/.config/waybar/power_menu.xml"; # Menu file in resources folder
          menu-actions = {
            shutdown = "shutdown";
            reboot = "reboot";
            suspend = "systemctl suspend";
            hibernate = "systemctl hibernate";
          };
        };
        
        
      };
    };
    
    style = ''
      * {
        border: 0px;
        border-radius: 0;
        font-family: Source Code Pro;
        font-size: 10px;
        padding: 0px;
        color: #6272a4;
      }
      window#waybar {
        background-color: #282a36;
        border-bottom: 1px solid #44475a;
        color: #6272a4;
        transition-property: background-color;
        transition-duration: .5s;
      }
      window#waybar.hidden {
        opacity: 0.2;
      }
      button {
    	box-shadow: inset 0 -3px transparent;
      }
      #workspaces button {
        padding: 0 5px;
    	color: #6272a4;
      }
      #workspaces button.active {
    	color: #bd93f9;
      }
      #workspaces button.urgent {
    	background-color: #ff5555;
      }
      
      #mpd {
    	padding: 0 10px;
      }
      #workspaces {
    	margin: 0 4px;
      }
      .modules-left > widget:first-child > #workspaces {
    	margin-left: 0;
      }
      .modules-right > widget:last-child > #workspaces {
    	margin-right: 0;
      }
      #power-profiles-daemon {
    	padding-right: 5px;
    	padding-left: 5px;
      }
      #custom-media {
    	min-width: 100px;
      }
      #network {
        padding-right: 20px;
    	padding-left: 20px;
      }
    '';
               
  };
  
}
