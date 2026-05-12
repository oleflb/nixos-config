{ pkgs, home, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" "git-firefly" ];

    mutableUserSettings = true;

    userSettings = {
      ui_font_size = 16;
      buffer_font_size = 14;
      buffer_font_family = "JetBrainsMono Nerd Font";

      autosave = "on_focus_change";
      terminal = {
        font_family = "JetBrainsMono Nerd Font";
        copy_on_select = true;
      };

      languages = {
        Nix = {
          language_servers = [ "nixd" ];
        };
      };
    };
  };

  home.packages = [
    pkgs.nixd
    pkgs.nil
  ];
}
