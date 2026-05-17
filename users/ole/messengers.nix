{ pkgs, ... }:

{
  home.packages = [
      pkgs.telegram-desktop
      pkgs.signal-desktop
  ];
}
