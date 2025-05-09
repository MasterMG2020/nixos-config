{ pkgs, ... }:
{
  imports = [ ./modules ];
  programs.home-manager.enable = true;

  home = {
    username = "gaiggm";
    homeDirectory = "/home/gaiggm";
    shell.enableZshIntegration = true;

    # pointerCursor = {
    #   gtk.enable = true;
    #   name = "catppuccin-mocha-flamingo-cursors";
    #   package = pkgs.catppuccin-cursors.mochaFlamingo;
    #   size = 24;
    # };

    stateVersion = "23.11";
  };
}
