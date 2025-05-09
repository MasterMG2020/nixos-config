{ pkgs, ... }:
{
  services = {
    dbus.enable = true;
    libinput.enable = true;
    udisks2.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    displayManager = {
      defaultSession = "hyprland-uwsm";

      sddm = {
        enable = true;
        theme = "catppuccin-mocha";
        package = pkgs.kdePackages.sddm;
        wayland.enable = true;
      };
    };

    flatpak.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      #videoDrivers = [ "amdgpu" ];
      videoDrivers = [ "nvidia" ];

      xkb = {
        layout = "de";
        variant = "nodeadkeys";
      };

    power-profiles-daemon.enable = false; # has to be disabled to use tlp

      tlp = {
        enable = true;
        settings = {
          INTEL_GPU_MIN_FREQ_ON_AC = 350;
          INTEL_GPU_MIN_FREQ_ON_BAT = 350;
          INTEL_GPU_MAX_FREQ_ON_AC = 1450;
          INTEL_GPU_MAX_FREQ_ON_BAT = 1450;
        };
      };
    };
  };
}
