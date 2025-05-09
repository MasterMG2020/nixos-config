{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      # External HDMI monitor (main display, left side)
      "HDMI-A-1,1920x1080@144,1920x0,1"
      # Internal laptop screen, placed to the right
      "eDP-1,1920x1080@144,0x0,1"
    ];
    
    workspace = [
      # Workspace mapping
      "1,monitor:HDMI-A-1"
      "2,monitor:HDMI-A-1"
      "3,monitor:HDMI-A-1"
      "4,monitor:HDMI-A-1"
      "5,monitor:HDMI-A-1"
      "6,monitor:HDMI-A-1"
      "7,monitor:HDMI-A-1"
      "8,monitor:HDMI-A-1"
      "9,monitor:HDMI-A-1"
      "10,monitor:HDMI-A-1"
      "11,monitor:eDP-1"
      "12,monitor:eDP-1"
      "13,monitor:eDP-1"
      "14,monitor:eDP-1"
      "15,monitor:eDP-1"
      "16,monitor:eDP-1"
      "17,monitor:eDP-1"
      "18,monitor:eDP-1"
      "19,monitor:eDP-1"
      "20,monitor:eDP-1"
    ];
  };
}