{ config, lib, ...}: let
  mainMod = "SUPER";
  terminal = "kitty";
  fileManager = "nemo";
  menu = "wofi --show drun";
in {
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = mainMod;
    "$terminal" = terminal;
    "$fileManager" = fileManager;
    "$menu" = menu;

    bind = [
      # Basic keybinds
      "${mainMod}, Q, exec, ${terminal}"
      "${mainMod}, C, killactive"
      "${mainMod}, M, exit"
      "${mainMod}, E, exec, ${fileManager}"
      "${mainMod}, V, togglefloating"
      "${mainMod}, R, exec, ${menu}"
      "${mainMod}, P, pseudo"
      "${mainMod}, T, togglesplit"
      "${mainMod}, F, fullscreen"
      #"${mainMod}, W, exec, google-chrome-stable"
      #"${mainMod}, backslash, exec, ${config.home.homeDirectory}/.config/hypr/scripts/layout.sh"
      #"${mainMod} SHIFT, backslash, exec, ${config.home.homeDirectory}/.config/hypr/scripts/layout2.sh"
      #"${mainMod}, period, exec, wofi-emoji"

      # Focus movement
      "${mainMod}, left, movefocus, l"
      "${mainMod}, right, movefocus, r"
      "${mainMod}, up, movefocus, u"
      "${mainMod}, down, movefocus, d"
      "${mainMod}, H, movefocus, l"
      "${mainMod}, K, movefocus, u"
      "${mainMod}, J, movefocus, d"
      "${mainMod}, L, movefocus, r"

      # Workspace navigation with hyprsome
      #(lib.concatStringsSep "\n" (lib.genList (i: 
      #  "${mainMod}, ${toString (i + 1)}, exec, hyprsome workspace ${toString (i + 1)}"
      #) 10))
      
      # Window movement with hyprsome
      # (lib.concatStringsSep "\n" (lib.genList (i: 
      #   "${mainMod} SHIFT, ${toString (i + 1)}, exec, hyprsome move ${toString (i + 1)}"
      # ) 10))

      # Screenshots
      # "${mainMod}, S, exec, grim -o DP-1 ${config.home.homeDirectory}/Pictures/screenshots/screenshot-$(date +%F-%T).png"
      # "${mainMod} SHIFT, S, exec, grim -g \"$(slurp)\" ${config.home.homeDirectory}/Pictures/screenshots/screenshot-$(date +%F-%T).png"

      # Mouse controls
      # "${mainMod}, mouse_down, workspace, e+1"
      # "${mainMod}, mouse_up, workspace, e-1"
    ];

    bindm = [
      "${mainMod}, mouse:272, movewindow"
      "${mainMod}, mouse:273, resizewindow"
    ];

    # windowrulev2 = [
    #   "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
    #   "noanim,class:^(xwaylandvideobridge)$"
    #   "noinitialfocus,class:^(xwaylandvideobridge)$"
    #   "maxsize 1 1,class:^(xwaylandvideobridge)$"
    #   "noblur,class:^(xwaylandvideobridge)$"
    # ];
  };
}