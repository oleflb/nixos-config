{ pkgs, ... }:

{
  services.desktopManager.cosmic.enable = true;
  environment.cosmic.excludePackages = [
    pkgs.cosmic-term
    pkgs.cosmic-edit
  ];
}
