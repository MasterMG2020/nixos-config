{
  imports = [
    ./sddm
    #./boot.nix for now commendted out, change later if i want to configure boot
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./packages.nix
    ./services.nix
    ./system.nix
    ./user.nix
  ];
}
