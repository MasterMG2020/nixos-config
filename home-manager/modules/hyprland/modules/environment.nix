{
  wayland.windowManager.hyprland = {
    systemd.enable = true;
    
    settings = {
      exec-once = [
        "hyprctl setcursor HyprBibataModernClassicSVG 24"
        "gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'"
        "hyprpaper"
        "waybar"
      ];

      env = [
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "WLR_DRM_NO_ATOMIC,1"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,HyprBibataModernClassicSVG"
        "HYPRCURSOR_SIZE,64"
      ];
    };
  };
}