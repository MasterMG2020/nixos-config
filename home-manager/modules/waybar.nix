{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [{
      layer = "top";
      position = "top";
      "margin-bottom" = 0;
      "modules-left" = [
        "clock"
        "custom/separator"
        "hyprland/workspaces"
        "custom/separator"
        "tray"
      ];
      "modules-center" = [ "hyprland/window" ];
      "modules-right" = [
        "temperature"
        "memory"
        "cpu"
        "pulseaudio"
        "battery"
        "network"
        "custom/separator"
        "custom/powermenu"
      ];

      "custom/separator" = {
        exec = "echo \"|\"";
        format = "{}";
      };

      tray = {
        "icon-size" = 16;
        spacing = 8;
      };

      clock = {
        format = " {:%H:%M} ";
        interval = 60;
        tooltip = true;
        "tooltip-format" = "{:%d %B %H:%M}";
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        "separate-outputs" = false;
        "active-only" = false;
        "all-outputs" = false;
        "format-icons" = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
          "10" = "10";
          "11" = "1";
          "12" = "2";
          "13" = "3";
          "14" = "4";
          "15" = "5";
          "16" = "6";
          "17" = "7";
          "18" = "8";
          "19" = "9";
          "110" = "10";
        };
      };

      "hyprland/window" = {
        format = "{}";
      };

      network = {
        format = " 󰖩";
        "tooltip-format" = "{essid}";
        interval = 2;
      };

      temperature = {
        format = "{icon} {temperatureC}°C ";
        "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
        "critical-threshold" = 80;
        "format-icons" = [ "" "" "" ];
      };

      memory = {
        format = "󰫗 {}% ";
        tooltip = false;
      };

      cpu = {
        format = " {usage}% ";
        tooltip = false;
      };

      pulseaudio = {
        format = " {volume}%";
        "scroll-step" = 1;
        "on-click" = "pavucontrol";
      };

      battery = {
        format = "{capacity}% {icon}";
        "format-icons" = [ "" "" "" "" "" ];
      };

      "custom/powermenu" = {
        format = "  ";
        tooltip = false;
        "on-click" = "exec wlogout -p layer-shell";
      };
    }];

    style = pkgs.writeText "waybar-style.css" ''
      * {
        font-family: "Fira Code";
      }

      #waybar {
        background: #171717;
        color: #fff;
      }

      #clock {
        color: #fff;
      }

      #tray {
        padding-left: 4px;
      }

      #workspaces button:hover {
        background-color: transparent;
      }

      #workspaces button {
        color: #737373;
        padding-left: 4px;
        padding-right: 4px;
        border-radius: 0px;
      }

      #workspaces button:hover {
        background-color: #262626;
      }

      #workspaces button.active {
        color: #84cc16;
      }

      #window {
        color: #fff;
      }

      #network {
        color: #3b82f6;
        margin-right: 8px;
      }

      #pulseaudio {
        color: #14b8a6;
        margin-right: 4px;
      }

      #cpu {
        color: #0ea5e9;
        margin-right: 4px;
      }

      #temperature {
        color: #eab308;
        margin-right: 4px;
      }

      #memory {
        color: #d946ef;
        margin-right: 4px;
      }

      #custom-powermenu {
        color: #f43f5e;
      }
    '';
  };

  home.packages = with pkgs; [
    fira-code
    wlogout  # Required for power menu functionality
  ];
}