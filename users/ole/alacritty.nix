{ pkgs, home, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = { x = 10; y = 10; };
        opacity = 0.9;
      };
      font = {
        size = 12.0;
        normal = { family = "JetBrainsMono Nerd Font"; style = "Regular"; };
      };
    };
  };

  home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
}
