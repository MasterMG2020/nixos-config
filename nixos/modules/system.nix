{ pkgs, ... }:
{
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    #cpu.amd.updateMicrocode = true;
    graphics = {
      enable = true;
      #extraPackages = [ pkgs.amdvlk ];
    };
    nvidia = {
      modesetting.enable = true;

      powerManagement.enable = false;
      powerManagement.finegrained = false;

      open = false;
      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        sync.enable = true;

        intelBusId = "PCI:0:2:0";    # Adjust if needed (Intel iGPU)
        nvidiaBusId = "PCI:1:0:0";   # Adjust if needed (NVIDIA dGPU)
      }
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
    resumeCommands = ''
      /run/current-system/sw/bin/nmcli networking off
      /run/current-system/sw/bin/nmcli networking on
    '';
  };

  systemd = {
    sleep.extraConfig = ''
      HibernateDelaySec=10m
      SuspendState=mem
    '';
  };

  security.rtkit.enable = true;
  system.stateVersion = "24.05";
}
