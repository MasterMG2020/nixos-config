{
  wayland.windowManager.hyprland = {
    systemd.enable = true;
    
    settings = {
      exec-once = [
        "hyprctl setcursor HyprBibataModernClassicSVG 24"
        "gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'"
        "hyprpaper"
      ];

      env = [
        # Existing ones...
        "QT_QPA_PLATFORMTHEME,qt6ct"
        #"WLR_DRM_NO_ATOMIC,1"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,HyprBibataModernClassicSVG"
        "HYPRCURSOR_SIZE,64"

        # ADD THESE
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "LIBVA_DRIVER_NAME,nvidia"
        "WLR_RENDERER_ALLOW_SOFTWARE,1"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];
    };
  };
}