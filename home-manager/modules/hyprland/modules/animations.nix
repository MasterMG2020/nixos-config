{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
      bezier = "defaultBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, defaultBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, defaultBezier"
      ];
    };
  };
}