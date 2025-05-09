{ config, ... }: {
  wayland.windowManager.hyprland.settings.monitor = [
    # Display configuration
    "DP-1,1920x1080@144,0x0,auto"
    "DP-2,1920x1080@144,1920x0,auto"

    # Workspace assignments — DP-2 (right) is main
    "workspace=1,monitor:DP-2"
    "workspace=2,monitor:DP-2"
    "workspace=3,monitor:DP-2"
    "workspace=4,monitor:DP-2"
    "workspace=5,monitor:DP-2"
    "workspace=6,monitor:DP-2"
    "workspace=7,monitor:DP-2"
    "workspace=8,monitor:DP-2"
    "workspace=9,monitor:DP-2"
    "workspace=10,monitor:DP-2"
    "workspace=11,monitor:DP-1"
    "workspace=12,monitor:DP-1"
    "workspace=13,monitor:DP-1"
    "workspace=14,monitor:DP-1"
    "workspace=15,monitor:DP-1"
    "workspace=17,monitor:DP-1"
    "workspace=18,monitor:DP-1"
    "workspace=19,monitor:DP-1"
    "workspace=110,monitor:DP-1"
  ];
}
