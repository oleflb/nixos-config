{ config, pkgs, ... }:

{
  home.username = "ole";
  home.homeDirectory = "/home/ole";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
  };

  programs.keepassxc.enable = true;

  imports = [
    ./agenix.nix
    ../terminal/alacritty.nix
    ../terminal/fish.nix
    ../terminal/starship.nix
    ../terminal/uv.nix
    ../terminal/xdg.nix
    ../terminal/zoxide.nix
    ../programs/git.nix
    ../programs/packages.nix
    ../programs/rustic.nix
    ../programs/ssh.nix
    ../programs/zed.nix
  ];

  home.packages = with pkgs; [
    nextcloud-client
    dust
  ];

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
}
