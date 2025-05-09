{ config, ... }: {
  programs.kitty = {
    enable = true;

    settings = {
      background_opacity = "0.75";
      window_padding_width = "4";
      font_family = "FiraCode NerdFont";
      font_size = "14.0";

      # Selection highlighting
      selection_foreground = "#ffffff";
      selection_background = "#14b8a6";

      # Tokyo Night color scheme
      foreground = "#c0caf5";
      background = "#1a1b26";

      # Normal colors
      color0 = "#0b0c15";
      color1 = "#d2556c";
      color2 = "#7cd47b";
      color3 = "#efb184";
      color4 = "#6ca1f3";
      color5 = "#b78df0";
      color6 = "#69bcf4";
      color7 = "#c0caf5";

      # Bright colors
      color8 = "#39404a";
      color9 = "#f7768e";
      color10 = "#85e89d";
      color11 = "#f4cf8d";
      color12 = "#8fb9ff";
      color13 = "#d9a3ff";
      color14 = "#8fd3ff";
      color15 = "#f0f3f6";
    };
  };

  # Ensure Nerd Font is available
  #home.packages = with config.nixpkgs; [
  #  (nerdfonts.override { fonts = [ "FiraCode" ]; })
  #];
}