{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Applications
    kitty
    nemo
    wofi
    vscode
    hyprpaper
    hyprsome
    waybar
    fish
    firefox
  ];
}
